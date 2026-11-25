# Índice Maestro — Segunda Edición (2026)

**Título:** *Fundamentos de TI: Un recorrido por las excentricidades de un entorno de TI*  
**Autor:** Jesús A. Palencia S.  
**Licencia:** Creative Commons Atribución-CompartirIgual 4.0 Internacional (CC BY-SA 4.0)  
**Estado Editorial:** Aprobado por el autor (Fase 2 completada → Fase 3 habilitada capítulo a capítulo)  
**Arquitectura Editorial:** *Books as Code* (`manuscrito/*.md` + `diagramas/*.mmd` → `build/Fundamentos_de_TI_2ed.odt`)  
**Extensión Objetivo:** 120–160 páginas (estimación proyectada de este índice: **146–156 páginas** / ~154 págs. nominales, ~40.000–45.000 palabras + tablas + 16 diagramas Mermaid).

---

## 1. Presupuesto Editorial y Mapa de Archivos (`manuscrito/`)

| Archivo en `manuscrito/` | Bloque / Capítulo | Págs. est. | Diagrama previsto (`diagramas/`) |
| :--- | :--- | :---: | :--- |
| `00-preliminares.md` | Portadilla, Créditos CC BY-SA 4.0 (2026), TOC, Dedicatoria y Prefacio a la 2.ª Edición | 6 | — |
| **PARTE I** | **El Entorno de TI en 2026: Cultura, Negocio y Fricciones** | **28** | |
| `01-choque-idiomas-negocio-ti.md` | Cap. 1. El choque de idiomas entre Negocio y TI | 7 | `01-bucle-desconfianza-negocio-ti.mmd` |
| `02-deuda-tecnica-obsolescencia-modas.md` | Cap. 2. Deuda técnica, obsolescencia y el último artilugio de moda | 7 | `02-ciclo-deuda-tecnica.mmd` |
| `03-trabajo-hibrido-byod-frontera-diluida.md` | Cap. 3. Del BYOD improvisado al trabajo híbrido y remoto seguro | 7 | `03-frontera-identidad-dispositivo.mmd` |
| `04-de-era-faang-cloud-a-ia-hibrida.md` | Cap. 4. De la fiebre Cloud/FAANG a la era de la IA y la infraestructura híbrida | 7 | `04-evolucion-entorno-2022-2026.mmd` |
| **PARTE II** | **Anatomía, Gobierno y Liderazgo de un Departamento de TI** | **64** | |
| `05-anatomia-departamento-ti-y-equipos.md` | Cap. 5. Anatomía real de TI: 8 dominios, CIO y *Two-Pizza Teams* en PyMEs y LatAm | 7 | `05-organigrama-8-dominios-y-pyme.mmd` |
| `06-ciberseguridad-operativa-secops-ciso.md` | Cap. 6. Ciberseguridad Operativa (CISO y SecOps): Defender la trinchera | 8 | `06-arquitectura-zero-trust-pragmatica.mmd` |
| `07-gobierno-riesgos-cumplimiento-auditoria.md` | Cap. 7. Riesgos, Cumplimiento, Privacidad y Auditoría (GRC, Auditor TI y DPO) | 7 | `07-segregacion-secops-vs-grc.mmd` |
| `08-aplicaciones-empresariales-brm-finops.md` | Cap. 8. Aplicaciones Empresariales (BRM/ERP) y FinOps: El idioma del dinero | 7 | `08-puente-brm-erp-finops.mmd` |
| `09-service-desk-itil4-pragmatico.md` | Cap. 9. Service Desk e ITIL 4 pragmático: El fin del "amiguismo" | 7 | `09-flujo-incidente-vs-solicitud.mmd` |
| `10-redes-comunicaciones-conectividad.md` | Cap. 10. Redes y Comunicaciones: La plomería invisible que sostiene todo | 7 | `10-segmentacion-red-redundante.mmd` |
| `11-sistemas-infraestructura-nube-repatriacion.md` | Cap. 11. Sistemas e Infraestructura: Nube pública, *on-premise* y repatriación | 8 | `11-matriz-decision-carga-hibrida.mmd` |
| `12-gestion-proyectos-estrategia-servicios.md` | Cap. 12. Gestión de Proyectos y Estrategia: Hacer que las cosas terminen | 6 | — |
| `13-arquitectura-software-desarrollo.md` | Cap. 13. Arquitectura de Software y Desarrollo: Gobernar la complejidad | 7 | `13-fronteras-arquitecto-infra-sre.mmd` |
| **PARTE III** | **Metodologías Operativas Modernas (Sin Tono de Folleto)** | **32** | |
| `14-devops-platform-engineering.md` | Cap. 14. DevOps maduro y Platform Engineering | 8 | `14-flujo-gitops-idp.mmd` |
| `15-devsecops-en-la-practica.md` | Cap. 15. DevSecOps en la práctica: Seguridad sin frenar despliegues | 8 | `15-pipeline-devsecops-inmutable.mmd` |
| `16-mlops-llmops-ia-agentica.md` | Cap. 16. De MLOps a LLMOps e IA Agéntica: Gobernanza y realidad operativa | 8 | `16-arquitectura-rag-privado-llmops.mmd` |
| `17-sre-observabilidad-moderna.md` | Cap. 17. SRE y Observabilidad Moderna: Fiabilidad basada en datos | 8 | `17-embudo-sli-slo-error-budget.mmd` |
| **PARTE IV** | **Crónicas de Trincheras, Antipatrones y Supervivencia** | **18** | |
| `18-cronicas-trinchera-postmortems.md` | Cap. 18. Crónicas de trinchera y cultura de *post-mortems* sin culpa | 6 | — |
| `19-defender-presupuestos-ti-ciberseguridad.md` | Cap. 19. Cómo defender presupuestos de infraestructura y seguridad | 6 | — |
| `20-diagnostico-rapido-checklists-epilogo.md` | Cap. 20. Diagnóstico rápido de supervivencia (*Checklists*) y Epílogo 2026 | 6 | — |
| **ANEXO** | **Referencia Terminológica** | **6** | |
| `21-anexo-glosario-comentado.md` | Anexo. Glosario técnico comentado (sin humo) | 6 | — |
| **TOTAL** | **22 archivos modulares (Preliminares + 20 Capítulos + Anexo)** | **154 págs.** | **16 diagramas `.mmd`** |

