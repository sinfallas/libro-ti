#!/usr/bin/env bats
# SPDX-License-Identifier: CC-BY-SA-4.0
# Copyright (C) 2026 Jesus A. Palencia S.

setup() {
  export _USER="${_USER:-$(id -un 2>/dev/null || id -u)}"
  load '/opt/bats-libs/bats-support/load.bash'
  load '/opt/bats-libs/bats-assert/load.bash'
  load '/opt/bats-libs/bats-mock/load.bash'

  REPO_ROOT="$(cd "${BATS_TEST_DIRNAME}/.." && pwd)"
  SCRIPT_PATH="${REPO_ROOT}/scripts/editorial.sh"

  SANDBOX="${BATS_TEST_TMPDIR}/sandbox"
  mkdir -p "${SANDBOX}"
  printf "services:\n  editorial:\n    image: libro-ti/editorial:3.6.4\n" >"${SANDBOX}/docker-compose.qa.yml"

  MOCK_DOCKER="$(mock_create)"
  ln -sf "${MOCK_DOCKER}" "${BATS_TEST_TMPDIR}/docker"
  export PATH="${BATS_TEST_TMPDIR}:${PATH}"
  export EDITORIAL_PROJECT_DIR="${SANDBOX}"
  export EDITORIAL_COMPOSE_FILE="${SANDBOX}/docker-compose.qa.yml"
  export EDITORIAL_IMAGE="libro-ti/editorial:3.6.4"
  export DIAGRAMAS_IMAGE="libro-ti/diagramas:1.52.0"
  export QA_UID="1000"
  export QA_GID="1000"
}

@test "editorial.sh sin argumentos muestra ayuda y retorna 0" {
  unset EDITORIAL_PROJECT_DIR EDITORIAL_COMPOSE_FILE QA_UID QA_GID
  run bash "${SCRIPT_PATH}"
  assert_success
  assert_output --partial "Uso: ./scripts/editorial.sh <comando>"
  assert_output --partial "diagramas"
  assert_output --partial "qa-all"
}

@test "editorial.sh --help y -h muestran ayuda sin invocar docker" {
  run bash "${SCRIPT_PATH}" --help
  assert_success
  assert_output --partial "Comandos disponibles"
  assert_equal "$(mock_get_call_num "${MOCK_DOCKER}")" "0"

  run bash "${SCRIPT_PATH}" -h
  assert_success
  assert_output --partial "build-image"
  assert_equal "$(mock_get_call_num "${MOCK_DOCKER}")" "0"
}

@test "editorial.sh falla con codigo 1 cuando falta docker-compose.qa.yml" {
  export EDITORIAL_COMPOSE_FILE="${SANDBOX}/inexistente.yml"
  run bash "${SCRIPT_PATH}" plantilla
  assert_failure 1
  assert_output --partial "ERROR: No se encontro el manifiesto Docker"
  assert_equal "$(mock_get_call_num "${MOCK_DOCKER}")" "0"
}

@test "editorial.sh build-image invoca docker compose build editorial serializado" {
  mock_set_status "${MOCK_DOCKER}" 0 1
  mock_set_output "${MOCK_DOCKER}" "Imagen construida" 1

  run bash "${SCRIPT_PATH}" build-image
  assert_success
  assert_output --partial "Imagen construida"
  assert_equal "$(mock_get_call_num "${MOCK_DOCKER}")" "1"
  assert_equal "$(mock_get_call_args "${MOCK_DOCKER}" 1)" "compose --project-directory ${SANDBOX} -f ${SANDBOX}/docker-compose.qa.yml build editorial"
}

@test "editorial.sh plantilla y odt delegan make no-root sin TTY cuando la imagen existe" {
  for i in 1 2 3 4; do
    mock_set_status "${MOCK_DOCKER}" 0 "${i}"
  done
  export QA_UID="1001"
  export QA_GID="1002"

  run bash "${SCRIPT_PATH}" plantilla
  assert_success
  assert_equal "$(mock_get_call_args "${MOCK_DOCKER}" 1)" "image inspect libro-ti/editorial:3.6.4"
  assert_equal "$(mock_get_call_args "${MOCK_DOCKER}" 2)" "compose --project-directory ${SANDBOX} -f ${SANDBOX}/docker-compose.qa.yml run --rm -T -u 1001:1002 editorial make plantilla"

  run bash "${SCRIPT_PATH}" odt MANUSCRITO_DIR=custom
  assert_success
  assert_equal "$(mock_get_call_args "${MOCK_DOCKER}" 3)" "image inspect libro-ti/editorial:3.6.4"
  assert_equal "$(mock_get_call_args "${MOCK_DOCKER}" 4)" "compose --project-directory ${SANDBOX} -f ${SANDBOX}/docker-compose.qa.yml run --rm -T -u 1001:1002 editorial make odt MANUSCRITO_DIR=custom"
}

