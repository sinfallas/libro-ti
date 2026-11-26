# Anexo — Referencia Terminológica

## Glosario Técnico Comentado (Sin Humo)

En la primera edición de 2022 abrí el libro con diez definiciones sueltas que servían de punto de partida. En esta edición reubicamos aquel vocabulario al lugar donde realmente resulta útil como herramienta de consulta rápida y lo multiplicamos hasta cubrir cincuenta términos esenciales de 2026.

Cada entrada respeta una regla doble: primero **qué significa con precisión técnica**, y enseguida **la traducción de trinchera** (por qué debería importarte un lunes real y dónde suelen venderte humo con esa palabra).

* * *

- **ADR (*Architecture Decision Record*):** Documento breve en texto plano guardado junto al código fuente que registra el contexto, la decisión técnica tomada y sus consecuencias aceptadas. *En la trinchera:* El antídoto más barato para que dentro de dos años nadie pregunte *"¿quién fue el demente que diseñó esto así?"* (incluso cuando ese demente fuiste tú mismo).

- **AI Gateway (*Puerta de Enlace de IA*):** Capa intermedia centralizada (como *LiteLLM*) que gobierna, audita y limita todas las consultas de usuarios y aplicaciones hacia modelos de inteligencia artificial locales o en la nube. *En la trinchera:* El fusible financiero y de seguridad que evita que un bucle mal programado queme mil dólares en *tokens* un domingo o que cada área reparta llaves maestras sin control.

- **API (*Application Programming Interface*):** Contrato formal de comunicación que permite a dos sistemas intercambiar datos u órdenes sin conocer ni tocar las entrañas internas del otro. *En la trinchera:* La única puerta civilizada para integrar software; si alguien te propone "integrar rápido" leyendo directamente las tablas internas de otra base de datos, huye.

- **Auditoría Informática:** Revisión crítica, metódica e independiente de los sistemas, procesos y controles de información de una empresa para verificar su integridad, eficiencia, seguridad y apego normativo. *En la trinchera:* Cuando se hace en campo y sin conflicto de interés destraba presupuestos vitales; cuando la firma la misma persona que administra los servidores, es autoengaño certificado.

- **BCP y DRP (*Business Continuity Plan* / *Disaster Recovery Plan*):** El *BCP* define cómo sigue operando el negocio durante una contingencia mayor; el *DRP* detalla el procedimiento técnico exacto para restaurar la infraestructura y los datos tras un desastre. *En la trinchera:* Un *DRP* que jamás se ejecutó con cronómetro en mano es apenas una novela optimista guardada en un cajón.

- **Bossware:** Programas invasivos de vigilancia laboral que capturan pantallas, pulsaciones de teclado, audio o movimientos de ratón del trabajador remoto. *En la trinchera:* El síntoma inequívoco de una jefatura incapaz de medir resultados reales; destruye el talento honesto y resulta inaceptable sobre dispositivos pagados por el propio empleado.

- **BRM (*Business Relationship Manager*):** Rol puente encargado de alinear las necesidades funcionales de las unidades de negocio (*contabilidad, ventas, logística, RR. HH.*) con las aplicaciones empresariales y el equipo técnico. *En la trinchera:* Quien evita que TI programe en el vacío y que el negocio deforme el *ERP* por negarse a ordenar sus procesos.

- **Bus Factor (*Factor Autobús*):** Número mínimo de integrantes del equipo cuya ausencia repentina dejaría un sistema o departamento completamente paralizado por falta de conocimiento compartido o accesos. *En la trinchera:* Si el número es `1`, no tienes un empleado estrella: tienes a toda la empresa de rehén dentro de una sola cabeza.

- **BYOD (*Bring Your Own Device*):** Política laboral donde los colaboradores utilizan sus propios dispositivos personales (portátiles o teléfonos) para acceder a recursos de trabajo. *En la trinchera:* Sin cápsulas aisladas y límites claros de privacidad y soporte, suele ser un eufemismo elegante para ahorrar en computadoras e importar virus domésticos a la red interna.

- **CAPEX vs. OPEX:** *Capital Expenditure* (inversión en activos físicos amortizables en varios años) frente a *Operational Expenditure* (gasto operativo corriente deducible mes a mes, como alquileres o suscripciones). *En la trinchera:* Saber cuál de los dos le conviene más este trimestre a tu director financiero vale más que cincuenta argumentos técnicos al defender un presupuesto.