---

## 2. Estructura Detallada de Contenidos (Capítulos y Subcapítulos)

> **Nota estructural:** Todos los capítulos del 1 al 20 aplican rigurosamente la arquitectura de 4 bloques definida en `.agents/skills/estilo-autor/SKILL.md` (*1. El concepto sin humo*, *2. La teoría vs. la trinchera*, *3. Excentricidades y antipatrones + anécdotas reales*, *4. Marco de acción pragmático*).

---

### Preliminares (`00-preliminares.md`)
- Créditos editoriales, historial de ediciones (2022 → 2026) y declaración abierta **CC BY-SA 4.0**.
- Dedicatoria original conservada a quienes viven dentro de un departamento de TI.
- **Prefacio a la Segunda Edición (2026):** *"Informático de profesión y excéntrico por convicción"* cuatro años después; qué envejeció bien desde 2022, qué promesas tecnológicas estallaron y cómo leer este libro según tu rol.

---

### PARTE I — El Entorno de TI en 2026: Cultura, Negocio y Fricciones

#### Capítulo 1. El choque de idiomas entre Negocio y TI (`01-choque-idiomas-negocio-ti.md`)
- **1.1. El concepto sin humo:** Por qué cada empresa define TI según su propia idea de negocio (evolución del Cap. II de 2022) y por qué hablar en jerga de acrónimos garantiza perder en el directorio.
- **1.2. La teoría vs. la trinchera:** El espejo roto de las dos listas de 2022: TI vista como caja negra lenta y costosa frente a un equipo ahogado apagando incendios sin prioridades claras.
- **1.3. Excentricidades y antipatrones:** El mito gerencial de que *"todos los informáticos hacen lo mismo"*, los proyectos zombis y la trampa de decir que sí a todo por pasillo.
- **1.4. Marco de acción pragmático:** Traducir métricas técnicas (latencia, disponibilidad, parches) a impacto en facturación, riesgo legal y continuidad operativa.

