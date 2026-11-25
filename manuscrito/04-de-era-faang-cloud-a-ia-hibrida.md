## Capítulo 4. De la fiebre Cloud/FAANG a la era de la IA y la infraestructura híbrida

En la primera edición incluí dentro de las diez definiciones iniciales tres términos que marcaron toda una época en las charlas de pasillo y en las presentaciones de directorio: **FAANG** (el acrónimo bursátil que agrupaba a Facebook —hoy Meta—, Apple, Amazon, Netflix y Google), **Docker** y **Kubernetes**. No estaban ahí por casualidad. Durante casi una década, esas palabras operaron como el espejo en el que media industria quiso mirarse, aunque el reflejo devolviera una distorsión grotesca.

En aquel momento bastaba que un ingeniero de un gigante californiano publicara en un blog cómo resolvían el tráfico simultáneo de doscientos millones de espectadores un viernes por la noche para que, el lunes a primera hora, cien empresas medianas con tres servidores y ochenta usuarios internos decidieran que su sistema de facturación también necesitaba exactamente la misma arquitectura.

Entre 2022 y 2026 vivimos el desenlace económico de esa fiesta y el nacimiento inmediato de la siguiente. Primero llegó la resaca financiera de la nube pública mal adoptada; y apenas estábamos aprendiendo a leer la letra pequeña de las facturas mensuales cuando irrumpió la fiebre de la inteligencia artificial generativa prometiendo, otra vez, resolver sin esfuerzo décadas de desorden organizacional. Cerrar esta primera parte exige vacunar nuestro criterio técnico contra ambos espejismos.

### 4.1. El concepto sin humo: tú no eres Netflix (y tu factura tampoco)

En antropología se conoce como *culto al cargo* (*Cargo Cult*) el fenómeno ocurrido en algunas islas del Pacífico tras la Segunda Guerra Mundial: los habitantes locales habían visto aterrizar aviones militares cargados de provisiones después de que los soldados construyeran pistas, torres de control y usaran auriculares de radio. Cuando los ejércitos se marcharon, los isleños construyeron torres de bambú y auriculares de madera esperando que los aviones volvieran a bajar del cielo. Copiaron la forma externa del ritual sin comprender la física ni la logística que hacían volar al avión.

La informática empresarial lleva quince años practicando su propio culto al cargo frente a las grandes tecnológicas.

Cuando Google creó *Kubernetes* o Netflix popularizó los microservicios distribuidos con inyección deliberada de fallos en vivo, no lo hicieron porque fuera una forma más sencilla o barata de programar. Lo hicieron porque tenían **problemas extremos de escala humana y geográfica**: miles de desarrolladores desplegando código al mismo tiempo sobre cientos de miles de máquinas repartidas por todo el planeta. Su complejidad técnica era el precio inevitable de su tamaño.

Cuando una distribuidora comercial, una clínica privada o una fábrica regional con cuatro programadores y un par de miles de transacciones por hora copia esa misma arquitectura, no importa las virtudes de Google: **importa únicamente sus problemas**, pero sin tener sus mil ingenieros de plataforma ni su cuenta bancaria para sostenerlos.

Apliquemos el mismo filtro sin humo a los dos grandes mantras de esta década:

1. **La nube pública (*Cloud*) no es un lugar mágico en el cielo:** Es el centro de datos de un tercero —muy bien automatizado, con excelente red y catálogo de servicios— que te alquila cómputo, discos y ancho de banda con taxímetro encendido las veinticuatro horas. Usarlo con inteligencia acelera negocios; usarlo por religión arruina márgenes operativos.
2. **La inteligencia artificial corporativa no es clarividencia ejecutiva:** Es cálculo estadístico y probabilístico avanzado que consume datos previos para generar texto, código, búsquedas o acciones automatizadas. Si tus procesos internos son claros y tus datos son confiables, actúa como un multiplicador formidable; si tus datos son un pantano contradictorio, solo fabrica errores convincentes a velocidad industrial.

