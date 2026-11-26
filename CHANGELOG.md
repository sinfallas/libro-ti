# Historial de Cambios (CHANGELOG)

Todos los cambios notables de **Fundamentos de TI: Un recorrido por las excentricidades de un entorno de TI** se documentan en este archivo.

## [Unreleased] — Segunda Edición (2026)

### Añadido
- Manuscrito íntegro de la Segunda Edición (2026) en `manuscrito/00-preliminares.md` a `manuscrito/21-anexo-glosario-comentado.md` (22 archivos modulares: Preliminares, 20 Capítulos en 4 Partes y Glosario comentado de 57 términos; ~52.200 palabras / **134 páginas reales en LibreOffice Writer**), co-escrito mediante entrevistas autorales registradas en `specs/entrevistas-autor.md`.
- Dieciséis diagramas técnicos en `diagramas/*.mmd` renderizados determinísticamente en contenedor offline a PNG de 300 DPI (`Dockerfile.diagramas` + `scripts/render-mermaid.mjs`) e incrustados en `build/Fundamentos_de_TI_2ed.odt`.
- Arquitectura modular *Books as Code* (`manuscrito/`, `diagramas/`, `plantillas/`, `build/`, `specs/`, `fuente-2022/`).
- Skill editorial `.agents/skills/estilo-autor/SKILL.md` con reglas de voz autoral, estructura de 4 bloques, protocolo de micro-entrevistas e higiene Pandoc/ODT.
- Especificaciones editoriales en `specs/mapa-migracion-2022-2026.md`, `specs/indice-maestro.md` (aprobado por el autor para iniciar Fase 3) y `specs/entrevistas-autor.md`.
- Extracción íntegra de referencia en `fuente-2022/edicion-2022-base.md` y generación verificada de `plantillas/referencia.odt` mediante Pandoc real en contenedor.
- Entorno efímero Docker sin root y aislado de red (`Dockerfile.editorial`, `docker-compose.qa.yml`, `scripts/editorial.sh`, `Makefile`, `TESTING.md` y suite BATS `test/editorial.bats` con cobertura `kcov >= 95%`) conforme al estándar QA-11X (Regla Cero), incluyendo subcomandos `qa-lint`, `qa-unit`, `qa-all` y `qa-clean` ejecutables sin GNU `make` en el host, validación estricta ODF 1.2/1.3 + CRC-32 y guarda anti-bloques YAML/separadores `---` fuera de `00-preliminares.md`.

### Cambiado
- Limpieza del directorio raíz reubicando los artefactos históricos de la 1.ª edición (`Fundamentos de TI.pdf`, `perfiles.odt`, `perfiles.txt`, `kanban.txt`, `licencia.png`, `My project-1.png` y `changelog`) bajo `fuente-2022/` con verificación SHA-256.
- Ejecución determinista de `make` y `pandoc` (`pandoc/core:3.6.4` fijado por digest SHA-256) íntegramente dentro de contenedores Docker efímeros no-root.

## [1.0] — 2024-06-29 (1.ª Edición 2022)

### Añadido
- Publicación inicial en repositorio de la primera edición (2022) de *Fundamentos de TI: Un recorrido por las excentricidades de un entorno de TI* (PDF final, borradores ODT/TXT y recursos gráficos bajo licencia CC BY-SA 4.0).