#### Capítulo 2. Deuda técnica, obsolescencia y el síndrome del último artilugio (`02-deuda-tecnica-obsolescencia-modas.md`)
- **2.1. El concepto sin humo:** Deuda técnica prudente vs. negligencia acumulada; obsolescencia real de soporte frente a obsolescencia programada comercial.
- **2.2. La teoría vs. la trinchera:** Renovación de flota y refactorización continua en corporaciones ricas vs. estirar servidores fuera de garantía y ERPs heredados que facturan toda la nómina en una PyME.
- **2.3. Excentricidades y antipatrones:** *Resume-Driven Development* (elegir tecnologías para engordar el currículum), compras por moda dictadas en un almuerzo ejecutivo y secuestro por proveedor (*vendor lock-in*).
- **2.4. Marco de acción pragmático:** Inventario de obsolescencia semafórico, registro de deuda técnica con interés compuesto cuantificado y criterios de amortización.

#### Capítulo 3. Del BYOD improvisado al trabajo híbrido y remoto seguro (`03-trabajo-hibrido-byod-frontera-diluida.md`)
- **3.1. El concepto sin humo:** Qué quedó realmente del teletrabajo pandémico y por qué el perímetro físico murió definitivamente en 2026.
- **3.2. La teoría vs. la trinchera:** Portátiles corporativos gestionados con MDM/Zero-Touch vs. la realidad hispanoamericana del BYOD forzado, enlaces domésticos inestables y soporte remoto a ciegas.
- **3.3. Excentricidades y antipatrones:** La definición utópica de privacidad frente al *bossware* invasivo, mezclar el WhatsApp personal con datos críticos de clientes y equipos familiares infectados conectados por VPN plana.
- **3.4. Marco de acción pragmático:** Contenedores de trabajo aislados, escritorios remotos/VDI livianos, acceso condicional por identidad (MFA resistente a phishing) y política BYOD justa y firmable.

#### Capítulo 4. De la fiebre Cloud/FAANG a la era de la IA y la infraestructura híbrida (`04-de-era-faang-cloud-a-ia-hibrida.md`)
- **4.1. El concepto sin humo:** Por qué tú no eres Netflix ni Google (y por qué imitar su arquitectura a escala pequeña arruina presupuestos y multiplica la complejidad).
- **4.2. La teoría vs. la trinchera:** El dogma *"Cloud-First"* de principios de década frente al despertar financiero 2024–2026: costes de egreso, cambios bruscos de licenciamiento y el nuevo ciclo de la IA generativa.
- **4.3. Excentricidades y antipatrones:** Migrar un monolito roto a la nube esperando que se arregle solo (*Lift & Shift* ciego), microservicios para 50 usuarios concurrentes y comprar "IA mágica" sobre datos sucios.
- **4.4. Marco de acción pragmático:** Matriz de madurez tecnológica realista para decidir cuándo adoptar tendencias y cuándo apostar por tecnología "aburrida" y probada.

---

### PARTE II — Anatomía, Gobierno y Liderazgo de un Departamento de TI

#### Capítulo 5. Anatomía real de un Departamento de TI: 8 dominios, CIO y *Two-Pizza Teams* (`05-anatomia-departamento-ti-y-equipos.md`)
- **5.1. El concepto sin humo:** Kurt Lewin aplicado a TI (*"si quieres entender algo, trata de cambiarlo"*): organigramas planos, transparencia pública de roles y el verdadero papel del CIO/Director de TI.
- **5.2. La teoría vs. la trinchera:** Evolución de las 7 áreas clásicas de 2022 a los **8 dominios modernos**, contrastada con la PyME latinoamericana donde 3 personas asumen múltiples sombreros (*Two-Pizza Teams* tropicalizados y bolsa de técnicos para vacaciones/bajas).
- **5.3. Excentricidades y antipatrones:** Organigramas secretos, jefes cuello de botella, héroes irreemplazables (*bus factor = 1*) y mezclar funciones incompatibles en la misma persona.
- **5.4. Marco de acción pragmático:** Diseño organizacional a 3 años, matriz RACI ligera y reglas mínimas de separación de responsabilidades según tamaño de plantilla (3, 10, 30+ personas).

