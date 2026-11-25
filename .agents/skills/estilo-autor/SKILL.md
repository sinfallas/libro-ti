---
name: estilo-autor
description: Reglas obligatorias de voz autoral, estructura de 4 bloques, protocolo de anécdotas e higiene Markdown/Pandoc para co-escribir la 2.ª edición (2026) de "Fundamentos de TI: Un recorrido por las excentricidades de un entorno de TI" de Jesús A. Palencia S. Activar SIEMPRE antes de entrevistar, redactar, editar o revisar cualquier archivo en manuscrito/ o specs/.
---

# Skill Editorial: Voz y Arquitectura Autoral — Jesús A. Palencia S. (Edición 2026)

Esta skill gobierna toda co-escritura de **"Fundamentos de TI: Un recorrido por las excentricidades de un entorno de TI" (2.ª Edición, 2026 | CC BY-SA 4.0)**. Ningún capítulo puede redactarse en `manuscrito/` sin cumplir íntegramente estas reglas.

---

## 1. Voz, Postura y Persona Autoral

- **Identidad del narrador:** Profesional veterano de infraestructura, redes, operaciones y ciberseguridad (*"informático de profesión y excéntrico por convicción"*). Habla desde las cicatrices operativas de quien ha administrado cableado, servidores, cortafuegos, presupuestos recortados, auditorías y migraciones reales.
- **Persona gramatical:**
  - **Primera persona singular (`yo`)** para posturas propias, juicios técnicos directos y anécdotas vividas en campo (*"En más de una ocasión me tocó ver..."*, *"Durante años he visto desfilar..."*).
  - **Primera persona del plural cercano (`nosotros`)** cuando se interpela al gremio técnico o se analiza la dinámica interna de un departamento de TI (*"En nuestro entorno solemos olvidar que..."*).
- **Tono:** Directo, pragmático, conversacional pero preciso, con **ironía fina** frente a dos extremos igual de dañinos:
  1. La burocracia corporativa y la gerencia que compra "el último artilugio de moda" creyendo que todos los informáticos hacen exactamente lo mismo.
  2. El ego técnico, el "amiguismo", el ocultamiento de información y el culto a la complejidad innecesaria dentro del propio departamento de TI.
- **Rigor técnico:** La ironía jamás sustituye a la precisión. Todo criterio operativo debe sostenerse en arquitectura verificable, métricas medibles y estándares abiertos (ITIL 4, ISO/IEC 27001, NIST CSF, CIS Controls, OWASP, OpenTelemetry, SRE Workbook), explicados en español claro y natural.

---

## 2. Prohibición Estricta de Tono Enciclopédico y de Proveedor

En la 1.ª edición (2022), el Prefacio y los Capítulos II–IV tenían voz propia y aguda, mientras que el Capítulo V derivó hacia un formato académico tipo FAQ/folleto. En la edición 2026 rigen estas prohibiciones absolutas:

- **Prohibido el estilo Wikipedia o folleto comercial:** No abrir capítulos ni secciones con definiciones de diccionario ni listas acríticas de "beneficios" sin detallar sus costes ocultos, prerrequisitos y fricciones humanas.
- **Prohibidos los subtítulos tipo cuestionario escolar:** Evitar cadenas de encabezados como *"¿Qué es X?"*, *"¿Por qué es importante X?"*, *"¿Qué ventajas ofrece X?"*. Usar títulos con tesis operativa propia.
- **Prohibidas las muletillas sintéticas de IA:** Quedan vetadas expresiones vacías como *"En el vertiginoso panorama digital actual"*, *"Es crucial destacar"*, *"Sin lugar a dudas"*, *"Paradigma holístico"*, *"Sinergia transformadora"* o cierres prefabricados con *"En resumen / En conclusión"*.
- **Contraste de calibración:**
  - ❌ *Incorrecto (enciclopédico):* "DevSecOps promueve una comunicación continua más fluida, la colaboración, la integración y la visibilidad entre desarrollo y seguridad."
  - ✅ *Correcto (voz del autor):* "Llamar DevSecOps a correr un escáner el viernes a las cinco de la tarde y mandarle un PDF de 200 páginas al desarrollador no integra la seguridad: solo automatiza el conflicto entre áreas."

---

## 3. Estructura Obligatoria de 4 Bloques por Capítulo

Salvo el archivo de Preliminares y el Anexo de Glosario, **todo capítulo del manuscrito** debe estructurarse en torno a estos cuatro bloques sustantivos (los títulos exactos pueden matizarse según el tema manteniendo el orden y función editorial):

### Bloque 1 — El concepto sin humo
- Qué es realmente el área, rol, arquitectura o metodología tratada.
- Qué problema concreto de negocio, continuidad o riesgo resuelve (y qué problemas **no** resuelve por mucho que el marketing de proveedores asegure lo contrario).

### Bloque 2 — La teoría vs. la trinchera
- Contraste explícito entre cómo lo diseñan y ejecutan las grandes tecnológicas (FAANG, banca global o corporaciones con equipos hiperespecializados) frente a la realidad cotidiana de **empresas medianas, PyMEs y organizaciones latinoamericanas/hispanas**:
  - Presupuestos defensivos o intermitentes.
  - Deuda técnica heredada y sistemas críticos sin documentación.
  - Equipos reducidos donde 2 o 3 personas cubren las funciones de 7 áreas.
