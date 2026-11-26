## Capítulo 13. Arquitectura de Software y Desarrollo: Gobernar la complejidad

Llegamos al octavo y último dominio de la anatomía departamental. Si revisas la lista de tareas que asignaban muchos manuales —y que todavía asomaba en una línea de la edición de 2022— al **Arquitecto de Software**, encontrarás una contradicción reveladora: le pedían definir las decisiones técnicas de más alto nivel de la compañía y, dos renglones más abajo, *ofrecer soporte de tickets*.

Poner al arquitecto de software a resolver tickets rutinarios de soporte es el equivalente hospitalario de sacar al neurocirujano del quirófano para que reparta turnos en la ventanilla de admisión: pagas el sueldo más escaso del equipo para hacer mal dos trabajos distintos al mismo tiempo.

En mis notas preparatorias de 2022 dejé escrita una advertencia que resume la salud de este dominio frente al resto del departamento: **la idea es que cada quien tenga su parcela sin invadir ni abandonar la ajena**. En 2026 —cuando escribir cien líneas de código sintácticamente válidas tarda cuatro segundos gracias a los asistentes generativos, pero mantener vivo un ecosistema empresarial coherente durante diez años es más difícil que nunca— el oficio de **Arquitectura de Software y Desarrollo** ya no consiste en quién teclea más rápido, sino en **cómo gobernar la complejidad para que el software propio no estrangule a la empresa**.

### 13.1. El concepto sin humo: decisiones difíciles de cambiar y carriles compartidos

El escritor Ralph Johnson dejó una definición memorable sobre qué es realmente la arquitectura de software: *"Son las cosas importantes, sean cuales sean"*, es decir, aquellas decisiones estructurales que, si las tomas mal el primer mes, **cuesta una fortuna de tiempo y dinero revertir dos años después**.

El líder de Arquitectura y Desarrollo no existe para encerrarse a programar en secreto la pieza más divertida ni para repartir sermones abstractos desde un pedestal. Su trabajo real frente al negocio y al equipo consiste en gobernar cuatro fronteras:

1. **Contener la entropía tecnológica:** Definir con qué pocas herramientas oficiales se construye en casa para que cualquier desarrollador pueda mantener, auditar y corregir el trabajo de otro.
2. **Proteger los límites entre sistemas:** Impedir que una aplicación meta la mano directamente en las entrañas de otra, exigiendo contratos explícitos de integración.
3. **Decidir con frialdad cuándo comprar y cuándo construir:** El código más barato, seguro y libre de errores que jamás tendrás que mantener es el código que no escribiste porque resolviste una necesidad estándar con una herramienta probada. Desarrollar software propio solo se justifica donde reside la receta particular de tu negocio.
4. **Respetar las parcelas con Infraestructura y *SRE*:** Arquitectura define la estructura interna de los componentes, sus contratos de datos y sus requisitos de ejecución; Sistemas provee la plataforma reproducible donde corren; y *SRE* vigila con métricas objetivas que esa convivencia cumpla los niveles de fiabilidad prometidos. Nadie tira código ciego por encima de la tapia esperando que otro adivine cómo levantarlo.

### 13.2. La teoría vs. la trinchera: de la fantasía distribuida al código mantenible a las tres de la mañana

En las conferencias internacionales de desarrollo casi todos los ejemplos muestran arquitecturas orientadas a eventos globales, veinte repositorios independientes y equipos especializados por cada botón de la pantalla.

En una empresa mediana o PyME donde el área de desarrollo cuenta con tres, cinco u ocho programadores en total, la pregunta de oro que debe hacerse todo arquitecto antes de aprobar un diseño no es *"¿qué tan elegante se ve esto en un pizarrón?"*, sino ***"¿puede el desarrollador menos veterano de mi equipo entender y arreglar un fallo en este sistema un martes a las tres de la mañana sin llamar a tres personas más?"***.

A esa realidad humana se sumó entre 2023 y 2026 la irrupción masiva de los **asistentes de programación con inteligencia artificial**. Bien usados por un ingeniero con criterio, aceleran enormemente la escritura de pruebas, migraciones repetitivas y esqueletos estándar. Mal usados en un equipo sin gobierno arquitectónico, funcionan como una manguera de alta presión que inyecta miles de líneas de código verboso, duplicado y con agujeros sutiles de seguridad a una velocidad superior a la que el equipo puede comprender.

Observa el contraste entre un área de desarrollo librada al capricho individual y una gobernada con arquitectura adulta:

