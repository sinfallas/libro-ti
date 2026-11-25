# SPDX-License-Identifier: CC-BY-SA-4.0
# Makefile — Fundamentos de TI (2.ª Edición, 2026) — Books as Code + QA-11X
# Autor: Jesús A. Palencia S. | Licencia: CC BY-SA 4.0

SHELL := /bin/sh
.DELETE_ON_ERROR:

PROJECT_DIR ?= $(CURDIR)
COMPOSE_FILE ?= docker-compose.qa.yml
SERVICE_NAME ?= qa-bash
EDITORIAL_SERVICE ?= editorial
PANDOC_SERVICE ?= pandoc

PANDOC ?= pandoc
PYTHON ?= python3
DOCKER ?= docker
DOCKER_PANDOC_IMAGE ?= pandoc/core:3.6.4@sha256:5b8a29d9b70d5d8ca766e5d1dcfc41916b23ab79276a80527be70516110f4c1e

QA_UID ?= $(shell id -u)
QA_GID ?= $(shell id -g)
BATS_TARGETS ?=
KCOV_PARSE_DIR ?= scripts
KCOV_INCLUDE_PATH ?= scripts
KCOV_EXCLUDE_EXTRA ?=
export QA_UID QA_GID

MANUSCRITO_DIR ?= manuscrito
BUILD_DIR ?= build
PLANTILLAS_DIR ?= plantillas

REF_DOC ?= $(PLANTILLAS_DIR)/referencia.odt
OUT_ODT ?= $(BUILD_DIR)/Fundamentos_de_TI_2ed.odt
RESOURCE_PATH ?= .:$(MANUSCRITO_DIR):diagramas:fuente-2022

PANDOC_FLAGS := \
	--from=markdown \
	--to=odt \
	--standalone \
	--metadata=lang:es \
	--toc \
	--toc-depth=3 \
	--reference-doc="$(REF_DOC)" \
	--resource-path="$(RESOURCE_PATH)"

# Valida estructura OpenDocument Text v1.2/v1.3 (mimetype inicial sin comprimir, XML y CRC-32 íntegros)
define VALIDATE_ODT
	@if [ ! -s "$(1)" ]; then \
		echo "ERROR: El archivo ODT '$(1)' está vacío o no se generó." >&2; \
		rm -f "$(1)"; \
		exit 1; \
	fi
	@if command -v "$(PYTHON)" >/dev/null 2>&1; then \
		"$(PYTHON)" -c 'import sys, zipfile; p, req_content = sys.argv[1], sys.argv[2] == "1"; z = zipfile.ZipFile(p) if zipfile.is_zipfile(p) else None; infos = z.infolist() if z else []; names = {i.filename for i in infos}; bad_crc = z.testzip() if z else "bad"; mime = z.read("mimetype").decode("ascii", "ignore").strip() if "mimetype" in names else ""; z and z.close(); first_ok = bool(infos) and infos[0].filename == "mimetype" and infos[0].compress_type == zipfile.ZIP_STORED; valid = bad_crc is None and first_ok and mime == "application/vnd.oasis.opendocument.text" and "styles.xml" in names and "META-INF/manifest.xml" in names and (not req_content or "content.xml" in names); sys.exit(0 if valid else 1)' "$(1)" "$(2)" 2>/dev/null || { \
			echo "ERROR: '$(1)' no es un documento OpenDocument Text (.odt) íntegro conforme a ODF." >&2; \
			rm -f "$(1)"; \
			exit 1; \
		}; \
	fi
endef

.PHONY: all odt plantilla _validate_and_move_ref clean check-tools help \
	docker-build docker-plantilla docker-odt docker-clean docker-check-tools \
	qa-lint qa-unit qa-all clean-cache qa-clean

all: odt