- **CIO (*Chief Information Officer*):** Director de Sistemas o máxima autoridad ejecutiva responsable de la estrategia, el gobierno y la operación tecnológica de una organización. *En la trinchera:* Director de orquesta con cicatrices técnicas para no tragar humo comercial, pero con las manos fuera del teclado diario y la vista puesta a tres años.

- **CIS Controls (IG1):** Conjunto abierto y priorizado de salvaguardas prácticas de ciberseguridad mantenido por el *Center for Internet Security*; su Grupo de Implementación 1 (*IG1*) define la higiene esencial obligatoria para cualquier organización. *En la trinchera:* Tu hoja de ruta realista cuando no tienes el presupuesto de un banco suizo pero quieres cerrar hoy el noventa por ciento de las puertas fáciles.

- **CISA KEV (*Known Exploited Vulnerabilities*):** Catálogo público oficial mantenido por la agencia *CISA* que lista únicamente aquellas vulnerabilidades de software que están siendo explotadas de forma activa por criminales reales en el mundo. *En la trinchera:* El filtro que te salva de morir ahogado en PDFs de cuatro mil alertas teóricas: si aparece aquí, se parchea en cuarenta y ocho horas sin discusión.

- **CISO (*Chief Information Security Officer*):** Responsable ejecutivo de la seguridad de la información y líder de la estrategia y defensa operativa (*SecOps*). *En la trinchera:* Si no tiene autoridad formal para frenar un despliegue inseguro (o exigir acta de riesgo firmada por dirección), solo lo contrataron para tener a quién despedir el día del incidente.

- **Clean Core (*Núcleo Limpio*):** Doctrina de gobierno de *ERP* que prohíbe modificar el código fuente base del sistema estándar, adaptando los procesos comunes al software y aislando extensiones diferenciales vía *APIs* externas. *En la trinchera:* La diferencia entre actualizar tu *ERP* en un fin de semana tranquilo o quedar congelado diez años en una versión obsoleta.

- **Configuration Drift (*Deriva de Configuración*):** Divergencia silenciosa entre la configuración declarada en los archivos de código de infraestructura y el estado real de los servidores tras realizar cambios manuales directos. *En la trinchera:* El regalo envenenado que deja quien entra por *SSH* a medianoche *"solo para tocar una línea rápida"* sin pasarla a Git.

- **DAST (*Dynamic Application Security Testing*):** Pruebas automáticas de seguridad tipo "caja negra" ejecutadas desde afuera contra una aplicación ya encendida (por ejemplo, con *OWASP ZAP*) para detectar fallos en tiempo de ejecución. *En la trinchera:* El complemento indispensable del análisis de código, porque hay errores de sesiones y permisos que solo asoman cuando el servidor respira de verdad.

- **Deuda Técnica:** Costo futuro de retrabajo generado al elegir una solución rápida y limitada hoy en lugar de un diseño limpio que tomaría más tiempo. *En la trinchera:* Con registro y fecha de pago es una herramienta financiera legítima; sin plan de amortización ni documentación es simple chapuza acumulada con interés compuesto.

- **DevOps:** Filosofía cultural y conjunto de prácticas de ingeniería (*CAMS*) que integran desarrollo y operaciones mediante automatización, medición y responsabilidad compartida de punta a punta. *En la trinchera:* Una forma de trabajar entre áreas, jamás un pobre individuo solitario contratado para arreglar archivos YAML ajenos.

- **DevSecOps:** Integración automatizada de controles de diseño seguro, verificación de código, gestión de secretos e inmutabilidad a lo largo de todo el ciclo de entrega de software. *En la trinchera:* Poner barandillas tempranas de segundos en vez de caer como policía aduanero veinticuatro horas antes de salir a producción.

- **Docker / Contenedores OCI:** Tecnología abierta que empaqueta una aplicación junto con todas sus librerías y dependencias en una unidad aislada, ligera y reproducible sobre el núcleo del sistema operativo. *En la trinchera:* El fin bendito de la excusa *"en mi máquina sí funcionaba"*, siempre que no arruines todo corriéndolo como `root` y parchándolo a mano por dentro.

- **DORA Metrics:** Las cuatro métricas estándar que miden el rendimiento real de entrega y estabilidad de software: tiempo de entrega, frecuencia de despliegue, tasa de fallos por cambio y tiempo medio de recuperación (*MTTR*). *En la trinchera:* El detector de mentiras contra quienes presumen desplegar veinte veces por día rompiendo producción en diez de ellas.