### 4.2. La teoría vs. la trinchera: del dogma Cloud-First al despertar financiero e híbrido

A comienzos de esta década se instaló en muchos directorios el decreto conocido como ***Cloud-First*** (*primero la nube*): cualquier proyecto nuevo debía nacer obligatoriamente en un hiperescalador público y cualquier servidor físico propio era mirado con desprecio como reliquia del siglo pasado. La promesa comercial aseguraba que pagarías *"solo por lo que usas"*, eliminarías gastos de capital (*CAPEX*) y te olvidarías para siempre de administrar infraestructura.

En la trinchera de empresas reales ocurrió algo muy distinto. La mayoría de los negocios tradicionales no tiene picos salvajes de diez millones de visitas durante dos horas y silencio el resto del día; tiene **cargas base estables y predecibles** que corren de lunes a domingo todo el año. Alquilar un automóvil por minuto sirve para ir del aeropuerto al hotel, pero si alquilas por minuto el camión de reparto que usas diez horas diarias durante cinco años, terminas pagando cuatro camiones sin ser dueño de una sola rueda.

En mis apuntes de 2022 ya asomaba la respuesta sensata a ese péndulo: **el paradigma de la infraestructura híbrida**. Entre 2024 y 2026 esa intuición dejó de ser herejía para convertirse en sentido común financiero. Observa cómo cambió la conversación cuando las promesas chocaron contra los estados de resultados:

| Dimensión estratégica | El dogma vendido en 2020–2022 | El despertar de trinchera en 2026 |
| :--- | :--- | :--- |
| **Modelo económico Cloud** | *"En la nube siempre ahorras porque solo pagas por consumo real."* | Cargas fijas 24/7 sin optimizar cuestan 2 a 4 veces más alquiladas que en hierro propio o servidores dedicados. |
| **Movilidad de datos** | *"Puedes escalar y mover tus cargas con total libertad cuando quieras."* | Meter terabytes es gratis; sacarlos (*egress fees*) cobra un peaje tan alto que actúa como grillete financiero. |
| **Arquitectura de aplicaciones** | *"Si no usas microservicios y orquestación distribuida estás obsoleto."* | Monolitos modulares bien diseñados superan en velocidad de entrega y estabilidad a microservicios mal dimensionados. |
| **Adopción de IA** | *"Conecta un modelo generativo a toda la empresa y reemplaza áreas enteras."* | Sin gobierno documental, control de permisos y validación humana, la IA expone secretos y alucina con seguridad pasmosa. |

Esa maduración nos obliga a abandonar la persecución de eslóganes para diseñar según la física real de nuestras cargas y de nuestro equipo:

![Del culto ciego a las modas hacia el realismo híbrido y gobernado en 2026](04-evolucion-entorno-2022-2026.png){ width=92% }

### 4.3. Excentricidades y antipatrones: microservicios para ochenta usuarios, Lift & Shift ciego e IA sobre pantanos

Tres escenas reales condensan la cantidad obscena de dinero y salud mental que se quema cuando la moda reemplaza al cálculo de ingeniería.

#### 1. El síndrome de creerse Netflix (sobreingeniería de juguete)

Me ha tocado auditar plataformas internas cuyo tráfico real en hora pico no superaba las ochenta personas cargando pedidos o consultando reportes, es decir, un volumen que una sola máquina virtual modesta con una base de datos relacional bien indexada procesa bostezando con el cinco por ciento de su procesador.

Sin embargo, el equipo original había decidido construir "para escalar a millones": veintidós microservicios separados, tres colas de mensajería asíncrona, malla de servicios, despliegues en clústeres de alta complejidad y cinco repositorios distintos que había que coordinar para agregar un simple campo de teléfono en un formulario. ¿El resultado? Ninguna mejora perceptible para el usuario final, una factura mensual de infraestructura multiplicada por seis y dos días de arqueología forense cada vez que fallaba un pedido porque el error rebotaba entre nueve contenedores antes de llegar a pantalla.