- Incluir al menos una **tabla comparativa clara** cuando ayude a aterrizar las diferencias de escala y alcance.

### Bloque 3 — Excentricidades, antipatrones y crónicas de campo
- Errores clásicos cometidos por la alta dirección no técnica (recortes ciegos, compras por moda, tratar a TI como gasto opaco) y vicios internos del propio personal de TI (silos, "amiguismo" por falta de SLAs, héroes apagafuegos, *Shadow IT / Shadow AI*, secuestro del conocimiento).
- **Integración obligatoria de experiencia real:** Incorporar las anécdotas, vivencias o casos reales aportados por el autor durante la micro-entrevista previa (anonimizando nombres de empresas o terceros cuando corresponda).
- Lista concreta de **señales de alerta temprana** (*síntomas de que el área ya está rota aunque nadie lo admita*).

### Bloque 4 — Marco de acción pragmático
- Métricas e indicadores reales (SLIs, SLOs, KPIs financieros u operativos) que permitan conversar con la gerencia con datos y no con opiniones.
- Estándares abiertos y herramientas concretas de referencia (priorizando software libre/estándares auditables junto a criterios objetivos de selección comercial).
- Pasos ordenados y realistas de adopción incremental (qué estabilizar primero, qué estandarizar después y qué automatizar al final) **sin paralizar la operación diaria**.

---

## 4. Protocolo de Co-Escritura y Captura de Anécdotas (Fase 3)

Nunca redactar capítulos en lote ni rellenar con teoría genérica:

1. **Micro-entrevista previa (3 a 5 preguntas por capítulo):** Antes de escribir un capítulo, formular entre 3 y 5 preguntas incisivas al autor sobre su postura técnica, herramientas preferidas y **explícitamente sobre anécdotas, casos curiosos o "excentricidades" reales vividas en esa área** (tal como enriquecieron la primera edición).
2. **Registro documental:** Guardar íntegras las respuestas del autor en `specs/entrevistas-autor.md` antes de generar el borrador.
3. **Trazabilidad 2022 -> 2026:** Consultar `specs/mapa-migracion-2022-2026.md` y `fuente-2022/edicion-2022-base.md` para rescatar las ideas nucleares y giros propios del autor de 2022, expandiéndolos al contexto tecnológico de 2026.

---

## 5. Higiene Técnica "Books as Code" (Markdown, Mermaid y Pandoc/ODT)

- **Archivos modulares:** Guardar capítulos en `manuscrito/` con numeración de dos dígitos y `kebab-case` sin espacios ni tildes (`00-preliminares.md`, `01-choque-idiomas-negocio-ti.md`, etc.) para compilación determinista en contenedor con `./scripts/editorial.sh odt` (`make odt`).
- **Metadatos YAML y separadores seguros en compilación multi-archivo:**
  - El bloque YAML de metadatos globales (`title`, `subtitle`, `author`, `date: 2026`, `lang: es`, `rights: CC BY-SA 4.0`) debe ubicarse **únicamente al inicio de `manuscrito/00-preliminares.md`**.
  - Queda prohibido incluir bloques de metadatos YAML (`--- ... ---`) en los capítulos `01` a `21`. Para separadores horizontales dentro del texto usar `* * *` (nunca `---`), evitando que Pandoc interprete accidentalmente dos `---` entre archivos concatenados como un bloque YAML y suprima contenido.
- **Jerarquía determinista de encabezados (`--toc-depth=3`):**
  - `#` (`H1`): **Divisor de Parte o Anexo** (`# Parte I — ...`, ubicado únicamente al inicio del archivo que abre cada Parte: `01`, `05`, `14`, `18`, así como `# Preliminares` en `00` y `# Anexo — Referencia Terminológica` en `21`).
  - `##` (`H2`): **Título de Capítulo** (`## Capítulo 1. ...` hasta `## Capítulo 20. ...`, además de `## Créditos y Licencia` y `## Prefacio a la Segunda Edición` en `00` y `## Glosario Técnico Comentado (Sin Humo)` en `21`).
  - `###` (`H3`): **Los 4 bloques estructurales / Subcapítulos numerados** (`### 1.1. El concepto sin humo`, `### 1.2. La teoría vs. la trinchera`, `### 1.3. Excentricidades y antipatrones`, `### 1.4. Marco de acción pragmático`), que conforman el tercer nivel exacto visible en la Tabla de Contenido generada por Pandoc.
  - `####` (`H4`): **Subdivisiones operativas internas** dentro de cada bloque (fuera del TOC para mantener un índice limpio y navegable). Prohibido saltar niveles jerárquicos (ej. pasar de `##` a `####`).
- **Tablas legibles en papel/ODT:** Usar tablas Pipe de Markdown estándar, máximo 4–5 columnas con textos concisos por celda para evitar desbordamientos en página LibreOffice Writer.
- **Diagramas como código:** Guardar la fuente de todo organigrama, arquitectura o flujo en `diagramas/<slug>.mmd` (sintaxis Mermaid limpia, alto contraste y etiquetas en español) y referenciarlo con contexto explicativo en el capítulo.
- **Cero residuos de edición:** Prohibido entregar archivos con `TODO`, `TBD`, `[pendiente]`, citas inventadas, URLs rotas o bloques de código sin identificador de lenguaje.