#### Capítulo 6. Ciberseguridad Operativa (CISO y SecOps): Defender la trinchera en tiempo real (`06-ciberseguridad-operativa-secops-ciso.md`)
- **6.1. El concepto sin humo:** Por qué la seguridad operativa dejó de ser un apéndice del administrador de redes o una casilla del auditor; el rol real del CISO y del equipo SecOps.
- **6.2. La teoría vs. la trinchera:** SOC 24/7 con SIEM/SOAR millonario vs. defender una empresa mediana con presupuesto ajustado aplicando *Zero Trust* gradual, *hardening* base y backups inmutables (regla 3-2-1-1-0).
- **6.3. Excentricidades y antipatrones:** El CISO decorativo sin autoridad para detener un despliegue inseguro, comprar cajas con luces parpadeantes que nadie mira y el falso consuelo del *"somos muy pequeños para que nos ataquen"*.
- **6.4. Marco de acción pragmático:** Higiene esencial (CIS Controls IG1, MFA universal, gestión de parches por criticidad real, segmentación y *playbooks* probados de respuesta ante ransomware).

#### Capítulo 7. Riesgos, Cumplimiento, Privacidad y Auditoría (GRC, Auditor TI y DPO) (`07-gobierno-riesgos-cumplimiento-auditoria.md`)
- **7.1. El concepto sin humo:** La regla de oro de gobierno: **quien administra el sistema no puede auditarse a sí mismo**. Diferencia práctica entre estar seguro (SecOps) y demostrar control del riesgo (GRC, Auditor TI y DPO).
- **7.2. La teoría vs. la trinchera:** Marcos ISO 27001 / SOC 2 / RGPD en multinacionales frente al cumplimiento pragmático de leyes de protección de datos en Latinoamérica/España y auditorías internas con recursos escasos.
- **7.3. Excentricidades y antipatrones:** El "cumplimiento de papel" (políticas copiadas de internet que nadie lee), backups que jamás se probaron restaurando y contratos con proveedores sin cláusula ni plan de salida.
- **7.4. Marco de acción pragmático:** Mapa de riesgos vivos, pruebas semestrales reales de BCP/DRP, inventario de datos personales para el DPO y auditorías TI orientadas a resolver cuellos de botella.

#### Capítulo 8. Aplicaciones Empresariales (BRM/ERP) y FinOps: Hablar el idioma del dinero (`08-aplicaciones-empresariales-brm-finops.md`)
- **8.1. El concepto sin humo:** Del ambiguo *"Gerente Financiero"* de TI en 2022 al binomio moderno: **BRM (*Business Relationship Manager*) / Líder de Aplicaciones (ERP, CRM, BI, BPM, HCM/Nómina)** + disciplina **FinOps**.
- **8.2. La teoría vs. la trinchera:** Ecosistemas ERP integrados con analítica limpia vs. hojas de cálculo paralelas que contradicen al ERP, facturación SaaS descontrolada por tarjeta corporativa y licencias ociosas.
- **8.3. Excentricidades y antipatrones:** Deformar un ERP estándar con miles de parches a medida por negarse a ordenar un proceso roto, opacidad presupuestaria y facturas sorpresa en la nube.
- **8.4. Marco de acción pragmático:** Etiquetado obligatorio de costes, visibilidad unitaria (cuánto cuesta tecnológicamente cada venta/usuario), gobierno de SaaS y regla del 80/20 antes de desarrollar a medida.