#### 2. El *Lift & Shift* ciego ("levantar y mudar la basura")

Cuando la gerencia ordenó *"irnos a la nube antes de diciembre"* para mostrar modernización en la memoria anual, muchas áreas tomaron el camino de menor resistencia: clonar tal cual sus máquinas virtuales locales —con sistemas operativos mal dimensionados, consultas SQL sin índices que barrían tablas enteras cada diez segundos y procesos nocturnos ineficientes— y encenderlas exactamente igual sobre instancias alquiladas en un proveedor público.

En el servidor físico propio de la oficina, una consulta mal escrita calentaba un poco más el procesador ya comprado, pero no alteraba el recibo a fin de mes. En la nube pública, cada ciclo desperdiciado de CPU, cada lectura innecesaria de disco y cada gigabyte transferido entre zonas de disponibilidad pasó directo a engordar la tarjeta corporativa. Subieron el desorden al cielo esperando un milagro y solo consiguieron pagar en dólares mensuales el mismo sistema lento que ya tenían abajo, ahora con veinte milisegundos extra de latencia de red.

#### 3. La fiebre de la "IA mágica" sobre un pantano de datos

Hoy se repite la misma película cambiando la palabra *Cloud* por *Inteligencia Artificial*. La directiva pide un asistente inteligente interno conectado a los documentos de la compañía *"para que cualquiera pregunte lo que necesite"*. Nadie quiere escuchar primero que en las carpetas compartidas conviven cuatro versiones contradictorias de la lista de precios (`Precios_Final.xlsx`, `Precios_Final_v2_OK.xlsx`, `Precios_Este_Si_2026.xlsx`), contratos vencidos sin archivar y planillas de sueldos guardadas por error en un directorio con permisos de lectura para *"Todos los usuarios autenticados"*.

La inteligencia artificial no corrige la falta de orden: **le pone un megáfono**. Si conectas un buscador generativo sobre permisos mal configurados, en cinco minutos un pasante curioso descubre cuánto cobra el directorio o qué descuento confidencial se negoció con el cliente más grande; y si lo alimentas con documentos contradictorios, responderá con prosa impecable cifras completamente falsas. Basura entra, alucinaciones caras salen.

#### Señales de alerta temprana

Sabes que tu departamento cayó en la trampa de las modas tecnológicas cuando observas esto:

- Tu factura mensual de nube crece más rápido que las ventas o los usuarios reales del negocio, y nadie sabe desglosar por qué.
- Tienes más piezas de infraestructura de orquestación que desarrolladores capaces de mantenerlas cuando el especialista principal sale de vacaciones.
- Migraste cargas estables de veinticuatro horas a la nube pública sin apagar jamás el centro de datos anterior, pagando ambos mundos en paralelo durante años.
- Alguien propone un proyecto de inteligencia artificial sin haber definido antes quién es dueño de los datos, qué calidad tienen ni quién audita los permisos de acceso.
- Elegir una solución sencilla y probada provoca burlas internas porque *"eso no es moderno"*.

### 4.4. Marco de acción pragmático: tecnología aburrida, fichas de innovación y matriz de cargas

Salir del péndulo de las modas no significa rechazar el progreso ni atarse con nostalgia a servidores polvorientos bajo llave; significa aplicar economía de ingeniería implacable con tres reglas prácticas.

#### Paso 1: Abraza con orgullo la "Tecnología Aburrida"

El ingeniero Dan McKinley formuló hace años un principio que debería estar enmarcado en la pared de todo departamento de TI: **elige tecnología aburrida** (*Choose Boring Technology*). "Aburrida" no significa vieja ni abandonada; significa tecnología madura, de estándares abiertos, cuyas formas de fallar ya son conocidas por miles de administradores en todo el mundo desde hace más de una década.