help:
	@echo "Comandos disponibles (Books as Code — Fundamentos de TI 2.ª Ed.):"
	@echo "  ./scripts/editorial.sh build-image  Construye imagen Docker no-root (Make + Pandoc)"
	@echo "  ./scripts/editorial.sh plantilla    Genera o valida $(REF_DOC) desde Pandoc en Docker"
	@echo "  ./scripts/editorial.sh odt          Compila $(MANUSCRITO_DIR)/*.md hacia $(OUT_ODT)"
	@echo "  ./scripts/editorial.sh clean        Limpia artefactos compilados en $(BUILD_DIR)/"
	@echo "  ./scripts/editorial.sh check-tools  Verifica herramientas dentro del contenedor"
	@echo "  ./scripts/editorial.sh qa-all       Ejecuta qa-lint + qa-unit (kcov >= 95%) en Docker"
	@echo "  Targets QA-11X: qa-lint | qa-unit | qa-all | qa-clean"

plantilla:
	@set -e; \
	if [ -s "$(REF_DOC)" ]; then \
		if command -v "$(PYTHON)" >/dev/null 2>&1 && ! "$(PYTHON)" -c 'import sys, zipfile; p = sys.argv[1]; z = zipfile.ZipFile(p) if zipfile.is_zipfile(p) else None; infos = z.infolist() if z else []; names = {i.filename for i in infos}; bad_crc = z.testzip() if z else "bad"; mime = z.read("mimetype").decode("ascii", "ignore").strip() if "mimetype" in names else ""; z and z.close(); first_ok = bool(infos) and infos[0].filename == "mimetype" and infos[0].compress_type == zipfile.ZIP_STORED; sys.exit(0 if (bad_crc is None and first_ok and mime == "application/vnd.oasis.opendocument.text" and "styles.xml" in names and "META-INF/manifest.xml" in names) else 1)' "$(REF_DOC)" 2>/dev/null; then \
			echo "AVISO: $(REF_DOC) está corrupto; regenerando..." >&2; \
			rm -f "$(REF_DOC)"; \
		fi; \
	fi; \
	if [ ! -s "$(REF_DOC)" ]; then \
		mkdir -p "$(PLANTILLAS_DIR)"; \
		rm -f "$(REF_DOC)" "$(REF_DOC).tmp"; \
		echo "Generando plantilla base ODT en $(REF_DOC)..."; \
		if command -v "$(PANDOC)" >/dev/null 2>&1; then \
			"$(PANDOC)" --print-default-data-file reference.odt > "$(REF_DOC).tmp" || { rm -f "$(REF_DOC).tmp"; exit 1; }; \
		elif command -v "$(DOCKER)" >/dev/null 2>&1 && [ -f "$(PROJECT_DIR)/$(COMPOSE_FILE)" ]; then \
			COMPOSE_PARALLEL_LIMIT=1 "$(DOCKER)" compose --project-directory "$(PROJECT_DIR)" -f "$(COMPOSE_FILE)" \
				run --rm -T -u "$(QA_UID):$(QA_GID)" "$(PANDOC_SERVICE)" --print-default-data-file reference.odt > "$(REF_DOC).tmp" || { rm -f "$(REF_DOC).tmp"; exit 1; }; \
		else \
			echo "ERROR: No se puede generar $(REF_DOC) sin 'pandoc' ni Docker Compose." >&2; \
			exit 127; \
		fi; \
	else \
		echo "Plantilla ODT verificada: $(REF_DOC)"; \
	fi
	@if [ -f "$(REF_DOC).tmp" ]; then \
		"$(MAKE)" --no-print-directory _validate_and_move_ref PLANTILLAS_DIR="$(PLANTILLAS_DIR)" REF_DOC="$(REF_DOC)"; \
	fi

_validate_and_move_ref:
	$(call VALIDATE_ODT,$(REF_DOC).tmp,0)
	@mv "$(REF_DOC).tmp" "$(REF_DOC)"