#### Capítulo 9. Service Desk e ITIL 4 pragmático: El fin de la informalidad y el "amiguismo" (`09-service-desk-itil4-pragmatico.md`)
- **9.1. El concepto sin humo:** Evolución del *Help Desk* apaga-fuegos a un **Service Desk** como punto único de contacto y termómetro real de la experiencia del usuario interno.
- **9.2. La teoría vs. la trinchera:** ITIL 4 académico de 34 prácticas frente al ITIL 4 de supervivencia (5 prácticas esenciales bien ejecutadas: Incidentes, Solicitudes, Problemas, Cambios y Catálogo de Servicios).
- **9.3. Excentricidades y antipatrones:** El *"amiguismo"* operativo (atender primero a quien cae bien o grita más fuerte), el síndrome del ticket secuestrado en N1 y usar los SLAs para maquillar estadísticas cerrando casos en falso.
- **9.4. Marco de acción pragmático:** Cómo diseñar un Catálogo de Servicios entendible por humanos, matriz Impacto × Urgencia honesta, SLAs/OLAs alcanzables y base de conocimiento de autoservicio.

#### Capítulo 10. Redes y Comunicaciones: La plomería invisible que sostiene todo (`10-redes-comunicaciones-conectividad.md`)
- **10.1. El concepto sin humo:** El verdadero alcance del Administrador/Arquitecto de Redes (LAN, WAN, Wi-Fi denso, SD-WAN, DNS, BGP/proveedores) una vez liberado de formatear PCs o cargar solo con ciberseguridad.
- **10.2. La teoría vs. la trinchera:** Redes definidas por software automatizadas vs. cuartos de comunicaciones heredados tipo "espagueti", redes planas `/16` sin VLANs y caída total por corte de fibra de un único ISP.
- **10.3. Excentricidades y antipatrones:** *"Siempre es culpa de la red"* (y cuando de verdad es el DNS), cambios en routers de borde un viernes sin respaldo de configuración y puntos de acceso domésticos conectados a escondidas.
- **10.4. Marco de acción pragmático:** Segmentación por zonas de confianza, gestión IPAM/DNS seria, redundancia real de última milla (fibra por ductos distintos + 5G/satelital de respaldo) y respaldo automatizado de configuraciones.

#### Capítulo 11. Sistemas e Infraestructura: Nube pública vs. virtualización *on-premise* y repatriación (`11-sistemas-infraestructura-nube-repatriacion.md`)
- **11.1. El concepto sin humo:** Dejar de llamar *"commodity"* despectivamente a la base que mantiene viva la empresa: el rol del Líder de Sistemas e Infraestructura en 2026.
- **11.2. La teoría vs. la trinchera:** Hiperescaladores elásticos vs. el terremoto del licenciamiento de virtualización comercial (era post-compra de VMware), migración hacia KVM/Proxmox/Linux empresarial y cuándo conviene **repatriar cargas estables** de vuelta a *on-premise* o *colocation*.
- **11.3. Excentricidades y antipatrones:** Servidores "mascota" configurados a mano hace ocho años que nadie se atreve a reiniciar, sobredimensionar instancias Cloud 24/7 y confundir RAID con copia de seguridad.
- **11.4. Marco de acción pragmático:** Calculadora honesta TCO a 36 meses (Nube Pública vs. *Colocation* vs. *On-Premise*), estandarización de sistemas base y ciclo reproducible de aprovisionamiento.

#### Capítulo 12. Gestión de Proyectos y Estrategia de Servicios: Hacer que las cosas terminen (`12-gestion-proyectos-estrategia-servicios.md`)
- **12.1. El concepto sin humo:** Por qué en un departamento técnico hace falta liderazgo de proyectos y estrategia (resolviendo la confusión señalada ya en 2022 sobre esta área transversal).
- **12.2. La teoría vs. la trinchera:** Marcos ágiles puros vs. proyectos híbridos reales en TI (donde mudar un centro de datos o cambiar cableado físico tiene dependencias físicas inflexibles que no se resuelven con *post-its*).
- **12.3. Excentricidades y antipatrones:** El gerente de proyectos "preguntador de estatus" que interrumpe tres veces al día, el alcance infinito (*scope creep*) y arrancar compras sin validar arquitectura ni soporte operativo.
- **12.4. Marco de acción pragmático:** Límites estrictos de trabajo en curso (WIP en Kanban), gestión de riesgos pre-proyecto con compras/legal y criterios claros de *"Definición de Terminado y Operable"*.