@test "editorial.sh diagramas y odt con archivos mmd ejecutan el servicio diagramas" {
  mkdir -p "${SANDBOX}/diagramas"
  printf "flowchart LR\n  A --> B\n" >"${SANDBOX}/diagramas/01-test.mmd"

  mock_set_status "${MOCK_DOCKER}" 1 1
  for i in 2 3 4 5 6 7; do
    mock_set_status "${MOCK_DOCKER}" 0 "${i}"
  done

  run bash "${SCRIPT_PATH}" diagramas
  assert_success
  assert_output --partial "AVISO: Imagen local 'libro-ti/diagramas:1.52.0' no encontrada"
  assert_equal "$(mock_get_call_args "${MOCK_DOCKER}" 1)" "image inspect libro-ti/diagramas:1.52.0"
  assert_equal "$(mock_get_call_args "${MOCK_DOCKER}" 2)" "compose --project-directory ${SANDBOX} -f ${SANDBOX}/docker-compose.qa.yml build diagramas"
  assert_equal "$(mock_get_call_args "${MOCK_DOCKER}" 3)" "compose --project-directory ${SANDBOX} -f ${SANDBOX}/docker-compose.qa.yml run --rm -T -u 1000:1000 diagramas diagramas"

  run bash "${SCRIPT_PATH}" odt
  assert_success
  assert_equal "$(mock_get_call_args "${MOCK_DOCKER}" 5)" "compose --project-directory ${SANDBOX} -f ${SANDBOX}/docker-compose.qa.yml run --rm -T -u 1000:1000 diagramas diagramas"
  assert_equal "$(mock_get_call_args "${MOCK_DOCKER}" 7)" "compose --project-directory ${SANDBOX} -f ${SANDBOX}/docker-compose.qa.yml run --rm -T -u 1000:1000 editorial make odt"

  rm -f "${SANDBOX}/diagramas/01-test.mmd"
  printf "<svg xmlns='http://www.w3.org/2000/svg' width='10' height='10'/>\n" >"${SANDBOX}/diagramas/00-portada.svg"
  for i in 8 9 10 11; do
    mock_set_status "${MOCK_DOCKER}" 0 "${i}"
  done
  run bash "${SCRIPT_PATH}" odt
  assert_success
  assert_equal "$(mock_get_call_args "${MOCK_DOCKER}" 9)" "compose --project-directory ${SANDBOX} -f ${SANDBOX}/docker-compose.qa.yml run --rm -T -u 1000:1000 diagramas diagramas"
}

@test "editorial.sh construye automaticamente editorial si la imagen local no existe" {
  mock_set_status "${MOCK_DOCKER}" 1 1
  mock_set_status "${MOCK_DOCKER}" 0 2
  mock_set_status "${MOCK_DOCKER}" 0 3

  run bash "${SCRIPT_PATH}" check-tools
  assert_success
  assert_output --partial "AVISO: Imagen local 'libro-ti/editorial:3.6.4' no encontrada"
  assert_equal "$(mock_get_call_num "${MOCK_DOCKER}")" "3"
  assert_equal "$(mock_get_call_args "${MOCK_DOCKER}" 1)" "image inspect libro-ti/editorial:3.6.4"
  assert_equal "$(mock_get_call_args "${MOCK_DOCKER}" 2)" "compose --project-directory ${SANDBOX} -f ${SANDBOX}/docker-compose.qa.yml build editorial"
  assert_equal "$(mock_get_call_args "${MOCK_DOCKER}" 3)" "compose --project-directory ${SANDBOX} -f ${SANDBOX}/docker-compose.qa.yml run --rm -T -u 1000:1000 editorial make check-tools"
}