odt:
	@set -e; LC_ALL=C; set -- "$(MANUSCRITO_DIR)"/*.md; \
	if [ ! -e "$$1" ]; then \
		echo "ERROR: No se encontraron capítulos (*.md) en '$(MANUSCRITO_DIR)/' para compilar." >&2; \
		exit 2; \
	fi; \
	if command -v "$(PYTHON)" >/dev/null 2>&1; then \
		"$(PYTHON)" -c 'import pathlib, re, sys; fr = re.compile(r"^\s*(`{3,}|~{3,})"); bad = []; [None for a in sys.argv[1:] if not pathlib.Path(a).name.startswith("00-") for st in [[False, ""]] for i, ln in enumerate(pathlib.Path(a).read_text(encoding="utf-8").splitlines(), 1) for m in [fr.match(ln)] for _ in ([st.__setitem__(0, True), st.__setitem__(1, m.group(1)[0]*len(m.group(1)))] if (m and not st[0]) else ([st.__setitem__(0, False), st.__setitem__(1, "")] if (m and ln.lstrip().startswith(st[1])) else ([bad.append(f"{a}:{i}")] if (not m and not st[0] and ln.strip() == "---") else [])))]; bad and (sys.stderr.write("ERROR: Bloques YAML o separadores '\''---'\'' prohibidos fuera de 00-preliminares.md (usa '\''* * *'\''): " + ", ".join(bad) + "\n"), sys.exit(3))' "$$@"; \
	fi; \
	"$(MAKE)" --no-print-directory PLANTILLAS_DIR="$(PLANTILLAS_DIR)" REF_DOC="$(REF_DOC)" plantilla; \
	mkdir -p "$(BUILD_DIR)"; \
	rm -f "$(OUT_ODT).tmp"; \
	echo "Compilando capítulos: $$* -> $(OUT_ODT)"; \
	if command -v "$(PANDOC)" >/dev/null 2>&1; then \
		"$(PANDOC)" $(PANDOC_FLAGS) -o "$(OUT_ODT).tmp" "$$@" || { rc=$$?; rm -f "$(OUT_ODT).tmp"; exit $$rc; }; \
	elif command -v "$(DOCKER)" >/dev/null 2>&1 && [ -f "$(PROJECT_DIR)/$(COMPOSE_FILE)" ]; then \
		COMPOSE_PARALLEL_LIMIT=1 "$(DOCKER)" compose --project-directory "$(PROJECT_DIR)" -f "$(COMPOSE_FILE)" \
			run --rm -T -u "$(QA_UID):$(QA_GID)" "$(PANDOC_SERVICE)" $(PANDOC_FLAGS) -o "$(OUT_ODT).tmp" "$$@" || { rc=$$?; rm -f "$(OUT_ODT).tmp"; exit $$rc; }; \
	else \
		echo "ERROR: 'pandoc' no está disponible. Ejecuta vía ./scripts/editorial.sh en Docker." >&2; \
		exit 127; \
	fi
	$(call VALIDATE_ODT,$(OUT_ODT).tmp,1)
	@mv "$(OUT_ODT).tmp" "$(OUT_ODT)"
	@echo "Compilación completada: $(OUT_ODT)"

clean:
	@mkdir -p "$(BUILD_DIR)"
	rm -f "$(BUILD_DIR)"/*.odt "$(BUILD_DIR)"/*.pdf "$(BUILD_DIR)"/*.epub "$(BUILD_DIR)"/*.tmp "$(PLANTILLAS_DIR)"/*.tmp
	@echo "Artefactos limpiados en $(BUILD_DIR)/."

check-tools:
	@for tool in pandoc make python3 sh unzip; do \
		if command -v "$$tool" >/dev/null 2>&1; then \
			printf "  [OK]      %-12s -> %s\n" "$$tool" "$$(command -v "$$tool")"; \
		else \
			printf "  [FALTA]   %-12s\n" "$$tool"; \
		fi; \
	done

docker-build:
	@COMPOSE_PARALLEL_LIMIT=1 docker compose --project-directory "$(PROJECT_DIR)" -f "$(COMPOSE_FILE)" build "$(EDITORIAL_SERVICE)"

docker-plantilla:
	@COMPOSE_PARALLEL_LIMIT=1 docker compose --project-directory "$(PROJECT_DIR)" -f "$(COMPOSE_FILE)" run --rm -T -u "$(QA_UID):$(QA_GID)" "$(EDITORIAL_SERVICE)" make plantilla

docker-odt:
	@COMPOSE_PARALLEL_LIMIT=1 docker compose --project-directory "$(PROJECT_DIR)" -f "$(COMPOSE_FILE)" run --rm -T -u "$(QA_UID):$(QA_GID)" "$(EDITORIAL_SERVICE)" make odt

docker-clean:
	@COMPOSE_PARALLEL_LIMIT=1 docker compose --project-directory "$(PROJECT_DIR)" -f "$(COMPOSE_FILE)" run --rm -T -u "$(QA_UID):$(QA_GID)" "$(EDITORIAL_SERVICE)" make clean

docker-check-tools:
	@COMPOSE_PARALLEL_LIMIT=1 docker compose --project-directory "$(PROJECT_DIR)" -f "$(COMPOSE_FILE)" run --rm -T -u "$(QA_UID):$(QA_GID)" "$(EDITORIAL_SERVICE)" make check-tools

qa-lint:
	@echo "🔍 [11X] Ejecutando Linter y Formateo (ShellCheck + shfmt)..."
	@docker compose --project-directory "$(PROJECT_DIR)" -f "$(COMPOSE_FILE)" run --rm -T -u "$(QA_UID):$(QA_GID)" $(SERVICE_NAME) bash -c "mapfile -d '' files < <(find scripts -type f -name '*.sh' -print0); if [ \$${#files[@]} -gt 0 ]; then shellcheck -x \"\$${files[@]}\" && shfmt -i 2 -ci -d \"\$${files[@]}\"; fi"

qa-unit:
	@echo "🧪 [11X] Ejecutando Pruebas Unitarias y Cobertura >= 95% (BATS + kcov rootless)..."
	@mkdir -p .agents/.cache/coverage
	@docker compose --project-directory "$(PROJECT_DIR)" -f "$(COMPOSE_FILE)" run --rm -T -u "$(QA_UID):$(QA_GID)" -e _USER=qa -e QA_BATS_TARGETS="$(BATS_TARGETS)" -e QA_KCOV_PARSE_DIR="$(KCOV_PARSE_DIR)" -e QA_KCOV_INCLUDE_PATH="$(KCOV_INCLUDE_PATH)" -e QA_KCOV_EXCLUDE_EXTRA="$(KCOV_EXCLUDE_EXTRA)" $(SERVICE_NAME) bash -c 'set -euo pipefail; kcov_tmp="$${QA_KCOV_TMP:-/tmp}"; kcov_out="$${QA_KCOV_OUT:-/tmp/kcov-out}"; parse_dir="$$(cd "$${QA_KCOV_PARSE_DIR:-.}" && pwd)"; include_dir="$$(cd "$${QA_KCOV_INCLUDE_PATH:-scripts}" && pwd)"; excl="$${parse_dir}/test,$${parse_dir}/tests,$${parse_dir}/.agents/,$${parse_dir}/.git/,$${parse_dir}/coverage_report/"; if [ -n "$${QA_BATS_TARGETS:-}" ]; then read -r -a bats_targets <<<"$${QA_BATS_TARGETS}"; else bats_targets=(test); fi; printf "%s\n" "if [[ \"\$${KCOV_BASH_XTRACEFD:-}\" =~ ^[0-9]+\$$ ]] && [ -p \"/proc/\$${BASHPID}/fd/\$${KCOV_BASH_XTRACEFD}\" ]; then" "  PS4='\''kcov@\$$""{BASH_SOURCE}@\$$""{LINENO}@'\''" "  BASH_XTRACEFD=\"\$${KCOV_BASH_XTRACEFD}\"" "  set -x" "fi" >"$${kcov_tmp}/kcov-env.sh"; printf "#!/usr/bin/env bash\nexport -n BASH_XTRACEFD 2>/dev/null || unset BASH_XTRACEFD\nexport BASH_ENV=\"%s/kcov-env.sh\"\nexec bats \"\$$@\"\n" "$${kcov_tmp}" >"$${kcov_tmp}/run-bats.sh"; chmod +x "$${kcov_tmp}/run-bats.sh"; rm -rf "$${kcov_out}" coverage_report; rc=0; env -u KCOV_BASH_XTRACEFD -u BASH_XTRACEFD -u BASH_ENV kcov --bash-dont-parse-binary-dir --bash-parse-files-in-dir="$${parse_dir}" --include-path="$${include_dir}" --exclude-pattern="$${excl}" -l 80,95 "$${kcov_out}" "$${kcov_tmp}/run-bats.sh" "$${bats_targets[@]}" >/tmp/bats-tap.log 2>/tmp/kcov-stderr.log || rc=$$?; cat /tmp/bats-tap.log; if [ "$${rc}" -ne 0 ]; then if ! grep -q "^not ok " /tmp/bats-tap.log 2>/dev/null; then tail -n 40 /tmp/kcov-stderr.log >&2; fi; exit "$${rc}"; fi; mkdir -p .agents/.cache/coverage && chmod 0700 .agents/.cache .agents/.cache/coverage; /usr/bin/python3 -c "import json, os, pathlib, re, sys; r = pathlib.Path(sys.argv[1]); out_xml = pathlib.Path(sys.argv[2]); jf = [p for p in sorted(r.rglob(\"coverage.json\")) if not p.parent.is_symlink()]; xf = [p for p in sorted(r.rglob(\"cobertura.xml\")) if not p.parent.is_symlink()]; mxf = [p for p in xf if p.parent.name == \"kcov-merged\"]; src_xml = (mxf[0] if mxf else xf[0]) if xf else None; src_xml is None and sys.exit(1); raw_xml = src_xml.read_text(encoding=\"utf-8\"); san = raw_xml if \"<!ENTITY\" in raw_xml.upper() else re.sub(r\"<!DOCTYPE\s+coverage\s+[^\s[\]<>][^[\]<>]*>\r?\n?\", \"\", raw_xml, flags=re.I); out_xml.write_text(san, encoding=\"utf-8\"); os.chmod(out_xml, 0o600); ds = [json.loads(p.read_text(encoding=\"utf-8\")) for p in jf if p.parent.name == \"kcov-merged\"] or [json.loads(p.read_text(encoding=\"utf-8\")) for p in jf]; tot = sum(int(d.get(\"total_lines\", 0)) for d in ds); cov = sum(int(d.get(\"covered_lines\", 0)) for d in ds); m_v = re.search(r\"<coverage[^>]*lines-valid=.(\d+)\", san); m_r = re.search(r\"<coverage[^>]*line-rate=.([0-9.]+)\", san); pct = ((cov * 100.0 / tot) if tot > 0 else 0.0) if ds else ((float(m_r.group(1)) * 100.0) if (m_r and m_v and int(m_v.group(1)) > 0) else 0.0); print(f\"Cobertura kcov: {pct:.2f}% (umbral >= 95.0%)\"); sys.exit(0 if pct >= 95.0 else 1)" "$${kcov_out}" ".agents/.cache/coverage/bash.xml"'

qa-all: qa-lint qa-unit

clean-cache:
	@docker compose --project-directory "$(PROJECT_DIR)" -f "$(COMPOSE_FILE)" down -v >/dev/null 2>&1 || true
	@rm -rf coverage_report/ 2>/dev/null || true

qa-clean: clean-cache