#### Capítulo 13. Arquitectura de Software y Desarrollo: Gobernar la complejidad (`13-arquitectura-software-desarrollo.md`)
- **13.1. El concepto sin humo:** El Arquitecto de Software como custodio de decisiones difíciles, estándares e integración — no como programador solitario ni atendedor de tickets N1.
- **13.2. La teoría vs. la trinchera:** Microservicios distribuidos y eventos a gran escala vs. monolitos modulares bien diseñados que un equipo de 4 desarrolladores sí puede mantener y depurar a las 3:00 a. m.
- **13.3. Excentricidades y antipatrones:** El *"Arquitecto de Torre de Marfil"* que dibuja cajas y flechas sin tocar código jamás, acoplar sistemas mediante accesos directos a la base de datos del ERP y aceptar código generado por IA sin revisión ni pruebas.
- **13.4. Marco de acción pragmático:** *Architecture Decision Records* (ADRs) breves en Git, contratos de API versionados, pruebas automatizadas de integración y frontera limpia con Infraestructura y SRE (*cada quien en su parcela*).

---

### PARTE III — Metodologías Operativas Modernas (Capítulos Independientes)

#### Capítulo 14. DevOps y Platform Engineering: Del eslogan a la ingeniería de entrega (`14-devops-platform-engineering.md`)
- **14.1. El concepto sin humo:** Qué era realmente DevOps (cultura CAMS + flujo continuo) antes de que el mercado lo convirtiera en un cargo mal pagado de *"administrador de YAML y CI/CD"*, y por qué evolucionó hacia **Platform Engineering**.
- **14.2. La teoría vs. la trinchera:** *Internal Developer Platforms (IDP)* con portales de autoservicio vs. plataformas internas mínimas viables basadas en plantillas GitOps, contenedores reproducibles e Infraestructura como Código (IaC).
- **14.3. Excentricidades y antipatrones:** Crear un *"Departamento de DevOps"* que actúa como un tercer silo entre Desarrollo y Operaciones, pipelines frágiles de 45 minutos y cambios manuales por SSH sobre entornos gestionados con IaC (*configuration drift*).
- **14.4. Marco de acción pragmático:** Las 4 métricas DORA sin vanidad, estandarización de CI/CD, Git como única fuente de verdad y diseño de "caminos pavimentados" (*golden paths*) para equipos pequeños.

#### Capítulo 15. DevSecOps en la práctica: Seguridad integrada sin paralizar despliegues (`15-devsecops-en-la-practica.md`)
- **15.1. El concepto sin humo:** Integrar controles automáticos y diseño seguro desde el primer commit sin convertir a Seguridad en el policía que frena el lanzamiento cinco minutos antes de salir a producción.
- **15.2. La teoría vs. la trinchera:** Suites empresariales CNAPP costosas vs. un pipeline DevSecOps efectivo con herramientas abiertas: detección de secretos pre-commit, pruebas estáticas y dinámicas (**SAST/DAST**) más análisis de dependencias (**SCA**) enfocados en explotabilidad real, SBOM, firma de artefactos e **infraestructura inmutable** sin root.
- **15.3. Excentricidades y antipatrones:** Inundar a desarrollo con 4.000 falsos positivos de severidad "alta", guardar credenciales de producción en variables planas o repositorios y depender de parches manuales sobre contenedores vivos.
- **15.4. Marco de acción pragmático:** Gestión centralizada y rotación de secretos, compuertas de calidad graduadas (*gates* que solo bloquean lo verdaderamente crítico) y programa de *Security Champions* dentro de cada célula.