- **DPO (*Data Protection Officer*):** Delegado de Protección de Datos encargado de supervisar de manera independiente el cumplimiento de normativas de privacidad (*RGPD* y leyes nacionales equivalentes). *En la trinchera:* La voz sensata que recuerda que acumular datos personales innecesarios no es un activo comercial, sino un pasivo legal explosivo.

- **Egress Fees (*Cargos por Salida de Datos*):** Tarifas que cobran los proveedores de nube pública por cada gigabyte transferido desde sus centros de datos hacia internet u otro proveedor. *En la trinchera:* La letra pequeña del hotel de lujo donde entrar con diez valijas es gratis, pero sacar tus propias valijas para mudarte cuesta medio presupuesto anual.

- **EOL / EOS (*End-of-Life* / *End-of-Support*):** Fechas oficiales a partir de las cuales un fabricante o comunidad deja de comercializar un producto o, más grave aún, deja de publicar actualizaciones y parches de seguridad. *En la trinchera:* Cuando cruza a rojo, o migras el activo o lo encierras bajo siete llaves de red como material radiactivo.

- **ERP (*Enterprise Resource Planning*):** Sistema integral de planificación de recursos empresariales que unifica contabilidad, facturación, compras, inventarios, producción o recursos humanos sobre una base común. *En la trinchera:* El corazón transaccional de la compañía; si la gente sigue llevando la verdad en hojas de cálculo aparte, solo tienes una máquina de escribir carísima.

- **Error Budget (*Presupuesto de Error*):** Margen matemático de indisponibilidad o fallos tolerados en un período (`100 % - SLO`) acordado entre el negocio e ingeniería. *En la trinchera:* El mejor invento diplomático de *SRE*: mientras sobra presupuesto se despliega sin trabas; si se agota, se frenan lanzamientos sin gritos personales para estabilizar.

- **FAANG / Big Tech:** Acrónimo histórico de las gigantes tecnológicas (*Facebook/Meta, Apple, Amazon, Netflix, Google*) cuyas herramientas y arquitecturas de hiperescala marcaron tendencia global. *En la trinchera:* Excelentes referentes de ingeniería cuando entiendes sus principios; ruina segura cuando copias su complejidad para atender a ochenta usuarios internos.

- **FinOps:** Práctica cultural y financiera que aporta responsabilidad económica, visibilidad por centro de costo y optimización continua al gasto variable en nube, licencias y servicios *SaaS*. *En la trinchera:* La lámpara que encuentra miles de dólares tirados en asientos de exempleados para autofinanciar lo que tu infraestructura sí necesita.

- **GRC (*Governance, Risk, and Compliance*):** Dominio que articula el gobierno tecnológico, la gestión formal de riesgos operativos y el cumplimiento verificable de leyes, contratos y normas. *En la trinchera:* El contrapeso independiente que verifica con pruebas reales —y nunca con papeles pintados— que los controles sigan vivos.

- **Hardening (*Endurecimiento*):** Proceso sistemático de reducir la superficie vulnerable de un servidor, contenedor o red desactivando servicios innecesarios, cerrando puertos y restringiendo privilegios al mínimo estricto. *En la trinchera:* Sacarle todas las puertas y ventanas sobrantes al edificio antes de gastar dinero en alarmas láser.

- **IaC (*Infrastructure as Code*):** Gestión y aprovisionamiento de redes, máquinas virtuales y servicios mediante archivos declarativos legibles y versionados en repositorios de código (como *OpenTofu* o *Ansible*). *En la trinchera:* Poder reconstruir tu centro de cómputo entero ejecutando un comando en vez de llorar frente a un servidor quemado configurado a mano hace seis años.

- **Infraestructura Inmutable:** Paradigma operativo donde ningún servidor ni contenedor en producción se modifica ni actualiza en vivo; ante cualquier cambio se construye una imagen nueva limpia, se prueba y reemplaza a la anterior. *En la trinchera:* El funeral definitivo de los servidores mascota y de los arreglos nocturnos que nadie recuerda haber tocado.

- **ITIL 4:** Marco internacional de referencia para la gestión de servicios de TI orientado a la cocreación de valor. *En la trinchera:* Veneno burocrático si intentas aplicar sus treinta y cuatro prácticas de manual a la vez; oro puro cuando dominas sus cinco prácticas troncales para erradicar el caos y el *amiguismo*.