| Dimensión de Desarrollo | Trinchera caótica sin gobierno | Ingeniería gobernada en 2026 |
| :--- | :--- | :--- |
| **Lenguajes y *frameworks*** | Cada programador elige su juguete favorito del año. | **Máximo 1 o 2 stacks oficiales** dominados de punta a punta por todo el equipo. |
| **Estructura inicial** | Microservicios prematuros que convierten llamadas locales en fallos de red. | **Monolito modular limpio**, separando dominios lógicos antes de partir nada en red. |
| **Integración con el *ERP*** | Consultas y escrituras directas sobre las tablas SQL internas del sistema ajeno. | Prohibición absoluta de tocar bases ajenas: todo cruza por **APIs versionadas**. |
| **Uso de IA al programar** | Copiar y pegar bloques enteros que *"compilan y parecen andar"* sin leerlos. | El autor humano responde al 100 %: prohibido aprobar código que no sepa explicar y probar. |

Mira cómo cambia el mapa completo cuando pasas de la Torre de Babel artesanal a una arquitectura con fronteras nítidas y estándares compartidos:

![De la Torre de Babel de lenguajes huérfanos hacia una arquitectura gobernada con fronteras limpias](13-fronteras-arquitecto-infra-sre.png){ width=92% }

### 13.3. Excentricidades y antipatrones: el zoológico de siete lenguajes, el asalto al SQL ajeno y el arquitecto de marfil

Si te toca heredar la jefatura de desarrollo o tecnología en una empresa que creció sin arquitecto durante años, prepárate para visitar **el zoológico de los siete lenguajes huérfanos**.

Es una escena tan repetida que da escalofríos. Abres el inventario de aplicaciones internas y descubres que el facturador viejo está escrito en PHP 5 sin *framework*; el portal de proveedores lo hizo en Python un muchacho que se fue en 2021; el integrador logístico corre en Node con una librería abandonada; la herramienta de comisiones es un ejecutable de escritorio en C# cuyo código fuente vive en una carpeta dudosa; hay dos servicios sueltos en Go que escribió un entusiasta en un fin de semana; y alguien acaba de empezar un módulo nuevo en Rust *"porque leí que es más rápido"*.

Mientras cada autor seguía sentado en su silla parecía libertad creativa. Dos años después tienes cuatro personas en nómina intentando sostener siete ecosistemas incompatibles con gestores de paquetes, librerías de seguridad y servidores de ejecución distintos. Nadie puede cubrir las vacaciones del otro y corregir un impuesto básico exige tocar tres mundos que nadie domina por completo. **Permitir que cada programador elija el lenguaje de un activo empresarial por gusto personal no es empoderar al equipo: es hipotecar el mantenimiento futuro de la compañía.**

Junto a ese zoológico conviven otras tres deformaciones igual de tóxicas:

#### 1. Integrar sistemas asaltando por la ventana la base de datos ajena

Un desarrollador necesita mostrar los saldos de clientes del *ERP* en el portal web comercial. Como leer la documentación de la interfaz oficial (*API*) le da pereza —o el proveedor tarda en responder—, pide una credencial de base de datos y conecta su página web directamente a leer y escribir sobre las tablas internas del *ERP*.

Durante seis meses se aplaude a sí mismo por lo rápido que salió. Hasta que un sábado se actualiza el *ERP*, el fabricante renombra dos columnas internas o agrega una validación contable que solo se dispara desde su capa de negocio, y el portal web empieza a inyectar pedidos corruptos que descuadran todo el libro mayor sin arrojar un solo error en pantalla. **La base de datos interna de una aplicación es propiedad privada de esa aplicación; cruzar esa frontera por detrás destruye cualquier arquitectura.**

#### 2. El "Arquitecto de Torre de Marfil"

Es el extremo opuesto al caos: un profesional que dejó de leer código real hace ocho años, vive encerrado produciendo documentos de cien páginas llenos de flechas abstractas que no compilan en ningún lado y baja de su nube únicamente para regañar a los desarrolladores cuando la realidad no encaja en sus rectángulos perfectos. Un arquitecto que nunca abre un repositorio, nunca revisa un cambio real ni sufre las consecuencias operativas de sus propios diseños pierde el respeto técnico del equipo al segundo mes.

#### 3. La resaca del código zombi generado por IA (*vibe coding* sin red)

En 2026 apareció una patología inédita en la historia del oficio: recibir solicitudes de fusión de código de ochocientas líneas generadas en dos minutos con un asistente de inteligencia artificial donde, cuando le preguntas al autor por qué desactivó una validación de certificados en la línea trescientos cuarenta o por qué abre una conexión nueva por cada fila de un bucle, te mira en blanco y confiesa: *"Así me lo devolvió el prompt y pasó el caso feliz"*. Generar deuda técnica antes requería semanas de esfuerzo humano; hoy cualquiera sin supervisión puede fabricar cinco mil líneas de deuda en una tarde lluviosa.

#### Señales de alerta temprana

El área de desarrollo y arquitectura perdió el timón si detectas tres o más de estas señales:

- Tienes más lenguajes de programación y *frameworks* en producción que desarrolladores activos en plantilla.
- Dos o más aplicaciones distintas leen o escriben directamente sobre las mismas tablas de una base de datos compartida.
- Los desarrolladores suben cambios directos a la rama productiva —o editan archivos directamente en el servidor— sin revisión de un par ni pruebas automáticas.
- Nadie sabe explicar por qué se tomó una decisión arquitectónica hace dieciocho meses porque no existe registro escrito en el repositorio.
- El arquitecto dedica más tiempo a apagar tickets menores de usuarios o asistir a reuniones administrativas que a revisar diseño, contratos y calidad de código.

### 13.4. Marco de acción pragmático: pocos stacks, ADRs en Git, OpenAPI y pruebas obligatorias

Gobernar el desarrollo con elegancia y velocidad en equipos reales se apoya en cuatro reglas de ingeniería limpias y auditables.

#### Paso 1: Decreta tu lista corta oficial (y congela el resto)

Reúne al equipo, evalúa qué conocen de verdad y qué resuelve mejor el negocio, y fija por escrito **un stack principal de servidor, un stack de interfaz y un motor relacional estándar** (por ejemplo, el cimiento aburrido y potente visto en el Capítulo 4 sobre **PostgreSQL**). Todo sistema viejo fuera de esa lista entra en modo de mantenimiento estricto: cero funciones nuevas allí y migración gradual hacia el estándar oficial cuando toque renovarlo.

Arranca todo producto nuevo como un **monolito modular bien separado por dominios internos**: tendrás un solo despliegue simple, transacciones consistentes y refactorización inmediata. Solo cuando un módulo concreto demuestre con métricas reales necesitar escalado o ciclo de vida independiente, tendrás fronteras limpias para extraerlo sin dolor.

#### Paso 2: Documenta decisiones con ADRs en Git y modelo C4

Nadie mantiene al día manuales gigantes en Word fuera del código. Adopta dos prácticas ligeras que sí sobreviven al paso de los años:

- ***Architecture Decision Records* (*ADRs*):** Una carpeta `/docs/adr/` dentro del mismo repositorio Git donde cada decisión importante ocupa exactamente una página en texto plano (`001-uso-postgresql-unico.md`, `002-autenticacion-oidc-keycloak.md`) con cuatro apartados fijos: *Estado*, *Contexto del problema*, *Decisión tomada* y *Consecuencias aceptadas*.
- **Modelo C4 (niveles 1 y 2):** Dos diagramas claros en código (**Mermaid**) que muestren el *Contexto* (qué sistemas y actores rodean la solución) y los *Contenedores lógicos* (aplicación web, API, base de datos, cola), inteligibles en cinco minutos por cualquier recién llegado.

#### Paso 3: Contratos OpenAPI e higiene innegociable en GitLab / Gitea / Forgejo

Centraliza todo el código fuente de la empresa —incluidos scripts administrativos— en una forja controlada como **GitLab**, **Gitea** o **Forgejo**, aplicando cuatro cerrojos técnicos automáticos sobre la rama principal:

| Regla de ingeniería | Cómo se aplica en la práctica | Qué desastre evita |
| :--- | :--- | :--- |
| **Contrato primero (*API-First*)** | Toda comunicación entre sistemas se define en **OpenAPI** versionado; prohibido compartir tablas de base de datos entre aplicaciones. | Actualizaciones de un sistema que rompen en silencio a otros cuatro. |
| **Revisión humana obligatoria** | Rama principal bloqueada: todo cambio entra por *Merge / Pull Request* aprobado al menos por otro desarrollador. | Código incomprensible, atajos solitarios y puertas traseras accidentales. |
| **Responsabilidad total sobre IA** | Regla de equipo: si usas un asistente para generar código o pruebas, **eres 100 % dueño de cada línea**; en la revisión debes poder defender su lógica, bordes y seguridad. | Inyección masiva de alucinaciones, dependencias falsas y deuda instantánea. |
| **Pruebas antes de fusionar** | Formateador, analizador estático y suite automática de pruebas unitarias y de integración corriendo en contenedor efímero antes de permitir el *merge*. | Regresiones tontas descubiertas por los clientes en producción un viernes. |

Con este decimotercer capítulo cerramos el recorrido completo por la **Parte II**. Ya tenemos los ocho dominios definidos, sus líderes enfocados cada uno en su parcela, los costos iluminados, los tickets domesticados y los cimientos físicos y lógicos en orden.

Ahora que la casa tiene planos y responsables claros, estamos listos para entrar en la **Parte III** y saldar la gran deuda pendiente con la primera edición: abordar una por una, con bisturí de trinchera y cero tono de enciclopedia, las cuatro grandes metodologías operativas que mueven la tecnología en 2026: **DevOps y Platform Engineering**, **DevSecOps**, **LLMOps e IA Agéntica** y **SRE con Observabilidad Moderna**.