#### Capítulo 16. De MLOps a LLMOps e IA Agéntica: Gobernanza, datos y realidad económica (`16-mlops-llmops-ia-agentica.md`)
- **16.1. El concepto sin humo:** Del MLOps clásico (modelos predictivos y deriva de datos) al tsunami de **LLMOps y los sistemas agénticos** en 2026: qué cambia cuando el software razona probabilísticamente y ejecuta herramientas.
- **16.2. La teoría vs. la trinchera:** Entrenar modelos propios multimillonarios vs. lo que realmente necesita el 95 % de las empresas: **arquitecturas RAG privadas** sobre datos limpios y con control de acceso, y la decisión crítica entre **inferencia local/privada vs. APIs en la nube**.
- **16.3. Excentricidades y antipatrones:** El ***Shadow AI*** (empleados pegando contratos, código fuente y nóminas en chatbots públicos), proyectos de IA lanzados sobre bases documentales caóticas, inyección de prompts (*prompt injection*) y agentes autónomos con permisos destructivos sin supervisión humana.
- **16.4. Marco de acción pragmático:** Política corporativa de uso seguro de IA, puerta de enlace (*AI Gateway*) con auditoría y límites de gasto por tokens, evaluación continua de respuestas (alucinación/fuga de datos) y barandillas (*guardrails*) para agentes.

#### Capítulo 17. SRE (Site Reliability Engineering) y Observabilidad Moderna (`17-sre-observabilidad-moderna.md`)
- **17.1. El concepto sin humo:** Qué es realmente SRE (aplicar ingeniería de software a los problemas de operaciones y fiabilidad) y por qué **100 % de disponibilidad casi nunca es el objetivo correcto de negocio**.
- **17.2. La teoría vs. la trinchera:** Equipos SRE dedicados al estilo Google frente a la adopción práctica de **SLIs, SLOs, SLAs y Presupuestos de Error** en empresas medianas; del monitoreo reactivo de CPU/disco a la **Observabilidad unificada (métricas, logs estructurados y trazas distribuidas con OpenTelemetry)**.
- **17.3. Excentricidades y antipatrones:** Rebautizar a los sysadmins de siempre como "SRE" sin darles tiempo para automatizar (*toil* del 95 %), paneles llenos de semáforos verdes mientras el usuario no puede pagar (*watermelon effect*) y fatiga de alertas que destruye las guardias nocturnas.
- **17.4. Marco de acción pragmático:** Definir los 3 primeros SLOs atados a viajes críticos del usuario, instrumentar las 4 señales doradas, alerta solo cuando sea accionable y regla de oro para eliminar trabajo repetitivo (*toil*) cada sprint.

---

### PARTE IV — Crónicas de Trincheras, Antipatrones y Supervivencia (Nueva en 2026)

#### Capítulo 18. Crónicas de trinchera y cultura de *post-mortems* sin culpa (`18-cronicas-trinchera-postmortems.md`)
- **18.1. El concepto sin humo:** Por qué despedir al técnico que ejecutó el comando equivocado garantiza que el próximo incidente se esconda debajo de la alfombra: anatomía real de los fallos sistémicos.
- **18.2. La teoría vs. la trinchera (Casos de estudio reales anonimizados):** El *post-mortem* ideal de manual frente a 3–4 crónicas reales nacidas de la experiencia de campo del autor (caídas en cascada, migraciones nocturnas, brechas por exceso de confianza o choques organizacionales), desglosando cronología, causa raíz técnica/humana y lección aprendida.
- **18.3. Excentricidades y antipatrones:** El teatro de la búsqueda de culpables, los informes post-incidente que terminan en *"error humano: tener más cuidado"* y las acciones correctivas que jamás entran al backlog.
- **18.4. Marco de acción pragmático:** Plantilla lista para usar de *Post-Mortem* sin culpa (*Blameless Post-Mortem*) y ritual de seguimiento de acciones preventivas.