- **Kubernetes:** Plataforma abierta de orquestación para automatizar el despliegue, escalado y autocuración de grandes flotas de aplicaciones en contenedores. *En la trinchera:* Una maravilla de ingeniería cuando tienes decenas de servicios dinámicos y equipo dedicado; un impuesto innecesario de complejidad cuando dos servidores con contenedores simples sobran para tu negocio.

- **LLMOps (*Large Language Model Operations*):** Disciplina encargada de gobernar el despliegue, seguridad, contexto documental, evaluación de alucinaciones y control de costos de modelos generativos de lenguaje en producción. *En la trinchera:* Lo que separa un servicio corporativo serio de un experimento casero que filtra sueldos o inventa cláusulas legales.

- **MFA y Passkeys (FIDO2 / WebAuthn):** Autenticación multifactor que exige combinar algo que sabes o posees; el estándar *FIDO2 / Passkeys* usa criptografía de clave pública atada al dominio real. *En la trinchera:* Tu seguro de vida más barato contra el robo de contraseñas, siempre que destierres los códigos por *SMS* fáciles de secuestrar.

- **MLOps (*Machine Learning Operations*):** Conjunto de prácticas para automatizar y vigilar el ciclo de vida de modelos predictivos de aprendizaje automático, incluyendo datos de entrenamiento y detección de deriva estadística. *En la trinchera:* Recordar que un modelo predictivo envejece igual que la leche fresca cuando cambian las condiciones económicas de la calle.

- **Monolito Modular:** Arquitectura de software que despliega una sola unidad ejecutable simple, pero mantiene sus dominios internos estrictamente desacoplados y ordenados en el código. *En la trinchera:* El punto de partida más sensato, veloz y depurable a las tres de la mañana para nueve de cada diez empresas del planeta.

- **Observabilidad y OpenTelemetry (*OTel*):** Capacidad de comprender el estado interno de un sistema correlacionando métricas, registros estructurados y trazas distribuidas; *OpenTelemetry* es el estándar abierto universal para recolectarlas sin atarse a un proveedor. *En la trinchera:* Pasar de mirar semáforos verdes de procesador a saber en treinta segundos por qué falló el pago de un cliente real.

- **OLA (*Operational Level Agreement*):** Acuerdo interno entre equipos técnicos del propio departamento (por ejemplo, entre *Service Desk* y Redes) que fija tiempos máximos de respuesta y colaboración al escalar un caso. *En la trinchera:* La regla interna que prohíbe jugar al ping-pong devolviendo tickets sin resolver mientras el reloj del usuario corre.

- **Platform Engineering (*Ingeniería de Plataforma*):** Disciplina que diseña cimientos, plantillas y flujos internos reutilizables gobernados por especialistas para reducir la carga cognitiva de los equipos de desarrollo. *En la trinchera:* Que Infraestructura entregue rieles limpios mediante código bajo ticket formal, sin convertir a cada programador en administrador improvisado de redes.

- **Post-Mortem sin culpa (*Blameless Post-Mortem*):** Análisis estructurado posterior a un incidente enfocado en descubrir qué defensas sistémicas faltaron o fallaron, sin castigar el error humano involuntario de buena fe. *En la trinchera:* La única manera de que la gente avise en el minuto uno qué rompió en vez de esconder la basura debajo de la alfombra.

- **Prompt Injection (*Inyección de Instrucciones*):** Ataque donde datos externos maliciosos leídos por un modelo de lenguaje contienen órdenes ocultas que secuestran su comportamiento o extraen información restringida. *En la trinchera:* La razón exacta por la que jamás debes darle a un agente autónomo que lee correos externos permiso directo para borrar datos o mover dinero.

- **RAG (*Retrieval-Augmented Generation*):** Arquitectura que busca primero fragmentos verificados en bases documentales propias —respetando permisos de acceso— y los inyecta como evidencia al modelo generativo para responder sin inventar ni reentrenar. *En la trinchera:* Lo que realmente necesitaba el noventa y cinco por ciento de las empresas que deliraban con entrenar un cerebro propio desde cero.

- **Ransomware y Regla 3-2-1-1-0:** El *ransomware* es código malicioso que secuestra mediante cifrado los sistemas y exige rescate; la regla **3-2-1-1-0** exige 3 copias, en 2 tecnologías, 1 externa, **1 inmutable/desconectada** y **0 errores en pruebas de restauración**. *En la trinchera:* La única diferencia comprobada entre recuperar tu empresa en tres horas o salir con una mano adelante y otra atrás.

