# Aseguramiento de Calidad y Compilación en Contenedores (QA-11X)

Este proyecto editorial (*Books as Code*) cumple la **Regla Cero del estándar QA-11X**: ni `make`, ni `pandoc`, ni los linters o suites de prueba requieren instalación en la máquina anfitriona; toda ejecución ocurre dentro de contenedores Docker efímeros, sin privilegios (`cap_drop: [ALL]`, `no-new-privileges:true`, usuario no-root mapeado a `UID:GID` local) y sin red (`network_mode: none`).

## 1. Servicios en `docker-compose.qa.yml`

| Servicio | Imagen / Construcción | Propósito |
| :--- | :--- | :--- |
| `editorial` | `Dockerfile.editorial` (`pandoc/core:3.6.4@sha256:5b8a29...` + GNU `make` + `python3`, `USER 10001`) | Ejecución conjunta de `make` + `pandoc` + validación estructural ZIP/ODT en un contenedor `read_only: true` y `network_mode: none`. |
| `pandoc` | `pandoc/core:3.6.4@sha256:5b8a29d9b70d5d8ca766e5d1dcfc41916b23ab79276a80527be70516110f4c1e` | Invocación directa y aislada del binario oficial `pandoc` sin construir imagen adicional. |
| `qa-bash` | `sinfallas/base-bash-qa@sha256:2d1f579e20ef384e85da839304dbae2d28231fcdc893c21cbe79861b44d675a7` | Auditoría estática (`ShellCheck` + `shfmt -i 2 -ci`) y pruebas unitarias BATS con cobertura `kcov >= 95.0%` rootless. |

## 2. Comandos Editoriales (`make` y `pandoc` en Docker)

Desde el host (sin `make` ni `pandoc` instalados localmente):

```bash
# Construir imagen editorial local (una sola vez)
./scripts/editorial.sh build-image

# Generar o verificar plantillas/referencia.odt con Pandoc real en Docker
./scripts/editorial.sh plantilla

# Compilar manuscrito/*.md ordenados hacia build/Fundamentos_de_TI_2ed.odt
./scripts/editorial.sh odt

# Verificar herramientas dentro del contenedor editorial
./scripts/editorial.sh check-tools

# Limpiar artefactos compilados en build/
./scripts/editorial.sh clean

# Invocar pandoc directamente en su contenedor aislado (requiere argumentos)
./scripts/editorial.sh pandoc --version

# Ejecutar la pirámide QA-11X completa en contenedores sin requerir GNU make en el host
./scripts/editorial.sh qa-lint
./scripts/editorial.sh qa-unit
./scripts/editorial.sh qa-all
./scripts/editorial.sh qa-clean
```

También puede invocarse `docker compose` directamente:

```bash
COMPOSE_PARALLEL_LIMIT=1 docker compose -f docker-compose.qa.yml run --rm -T -u "$(id -u):$(id -g)" editorial make odt
```

## 3. Pirámide de Verificación QA-11X

- **L1 Análisis Estático (`qa-lint`):** `ShellCheck -x` (0 advertencias) + `shfmt -i 2 -ci -d` sobre `scripts/*.sh`, más auditoría estática STIG/OWASP (`audit_security_stig_owasp`).
- **L3 Pruebas Unitarias y Cobertura (`qa-unit`):** Suite `test/editorial.bats` ejecutada con `bats` + `kcov` rootless exigiendo **`>= 95.0%`** de cobertura de líneas en `.agents/.cache/coverage/bash.xml`.
- **Higiene Editorial y Validación ODF 1.2/1.3:** Antes de compilar, `make odt` bloquea bloques YAML o separadores `---` fuera de bloques de código en capítulos posteriores a `00-*` (evitando corrupción silenciosa de metadatos globales en Pandoc). Cada `.odt` generado (`plantillas/referencia.odt` y `build/Fundamentos_de_TI_2ed.odt`) se valida estructuralmente con CRC-32 completo (`ZipFile.testzip()`), `mimetype == application/vnd.oasis.opendocument.text` como primera entrada sin comprimir (`ZIP_STORED`), `styles.xml`, `META-INF/manifest.xml` y `content.xml`.