#### Capítulo 19. Cómo defender presupuestos de infraestructura y ciberseguridad ante gerencias escépticas (`19-defender-presupuestos-ti-ciberseguridad.md`)
- **19.1. El concepto sin humo:** La paradoja del bombero invisible: cuando Infraestructura y Seguridad hacen un trabajo impecable, la directiva pregunta *"¿para qué les pagamos si nunca pasa nada?"*.
- **19.2. La teoría vs. la trinchera:** Presupuestos plurianuales aprobados por comité de riesgos vs. negociar renovación de switches, licencias o backups con un gerente general que solo aprueba lo que genera ventas visibles mañana.
- **19.3. Excentricidades y antipatrones:** Pedir presupuesto usando terrorismo técnico incomprensible (FUD), inflar cifras "por si me recortan la mitad" o esperar al desastre para conseguir firma de emergencia al triple de precio.
- **19.4. Marco de acción pragmático:** Cómo armar un caso de negocio de 1 página basado en coste de inactividad por hora (RTO/RPO en moneda dura), escenarios de riesgo aceptado firmado por dirección y victorias tempranas autofinanciadas con FinOps.

#### Capítulo 20. Diagnóstico rápido de supervivencia (*Checklists*) y Epílogo 2026 (`20-diagnostico-rapido-checklists-epilogo.md`)
- **20.1. El concepto sin humo:** Auditar la realidad operativa al asumir o rescatar un departamento de TI caótico sin detener el negocio.
- **20.2. La teoría vs. la trinchera:** Consultorías de madurez de seis meses en PDF vs. el mapa real de supervivencia de los **primeros 90 días** con recursos limitados.
- **20.3. Excentricidades y antipatrones:** El síndrome del recién llegado que quiere reescribir y cambiar todo la primera semana ganándose enemigos gratuitos sin entender por qué existen los parches actuales.
- **20.4. Marco de acción pragmático (*Checklists* de diagnóstico rápido en 30 minutos):**
  - Salud de Gobierno, Roles, FinOps y Service Desk.
  - Salud de Redes, Sistemas, Nube Híbrida y Continuidad/Backups.
  - Salud de Ciberseguridad Operativa, Accesos e IA Corporativa.
  - Salud de Entrega de Software, DevSecOps y Observabilidad.
- **20.5. Epílogo a la Segunda Edición:** Reflexión final en primera persona de Jesús A. Palencia S. evolucionando las *Conclusiones* de 2022: la tecnología cambia de nombre cada cinco años, pero las excentricidades humanas siguen decidiendo quién sobrevive.

---

### Anexo (`21-anexo-glosario-comentado.md`)
#### Glosario Técnico Comentado (Sin Humo)
- Reubicación y actualización crítica de los 10 términos originales de 2022 (*TI/IT, ERP, CIO, Two-Pizza Teams, Auditoría Informática, RGPD/Protección de Datos, Docker, Kubernetes, BYOD, FAANG/Big Tech*) junto con ~40 conceptos clave de la edición 2026 (*ADR, BRM, CISO, DevSecOps, DORA, DPO, Error Budget, FinOps, GitOps, GRC, Hardening, IaC, IDP, Infraestructura Inmutable, ITIL 4, LLMOps, Observabilidad, OpenTelemetry, Platform Engineering, Post-Mortem sin culpa, RAG, Repatriación Cloud, RTO/RPO, SAST/DAST/SCA, SBOM, SecOps, Shadow AI, SLA/SLO/SLI, Toil, Zero Trust*, entre otros).
- Cada entrada incluye dos niveles: **Qué significa técnicamente** + **Traducción de trinchera (por qué te importa y dónde suelen venderte humo)**.

---

## 3. Protocolo Activo de Ejecución para Fase 3

Con este Índice Maestro aprobado por el autor, avanzaremos **estrictamente un archivo a la vez**:
1. **Micro-entrevista de autor (3–5 preguntas):** Preguntas concretas sobre tu postura, herramientas preferidas y **anécdotas o experiencias reales de campo** para ese capítulo (registradas en `specs/entrevistas-autor.md`).
2. **Redacción profunda modular:** Escritura del archivo correspondiente en `manuscrito/` (y su diagrama en `diagramas/` cuando aplique) cumpliendo `.agents/skills/estilo-autor/SKILL.md`.
3. **Revisión de diff y compilación verificada:** Aplicación de tus ajustes y ejecución aislada en Docker de `./scripts/editorial.sh odt` (`make odt`) hacia `build/Fundamentos_de_TI_2ed.odt`.