- **RGPD y Leyes de Protección de Datos:** Marco regulatorio europeo (*Reglamento General de Protección de Datos*) e iberoamericano que regula el tratamiento legítimo, consentimiento, seguridad y derechos sobre datos personales. *En la trinchera:* Ley con dientes financieros reales; si recolectas datos personales "por las dudas" sin base legal ni fecha de borrado, estás comprando boletos para una multa histórica.

- **RTO y RPO (*Recovery Time Objective* / *Recovery Point Objective*):** El *RTO* mide cuánto tiempo máximo tolera el negocio estar caído tras un incidente; el *RPO* mide cuántos minutos u horas de datos recientes puede permitirse perder como máximo. *En la trinchera:* Las dos mejores unidades del diccionario para traducir inversión técnica a dólares frente al directorio.

- **SAST, SCA y SBOM:** *SAST* analiza fallos de seguridad en tu propio código fuente; *SCA* audita vulnerabilidades en librerías de terceros; *SBOM* es la lista exacta de ingredientes que componen tu software publicado. *En la trinchera:* Saber qué hay realmente adentro de la salchicha antes de servirla en producción.

- **SecOps y Security Champion:** *SecOps* es el equipo dedicado a defender y responder operativamente ante amenazas reales; el *Security Champion* es el desarrollador referente dentro de cada célula que multiplica buenas prácticas desde el diseño. *En la trinchera:* Defensa activa con las manos en el barro, separada del papel de auditoría y apoyada desde adentro del código.

- **Shadow AI / Shadow IT:** Uso de aplicaciones, nubes o herramientas públicas de inteligencia artificial contratadas o abiertas por empleados al margen del conocimiento y los controles de TI y Seguridad. *En la trinchera:* El síntoma directo de prohibir sin dar herramientas seguras o de tener un área técnica demasiado lenta; por ahí se fugan hoy contratos y secretos industriales enteros.

- **SLA, SLO y SLI:** El *SLI* es el indicador real medido, el *SLO* es tu objetivo interno de fiabilidad y el *SLA* es el compromiso contractual con consecuencias externas si se incumple. *En la trinchera:* El antídoto matemático contra la subjetividad de *"el sistema anda lento"* y contra la fantasía infantil del cien por ciento de disponibilidad eterna.

- **TI / IT (*Tecnologías de la Información*):** Disciplina e infraestructura humana, lógica y física encargada de almacenar, procesar, asegurar y transmitir la información que sostiene las operaciones y decisiones de una organización. *En la trinchera:* Mucho más que enchufes y pantallas: el sistema circulatorio moderno de cualquier empresa que pretenda seguir viva mañana.

- **Toil (*Trabajo Penoso Repetitivo*):** Tarea operativa manual, repetitiva, automatizable y carente de valor estratégico duradero que escala linealmente a medida que crece el servicio. *En la trinchera:* El óxido silencioso que quema a los buenos ingenieros cuando nadie protege tiempo semanal para automatizar la causa raíz.

- **Two-Pizza Teams:** Principio organizacional popularizado por Jeff Bezos según el cual ningún equipo autónomo debe ser más grande de lo que puedan alimentar dos pizzas (seis a diez personas) para minimizar costos de coordinación. *En la trinchera:* En grandes firmas son células dedicadas; en una PyME es recordar que pocos generalistas bien ordenados, con sombreros claros y suplencia cruzada, superan a veinte personas estorbándose sin rumbo.

- **Vendor Lock-in (*Secuestro por Proveedor*):** Dependencia técnica, contractual o económica tan profunda hacia un fabricante cerrado que cambiar de alternativa resulta prohibitivamente costoso o inviable a corto plazo. *En la trinchera:* Casarse sin acuerdo prenupcial ni puerta de salida abierta; sonríen al firmarte el descuento inicial y te cobran el rescate en la tercera renovación anual.

- **Zero Trust (*Confianza Cero*):** Arquitectura de seguridad basada en la premisa *"nunca confiar por defecto, verificar siempre"*, validando identidad fuerte, contexto y privilegio mínimo en cada petición sin importar si viene de afuera o de adentro de la oficina. *En la trinchera:* Aceptar de una vez por todas que el castillo medieval con foso murió y que conectar un cable en el tercer piso no vuelve santo a nadie.