@test "editorial.sh clean, check-tools, help y all delegan sus targets a make en editorial" {
  for i in 1 2 3 4 5 6 7 8; do
    mock_set_status "${MOCK_DOCKER}" 0 "${i}"
  done

  run bash "${SCRIPT_PATH}" clean
  assert_success
  run bash "${SCRIPT_PATH}" check-tools
  assert_success
  run bash "${SCRIPT_PATH}" help
  assert_success
  run bash "${SCRIPT_PATH}" all
  assert_success

  assert_equal "$(mock_get_call_num "${MOCK_DOCKER}")" "8"
  assert_equal "$(mock_get_call_args "${MOCK_DOCKER}" 6)" "compose --project-directory ${SANDBOX} -f ${SANDBOX}/docker-compose.qa.yml run --rm -T -u 1000:1000 editorial make help"
  assert_equal "$(mock_get_call_args "${MOCK_DOCKER}" 8)" "compose --project-directory ${SANDBOX} -f ${SANDBOX}/docker-compose.qa.yml run --rm -T -u 1000:1000 editorial make all"
}

@test "editorial.sh pandoc sin argumentos falla rapido con codigo 2 sin bloquear TTY" {
  run bash "${SCRIPT_PATH}" pandoc
  assert_failure 2
  assert_output --partial "ERROR: El subcomando 'pandoc' requiere argumentos"
  assert_equal "$(mock_get_call_num "${MOCK_DOCKER}")" "0"
}

@test "editorial.sh pandoc reenvia todos los argumentos al servicio aislado pandoc" {
  mock_set_status "${MOCK_DOCKER}" 0 1
  mock_set_output "${MOCK_DOCKER}" "pandoc 3.6.4" 1

  run bash "${SCRIPT_PATH}" pandoc --from=markdown --to=odt -o salida.odt entrada.md
  assert_success
  assert_output --partial "pandoc 3.6.4"
  assert_equal "$(mock_get_call_args "${MOCK_DOCKER}" 1)" "compose --project-directory ${SANDBOX} -f ${SANDBOX}/docker-compose.qa.yml run --rm -T -u 1000:1000 pandoc --from=markdown --to=odt -o salida.odt entrada.md"
}

@test "editorial.sh qa-lint, qa-unit, qa-all y qa-clean operan sin requerir make en el host" {
  mock_set_status "${MOCK_DOCKER}" 0 1
  mock_set_status "${MOCK_DOCKER}" 0 2
  mock_set_status "${MOCK_DOCKER}" 0 3
  mock_set_status "${MOCK_DOCKER}" 0 4
  mock_set_status "${MOCK_DOCKER}" 1 5

  mkdir -p "${SANDBOX}/coverage_report"

  run bash "${SCRIPT_PATH}" qa-lint
  assert_success
  assert_equal "$(mock_get_call_num "${MOCK_DOCKER}")" "1"

  run bash "${SCRIPT_PATH}" qa-unit
  assert_success
  [ -d "${SANDBOX}/.agents/.cache/coverage" ]
  assert_equal "$(mock_get_call_num "${MOCK_DOCKER}")" "2"

  run bash "${SCRIPT_PATH}" qa-all
  assert_success
  assert_equal "$(mock_get_call_num "${MOCK_DOCKER}")" "4"

  run bash "${SCRIPT_PATH}" qa-clean
  assert_success
  [ ! -d "${SANDBOX}/coverage_report" ]
  assert_equal "$(mock_get_call_num "${MOCK_DOCKER}")" "5"
}

@test "editorial.sh rechaza subcomandos invalidos con codigo 2" {
  run bash "${SCRIPT_PATH}" comando-invalido
  assert_failure 2
  assert_output --partial "ERROR: Comando desconocido 'comando-invalido'"
  assert_equal "$(mock_get_call_num "${MOCK_DOCKER}")" "0"
}

@test "plantillas/referencia.odt existe y cumple estructura OpenDocument Text ODF 1.2/1.3" {
  ref_doc="${REPO_ROOT}/plantillas/referencia.odt"
  [ -s "${ref_doc}" ]
  run /usr/bin/python3 -c '
import sys, zipfile
p = sys.argv[1]
assert zipfile.is_zipfile(p), "No es ZIP"
with zipfile.ZipFile(p) as z:
    assert z.testzip() is None, "Error CRC-32 en entradas ZIP"
    infos = z.infolist()
    assert infos and infos[0].filename == "mimetype", "mimetype debe ser la primera entrada"
    assert infos[0].compress_type == zipfile.ZIP_STORED, "mimetype debe almacenarse sin compresion"
    names = {i.filename for i in infos}
    assert "styles.xml" in names, "Falta styles.xml"
    assert "META-INF/manifest.xml" in names, "Falta META-INF/manifest.xml"
    mime = z.read("mimetype").decode("ascii", "ignore").strip()
    assert mime == "application/vnd.oasis.opendocument.text", f"Mimetype inesperado: {mime}"
print("ODT_OK")
' "${ref_doc}"
  assert_success
  assert_output "ODT_OK"
}