Para la inmensa mayoría de las empresas medianas y PyMEs en 2026, un cimiento compuesto por **Linux empresarial con soporte extendido** (Debian estable, Ubuntu LTS, Rocky Linux o AlmaLinux), **PostgreSQL** como motor de datos todo terreno (capaz de manejar hoy relaciones estrictas, documentos JSON y búsquedas vectoriales sin instalar tres motores exóticos aparte), contenedores estándar **Docker o Podman** orquestados con sencillez y una aplicación diseñada como **monolito modular limpio** resuelve el noventa y cinco por ciento de las necesidades reales a una fracción ridícula del costo y del estrés operativo de una arquitectura hiperdistribuida.

#### Paso 2: Gasta como máximo una o dos "Fichas de Innovación" al año

Imagina que tu equipo recibe el primero de enero **solo dos fichas doradas de complejidad nueva** para todo el año. Cada vez que decides introducir una base de datos que nadie en casa operó antes, un orquestador nuevo, un lenguaje distinto o un flujo agéntico de IA en producción, debes entregar una ficha en la mesa.

La regla es simple: **jamás gastes una ficha de innovación en plomería genérica**. No inventes tu propio sistema contable, no montes infraestructura experimental para una intranet interna ni adoptes herramientas de vanguardia para procesos estándar. Reserva tus contadas fichas exclusivamente para aquel punto exacto donde tu empresa compite y gana dinero frente al resto del mercado.

#### Paso 3: Ubica cada carga según su naturaleza física y económica

Deja de discutir *"nube sí o nube no"* en abstracto. Evalúa cada servicio de tu catálogo con esta matriz pragmática de ubicación híbrida:

| Tipo de carga o necesidad | Ubicación recomendada en 2026 | Cuándo tiene sentido real | Trampa mortal que debes evitar |
| :--- | :--- | :--- | :--- |
| **Procesos estándar no diferenciales** (correo, ofimática, CRM común) | **SaaS consolidado o suite abierta alojada** | Cuando mantenerlo tú mismo no aporta ventaja competitiva al giro del negocio. | Firmar sin revisar exportación abierta de datos y subidas anuales por asiento. |
| **Cargas base estables 24/7** (ERP, bases internas, servicios fijos) | **Hierro propio virtualizado, *colocation* o VPS dedicado de tarifa plana** | Consumo predecible todo el año y tráfico intenso de datos internos. | Hacer *Lift & Shift* a instancias por hora en nube pública y pagar el triple. |
| **Cargas elásticas, globales o por ráfagas** (e-commerce estacional, APIs públicas) | **Nube pública / Hiperescalador o CDN de borde** | Cuando necesitas escalar por diez en minutos y apagar recursos el resto del mes. | Dejar entornos de prueba encendidos 24/7 sin alertas duras de presupuesto. |
| **Asistentes cognitivos e IA empresarial** | **Inferencia acotada (API gobernada o modelo local) sobre RAG limpio** | Solo después de ordenar documentos fuente, permisos por rol y métricas de acierto. | Conectar modelos públicos sin filtro a repositorios desordenados con datos sensibles. |

Con este cuarto capítulo cerramos el recorrido por el entorno cultural, económico y estratégico que rodea a cualquier departamento tecnológico en 2026. Ya pusimos sobre la mesa el choque de idiomas con la dirección, la trampa de la deuda técnica, la desaparición del perímetro físico en el trabajo híbrido y el antídoto contra el humo comercial de las grandes modas.

Ahora que el terreno externo está despejado, ha llegado el momento de abrir la puerta del departamento por dentro: en la **Parte II** vamos a diseccionar con bisturí cómo estructurar, gobernar y liderar las ocho áreas reales de TI —desde empresas medianas hasta PyMEs donde tres valientes sostienen el mundo— sin caer en silos, autoauditorías ni cuellos de botella.
