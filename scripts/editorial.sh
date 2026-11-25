#!/usr/bin/env bash
# SPDX-License-Identifier: CC-BY-SA-4.0
# Copyright (C) 2026 Jesus A. Palencia S.
# Ejecutor efimero no-root en Docker para GNU Make, Pandoc, Mermaid y QA-11X (Regla Cero).

set -euo pipefail

export COMPOSE_PARALLEL_LIMIT=1

usage() {
  cat <<'EOF'
Uso: ./scripts/editorial.sh <comando> [argumentos...]

Comandos disponibles (ejecutados en contenedores Docker no-root aislados):
  build-image        Construye la imagen local libro-ti/editorial:3.6.4 (Make + Pandoc)
  diagramas          Renderiza diagramas/*.mmd a PNG 300 DPI en contenedor offline
  plantilla          Genera o verifica plantillas/referencia.odt con Pandoc real
  odt [VAR=VAL...]   Renderiza diagramas (si existen) y compila manuscrito/*.md a .odt
  clean              Limpia artefactos compilados en build/
  check-tools        Verifica herramientas disponibles dentro del contenedor editorial
  help               Muestra la ayuda del Makefile desde el contenedor editorial
  all                Alias de 'odt' dentro del contenedor editorial
  pandoc <args...>   Ejecuta 'pandoc' directamente en el contenedor aislado pandoc
  qa-lint            Ejecuta ShellCheck y shfmt en el contenedor aislado qa-bash
  qa-unit            Ejecuta pruebas BATS + cobertura rootless kcov >= 95% en qa-bash
  qa-all             Ejecuta qa-lint seguido de qa-unit en contenedores aislados
  qa-clean           Detiene contenedores efimeros y limpia caches temporales QA
  -h, --help         Muestra esta ayuda y termina
EOF
}

ensure_service_image() {
  local project_dir="$1"
  local compose_file="$2"
  local service_name="$3"
  local image_tag="$4"

  if ! docker image inspect "${image_tag}" >/dev/null 2>&1; then
    printf "AVISO: Imagen local '%s' no encontrada; construyendo servicio '%s'...\n" "${image_tag}" "${service_name}" >&2
    docker compose --project-directory "${project_dir}" -f "${compose_file}" build "${service_name}"
  fi
}

run_diagramas() {
  local project_dir="$1"
  local compose_file="$2"
  local qa_uid="$3"
  local qa_gid="$4"
  local diagramas_image="${DIAGRAMAS_IMAGE:-libro-ti/diagramas:1.52.0}"

  ensure_service_image "${project_dir}" "${compose_file}" "diagramas" "${diagramas_image}"
  docker compose --project-directory "${project_dir}" -f "${compose_file}" \
    run --rm -T -u "${qa_uid}:${qa_gid}" diagramas diagramas
}

run_qa_lint() {
  local project_dir="$1"
  local compose_file="$2"
  local qa_uid="$3"
  local qa_gid="$4"

  docker compose --project-directory "${project_dir}" -f "${compose_file}" \
    run --rm -T -u "${qa_uid}:${qa_gid}" qa-bash \
    bash -c 'mapfile -d "" files < <(find scripts -type f -name "*.sh" -print0); if [ "${#files[@]}" -gt 0 ]; then shellcheck -x "${files[@]}" && shfmt -i 2 -ci -d "${files[@]}"; fi'
}

run_qa_unit() {
  local project_dir="$1"
  local compose_file="$2"
  local qa_uid="$3"
  local qa_gid="$4"

  mkdir -p "${project_dir}/.agents/.cache/coverage"
  docker compose --project-directory "${project_dir}" -f "${compose_file}" \
    run --rm -T -u "${qa_uid}:${qa_gid}" \
    -e _USER=qa \
    -e QA_BATS_TARGETS="${BATS_TARGETS:-}" \
    -e QA_KCOV_PARSE_DIR="${KCOV_PARSE_DIR:-scripts}" \
    -e QA_KCOV_INCLUDE_PATH="${KCOV_INCLUDE_PATH:-scripts}" \
    -e QA_KCOV_EXCLUDE_EXTRA="${KCOV_EXCLUDE_EXTRA:-}" \
    qa-bash \
    bash -c 'set -euo pipefail; kcov_tmp="${QA_KCOV_TMP:-/tmp}"; kcov_out="${QA_KCOV_OUT:-/tmp/kcov-out}"; parse_dir="$(cd "${QA_KCOV_PARSE_DIR:-.}" && pwd)"; include_dir="$(cd "${QA_KCOV_INCLUDE_PATH:-scripts}" && pwd)"; excl="${parse_dir}/test,${parse_dir}/tests,${parse_dir}/.agents/,${parse_dir}/.git/,${parse_dir}/coverage_report/"; if [ -n "${QA_BATS_TARGETS:-}" ]; then read -r -a bats_targets <<<"${QA_BATS_TARGETS}"; else bats_targets=(test); fi; printf "%s\n" "if [[ \"\${KCOV_BASH_XTRACEFD:-}\" =~ ^[0-9]+\$ ]] && [ -p \"/proc/\${BASHPID}/fd/\${KCOV_BASH_XTRACEFD}\" ]; then" "  PS4='\''kcov@\$""{BASH_SOURCE}@\$""{LINENO}@'\''" "  BASH_XTRACEFD=\"\${KCOV_BASH_XTRACEFD}\"" "  set -x" "fi" >"${kcov_tmp}/kcov-env.sh"; printf "#!/usr/bin/env bash\nexport -n BASH_XTRACEFD 2>/dev/null || unset BASH_XTRACEFD\nexport BASH_ENV=\"%s/kcov-env.sh\"\nexec bats \"\$@\"\n" "${kcov_tmp}" >"${kcov_tmp}/run-bats.sh"; chmod +x "${kcov_tmp}/run-bats.sh"; rm -rf "${kcov_out}" coverage_report; rc=0; env -u KCOV_BASH_XTRACEFD -u BASH_XTRACEFD -u BASH_ENV kcov --bash-dont-parse-binary-dir --bash-parse-files-in-dir="${parse_dir}" --include-path="${include_dir}" --exclude-pattern="${excl}" -l 80,95 "${kcov_out}" "${kcov_tmp}/run-bats.sh" "${bats_targets[@]}" >/tmp/bats-tap.log 2>/tmp/kcov-stderr.log || rc=$?; cat /tmp/bats-tap.log; if [ "${rc}" -ne 0 ]; then if ! grep -q "^not ok " /tmp/bats-tap.log 2>/dev/null; then tail -n 40 /tmp/kcov-stderr.log >&2; fi; exit "${rc}"; fi; mkdir -p .agents/.cache/coverage && chmod 0700 .agents/.cache .agents/.cache/coverage; /usr/bin/python3 -c "import json, os, pathlib, re, sys; r = pathlib.Path(sys.argv[1]); out_xml = pathlib.Path(sys.argv[2]); jf = [p for p in sorted(r.rglob(\"coverage.json\")) if not p.parent.is_symlink()]; xf = [p for p in sorted(r.rglob(\"cobertura.xml\")) if not p.parent.is_symlink()]; mxf = [p for p in xf if p.parent.name == \"kcov-merged\"]; src_xml = (mxf[0] if mxf else xf[0]) if xf else None; src_xml is None and sys.exit(1); raw_xml = src_xml.read_text(encoding=\"utf-8\"); san = raw_xml if \"<!ENTITY\" in raw_xml.upper() else re.sub(r\"<!DOCTYPE\s+coverage\s+[^\s[\]<>][^[\]<>]*>\r?\n?\", \"\", raw_xml, flags=re.I); out_xml.write_text(san, encoding=\"utf-8\"); os.chmod(out_xml, 0o600); ds = [json.loads(p.read_text(encoding=\"utf-8\")) for p in jf if p.parent.name == \"kcov-merged\"] or [json.loads(p.read_text(encoding=\"utf-8\")) for p in jf]; tot = sum(int(d.get(\"total_lines\", 0)) for d in ds); cov = sum(int(d.get(\"covered_lines\", 0)) for d in ds); m_v = re.search(r\"<coverage[^>]*lines-valid=.(\d+)\", san); m_r = re.search(r\"<coverage[^>]*line-rate=.([0-9.]+)\", san); pct = ((cov * 100.0 / tot) if tot > 0 else 0.0) if ds else ((float(m_r.group(1)) * 100.0) if (m_r and m_v and int(m_v.group(1)) > 0) else 0.0); print(f\"Cobertura kcov: {pct:.2f}% (umbral >= 95.0%)\"); sys.exit(0 if pct >= 95.0 else 1)" "${kcov_out}" ".agents/.cache/coverage/bash.xml"'
}

run_qa_clean() {
  local project_dir="$1"
  local compose_file="$2"

  docker compose --project-directory "${project_dir}" -f "${compose_file}" down -v >/dev/null 2>&1 || true
  rm -rf "${project_dir}/coverage_report"
}

main() {
  local script_dir
  script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
  local project_dir="${EDITORIAL_PROJECT_DIR:-$(cd "${script_dir}/.." && pwd)}"
  local compose_file="${EDITORIAL_COMPOSE_FILE:-${project_dir}/docker-compose.qa.yml}"
  local editorial_image="${EDITORIAL_IMAGE:-libro-ti/editorial:3.6.4}"
  local qa_uid="${QA_UID:-$(id -u)}"
  local qa_gid="${QA_GID:-$(id -g)}"
  local subcmd="${1:---help}"

  if [[ "${subcmd}" == "-h" || "${subcmd}" == "--help" ]]; then
    usage
    return 0
  fi

  if [[ ! -f "${compose_file}" ]]; then
    printf "ERROR: No se encontro el manifiesto Docker '%s'.\n" "${compose_file}" >&2
    return 1
  fi

  export QA_UID="${qa_uid}"
  export QA_GID="${qa_gid}"

  case "${subcmd}" in
    build-image)
      docker compose --project-directory "${project_dir}" -f "${compose_file}" build editorial
      ;;
    diagramas)
      run_diagramas "${project_dir}" "${compose_file}" "${qa_uid}" "${qa_gid}"
      ;;
    pandoc)
      shift
      if [[ "$#" -eq 0 ]]; then
        printf "ERROR: El subcomando 'pandoc' requiere argumentos (ej. --version o archivos de entrada).\n" >&2
        return 2
      fi
      docker compose --project-directory "${project_dir}" -f "${compose_file}" run --rm -T -u "${qa_uid}:${qa_gid}" pandoc "$@"
      ;;
    all | odt)
      if compgen -G "${project_dir}/diagramas/*.mmd" >/dev/null; then
        run_diagramas "${project_dir}" "${compose_file}" "${qa_uid}" "${qa_gid}"
      fi
      ensure_service_image "${project_dir}" "${compose_file}" "editorial" "${editorial_image}"
      docker compose --project-directory "${project_dir}" -f "${compose_file}" run --rm -T -u "${qa_uid}:${qa_gid}" editorial make "$@"
      ;;
    plantilla | clean | check-tools | help)
      ensure_service_image "${project_dir}" "${compose_file}" "editorial" "${editorial_image}"
      docker compose --project-directory "${project_dir}" -f "${compose_file}" run --rm -T -u "${qa_uid}:${qa_gid}" editorial make "$@"
      ;;
    qa-lint)
      run_qa_lint "${project_dir}" "${compose_file}" "${qa_uid}" "${qa_gid}"
      ;;
    qa-unit)
      run_qa_unit "${project_dir}" "${compose_file}" "${qa_uid}" "${qa_gid}"
      ;;
    qa-all)
      run_qa_lint "${project_dir}" "${compose_file}" "${qa_uid}" "${qa_gid}"
      run_qa_unit "${project_dir}" "${compose_file}" "${qa_uid}" "${qa_gid}"
      ;;
    qa-clean)
      run_qa_clean "${project_dir}" "${compose_file}"
      ;;
    *)
      printf "ERROR: Comando desconocido '%s'. Usa --help para ver opciones validas.\n" "${subcmd}" >&2
      return 2
      ;;
  esac
}

main "$@"
