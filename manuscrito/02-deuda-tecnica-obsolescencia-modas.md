## Capítulo 2. Deuda técnica, obsolescencia y el síndrome del último artilugio

Si en el primer capítulo vimos por qué el negocio y TI suelen hablarse como dos desconocidos en idiomas incompatibles, en este toca abrir el armario donde todas las empresas esconden sus esqueletos tecnológicos.

En el prefacio de 2022 señalé algo que nos atraviesa tanto en la vida privada como dentro de cualquier oficina: vivimos empujados por la obsolescencia programada y por el deseo inducido de poseer siempre el último artilugio de moda. En el mercado de consumo eso se traduce en cambiar un teléfono que todavía funciona porque salió otro con un milímetro menos de borde. Dentro de un departamento de tecnología, sin embargo, esa misma pulsión produce una esquizofrenia mucho más peligrosa: empresas que conviven al mismo tiempo con herramientas ultramodernas compradas por impulso y con sistemas prehistóricos atados con alambre que sostienen en silencio toda la operación.

Entender cómo se acumula esa factura invisible —y cómo distinguir cuándo toca actualizar por supervivencia real y cuándo te están vendiendo humo comercial— separa a un departamento que gobierna su infraestructura de uno que vive esperando el próximo derrumbe.

### 2.1. El concepto sin humo: hipoteca consciente vs. chapuza perpetua

Pocas expresiones han sido tan prostituidas en nuestra industria como **deuda técnica**. Hoy se usa como excusa elegante para justificar cualquier desastre: desde código escrito sin pruebas un domingo de madrugada hasta una sala de servidores donde los cables cuelgan del techo como lianas porque *"en aquel momento había que salir rápido"*.

Conviene devolverle al término su significado financiero exacto. Cuando Ward Cunningham acuñó la metáfora, hablaba de un **préstamo deliberado**: sabes cuál es el diseño limpio, pero el negocio tiene una ventana real e impostergable —una regulación con fecha fija, una campaña estacional o la apertura de una planta— y decides tomar un atajo acotado para llegar a tiempo. Igual que en una hipoteca bancaria, ese préstamo solo tiene sentido bajo tres condiciones estrictas:

1. Sabes exactamente cuánto capital pediste prestado (qué componente quedó incompleto o acoplado).
2. Conoces qué tasa de interés estás pagando cada mes en esfuerzo extra de mantenimiento.
3. Tienes agendada la fecha y los recursos para devolver el capital antes de que los intereses te asfixien.

Cuando falta cualquiera de esas tres condiciones, **no tienes deuda técnica: tienes negligencia acumulada**. Dejar una base de datos crítica corriendo con credenciales de administrador compartidas, sin respaldos verificados y sobre un script que nadie documentó durante seis años no es una estrategia financiera audaz; es barrer la basura debajo de la alfombra esperando jubilarse o cambiar de empleo antes de que alguien levante el tapete.

El mismo bisturí crítico hay que aplicarlo a la palabra **obsolescencia**, porque en el mercado tecnológico conviven dos fenómenos opuestos bajo el mismo nombre:

- **Obsolescencia real de soporte y seguridad (*End-of-Life* / *End-of-Support*):** Ocurre cuando un sistema operativo, motor de base de datos, cortafuegos o equipo físico deja de recibir parches de seguridad del fabricante o de la comunidad, carece de repuestos en plaza o solo habla protocolos criptográficos rotos hace una década (como *TLS 1.0* o *SMBv1*). Mantener eso conectado a la red productiva no es ahorro: es jugar a la ruleta rusa con el patrimonio de la empresa.
- **Obsolescencia programada comercial:** Ocurre cuando un proveedor retira artificialmente licencias perpetuas que funcionaban sin fallos para forzarte a pagar un alquiler anual inflado, bloquea por firmware discos o transceptores estándar, o lanza una "nueva generación" cuya única diferencia real es cambiar de lugar los botones del panel y rebautizar funciones viejas con palabras de moda.

La madurez técnica consiste en sostener ambos criterios sin temblar: negarse a dejar sistemas expuestos sin soporte de seguridad y, con la misma firmeza, negarse a regalar el presupuesto del negocio cada vez que el departamento de mercadeo de un fabricante necesita cerrar su cuota trimestral.

### 2.2. La teoría vs. la trinchera: ciclos de vida ideales frente al museo en producción

En las grandes corporaciones tecnológicas o financieras con presupuestos de nueve cifras, la higiene del ciclo de vida funciona como una cinta transportadora industrial. Los portátiles y servidores entran por arrendamiento financiero (*leasing*) con reemplazo automático cada treinta y seis o cuarenta y ocho meses; existen equipos enteros dedicados exclusivamente a deprecar versiones internas, actualizar librerías base y apagar servicios antiguos; y ningún cambio llega a producción sin pasar antes por entornos idénticos de prueba y preproducción.

En una PyME o empresa mediana latinoamericana o española, la realidad cotidiana parece arqueología industrial aplicada. El hardware se exprime hasta que los condensadores de la placa base se hinchan físicamente; el entorno de pruebas suele ser *"probar con cuidado a las diez de la noche rezando para poder volver atrás"*; y el corazón transaccional de la compañía —nómina, inventario o facturación fiscal— depende con frecuencia de un módulo heredado cuyo proveedor original desapareció o pide una fortuna por migrarlo.

Mira cómo contrastan ambos mundos cuando bajas de las diapositivas al cuarto de máquinas:

| Dimensión del ciclo de vida | Lo que asume la teoría corporativa | Lo que ocurre en la trinchera real (PyME / Mediana) |
| :--- | :--- | :--- |
| **Renovación de infraestructura** | Reemplazo preventivo cada 3–5 años bajo contrato de soporte activo 24/7. | Equipos estirados 8–10 años comprando fuentes de poder y discos usados en portales de segunda mano. |
| **Gestión de software base** | Ventanas automatizadas de parches y pruebas continuas de regresión. | Sistemas congelados en versiones muertas porque *"si actualizamos Linux o Java se rompe el facturador"*. |
| **Pago de deuda técnica** | Porcentaje reservado en cada ciclo de ingeniería para limpiar código y arquitectura. | Cero horas asignadas: todo atajo "provisional" adquiere residencia permanente desde el primer día. |
| **Adopción de nuevas herramientas** | Evaluación de arquitectura, seguridad y costo total antes de homologar. | Coexistencia caótica de tres herramientas compradas por capricho junto a procesos manuales en hojas de cálculo. |

Esa brecha explica por qué un atajo sin gobierno termina devorando toda la capacidad operativa del departamento. Observa la diferencia estructural entre gestionar un préstamo técnico adulto y caer en la espiral de chapuza combinada con compras por moda:

![Deuda calculada frente a la espiral de chapuza y moda comercial](02-ciclo-deuda-tecnica.png){ width=92% }

El interés compuesto de la mala deuda no llega en una factura contable a fin de mes: se cobra en horas muertas. Al principio es media hora semanal reiniciando a mano un servicio que pierde memoria; un año después son dos días enteros cada vez que hay que tocar una tabla porque todo está acoplado; al tercer año, el ochenta por ciento del sueldo de tu equipo se consume manteniendo con respiración artificial lo que nunca se arregló a tiempo.

### 2.3. Excentricidades y antipatrones: el fósil intocable, el currículum ajeno y el candado del proveedor

Si recorres suficientes centros de cómputo y nubes corporativas terminarás encontrándote, tarde o temprano, con el personaje más temido de nuestra fauna tecnológica: **el fósil intocable**.

Hablo de esa máquina virtual —o peor aún, esa torre polvorienta escondida debajo de una mesa auxiliar con un cartel pegado con cinta adhesiva que dice *"NO APAGAR BAJO NINGÚN CONCEPTO"*— que corre un sistema operativo cuyo soporte oficial murió cuando todavía se alquilaban películas en DVD. Nadie conserva el código fuente limpio de lo que corre adentro, el programador que lo escribió se mudó de país hace cinco años y los técnicos veteranos sienten sudor frío cada vez que hay un corte eléctrico prolongado, porque nadie tiene certeza absoluta de que los servicios vuelvan a levantar en el orden correcto si el disco gira en frío.

La verdadera excentricidad no es solo que ese fósil siga facturando cada mañana; es que, dos pisos más arriba, la gerencia discute entusiasmada la compra del último artilugio empresarial de moda mientras considera "demasiado riesgoso y caro" financiar el proyecto para reemplazar el fósil antes de que muera de causas naturales. Se construyen balcones de cristal sobre cimientos de barro seco.

Alrededor de ese fenómeno prosperan tres antipatrones igual de destructivos que conviene llamar por su nombre sin anestesia:

#### 1. Desarrollo e infraestructura guiados por el currículum (*Resume-Driven Development*)

No todas las modas absurdas entran por el despacho del gerente general; muchas las metemos los propios informáticos por puro ego profesional. Es el clásico caso del desarrollador estrella, arquitecto recién llegado o consultor externo que, para resolver un formulario interno usado por cuarenta empleados, decide montar un clúster distribuido de orquestación, tres bases de datos no relacionales distintas, colas de eventos y un lenguaje exótico que acaba de leer en un foro.

¿Necesitaba la empresa semejante complejidad? En absoluto. Quien la necesitaba era el técnico para poder escribir esas palabras clave en su perfil profesional y conseguir un mejor sueldo en otra compañía seis meses después. Cuando esa persona se marcha —porque casi siempre se marcha—, deja detrás una bomba de relojería que nadie más en la plantilla sabe depurar, actualizar ni respaldar.

#### 2. Compras de desayuno ejecutivo

Es el reverso gerencial del punto anterior. Un proveedor invita a un directivo a un evento en hotel cinco estrellas, le muestra una demostración milimetrada donde todo se resuelve con dos clics en un tablero luminoso y cierra el contrato anual sin que nadie de infraestructura ni seguridad haya visto jamás los requisitos técnicos. Dos semanas después cae sobre el escritorio de TI una licencia millonaria incompatible con el directorio de identidades de la empresa, que exige servidores dedicados no presupuestados o cuyos datos ni siquiera existen limpios en la organización. El sistema termina subutilizado al diez por ciento o apagado en silencio al vencer el contrato para que nadie admita el error en público.

#### 3. El secuestro por proveedor (*vendor lock-in*)

Entre 2022 y 2026 el mercado entero recibió una lección brutal sobre lo que ocurre cuando entregas las llaves de tu casa tecnológica a un único fabricante cerrado. Organizaciones que habían construido toda su infraestructura sobre un solo hipervisor comercial vieron multiplicarse sus costos de renovación por tres o por cuatro de la noche a la mañana tras una adquisición corporativa; otras descubrieron que subir datos a cierta nube pública era gratis, pero descargarlos para migrar a otro proveedor costaba casi tanto como comprar servidores propios nuevos; y miles de empresas medianas siguen pagando peajes abusivos porque su proveedor de *ERP* secuestra el esquema de datos o cobra licencias desorbitadas por habilitar una interfaz de programación (*API*) básica.

Por eso mi regla de arquitectura en este punto no admite matices: **antes de casarte con cualquier proveedor, nube o herramienta, debes exigir estándares abiertos y tener escrito cómo vas a salir de ahí con tus datos íntegros el día que te cambien las reglas del juego**. Y dentro de casa rige su hermana gemela: **queda prohibido introducir en producción tecnologías críticas que dependan de un único "iluminado" del equipo**. Si al menos dos personas no pueden operarlo, reconstruirlo y explicarlo, esa herramienta es un riesgo operativo disfrazado de innovación.

#### Señales de alerta temprana

Tu organización ya vive hipotecada por la deuda y las modas si reconoces estos síntomas:

- Existe al menos un servidor o sistema crítico cuyo reinicio requiere presencia mística de una persona específica y velas encendidas.
- Tienes licencias activas pagándose cada mes por herramientas que menos del veinte por ciento de los usuarios abre realmente.
- Elegir o cambiar un proveedor tecnológico requiere reescribir media operación porque no existen formatos estándar de exportación (*SQL*, *CSV*, *JSON*, *OpenAPI*, contenedores OCI).
- Cada proyecto nuevo se construye en un lenguaje, *framework* o plataforma distinta según el gusto personal de quien lo lideró ese año.
- Los parches de seguridad acumulan más de doce meses de atraso por terror a romper dependencias ocultas.

### 2.4. Marco de acción pragmático: semáforo de obsolescencia, impuesto de saneamiento y filtro anti-humo

No intentes pagar diez años de deuda acumulada en un fin de semana heroico: las migraciones kamikazes suelen terminar peor que la enfermedad. La salida real es metódica, visible y financieramente defendible en tres pasos concretos.

#### Paso 1: Levanta un semáforo vivo de fin de soporte (*EOL / EOS*)

Nadie puede gestionar lo que no tiene inventariado. Levanta un registro único de todos tus activos físicos, máquinas virtuales, sistemas operativos, motores de bases de datos y aplicativos críticos apoyándote en herramientas abiertas consolidadas: **Snipe-IT** si tu prioridad inmediata es controlar activos y licencias con rapidez, **GLPI** si ya lo adoptaste como mesa de servicio e inventario integrado, o **NetBox** como fuente de verdad para infraestructura de red, direccionamiento y bastidores (*racks*).

Cruza las versiones reales instaladas contra el catálogo comunitario abierto `endoflife.date` y clasifica todo sin maquillaje en tres colores:

- **Verde (Soporte activo > 18 meses):** Operación normal con ciclo regular de parches probados.
- **Amarillo (Vence entre 6 y 18 meses):** Entra obligatoriamente al presupuesto del próximo ejercicio; prohibido desplegar cargas nuevas sobre esa versión.
- **Rojo (Soporte vencido hoy):** Prioridad máxima de migración o reemplazo. Si por dependencia del negocio es imposible apagarlo este mes, aplica **controles compensatorios inmediatos el mismo día**: aíslalo en una red separada sin salida libre a internet, restringe el acceso por cortafuegos estrictamente a los puertos e IPs indispensables, bloquea cuentas administrativas genéricas y toma copia completa fuera de línea. Que sea viejo no justifica dejarle la puerta abierta al primer ataque automatizado.

#### Paso 2: Cobra el impuesto fijo de saneamiento (15 % al 20 %)

Deja de pedir permiso para hacer mantenimiento interno como si fuera un favor personal hacia TI. En la planificación de horas de cada mes o trimestre, **reserva por diseño entre el quince y el veinte por ciento de la capacidad técnica exclusivamente para amortizar deuda registrada, actualizar versiones amarillas/rojas, automatizar tareas repetitivas y documentar sistemas críticos**.

No lo llames "refactorización" frente al directorio: llámalo **mantenimiento preventivo de continuidad operativa**. Cualquier gerente de planta industrial entiende que si una flota de camiones reparte mercadería veinticuatro horas sin pasar jamás por cambio de aceite ni frenos, el ahorro dura exactamente hasta que el motor se funde en mitad de la autopista.

#### Paso 3: Aplica el filtro anti-humo antes de comprar el próximo juguete

Cada vez que alguien —sea un director entusiasmado tras una conferencia o un ingeniero de tu propio equipo enamorado de una herramienta recién salida— proponga incorporar una nueva plataforma, sométela por escrito a estas cinco preguntas obligatorias antes de gastar un centavo o abrir un puerto:

| Pregunta de control | Qué exige responder con datos | Señal de rechazo inmediato (Humo) |
| :--- | :--- | :--- |
| **1. ¿Qué problema medible resuelve?** | Qué proceso roto o costo real corrige hoy (sin usar palabras de moda). | *"Hay que tenerlo porque toda la competencia está hablando de esto."* |
| **2. ¿Cuál es el costo total a 36 meses (*TCO*)?** | Licencias, consumo oculto, capacitación, respaldos y horas internas de operación. | Solo muestran el precio promocional del primer año por usuario. |
| **3. ¿Cuál es nuestro plan de salida?** | En qué formato abierto exporta datos completos y cuánto cuesta migrar a otra opción. | Datos atrapados en formatos propietarios o penalidades abusivas por salir. |
| **4. ¿Quién lo opera a las 3:00 a. m.?** | Al menos dos personas internas capacitadas con documentación reproducible. | Depende de un único especialista o de pagar horas extra de consultoría eterna. |
| **5. ¿Qué sistema viejo apagamos al entrar este?** | Qué licencia o servidor actual se retira para no sumar otra capa más al caos. | *"Por ahora dejamos los dos sistemas corriendo en paralelo indefinidamente."* |

Si una propuesta supera las cinco preguntas con respuestas honestas, adelante: estás ante una inversión tecnológica legítima. Si naufraga en tres de ellas, acabas de ahorrarle a tu empresa otro elefante blanco y diez años futuros de deuda innecesaria.

Con la casa en vías de saneamiento y las puertas cerradas al humo comercial, estamos listos para asomarnos en el próximo capítulo a la transformación que sacó definitivamente nuestras redes del edificio corporativo: el paso del *BYOD* improvisado a la realidad actual del trabajo híbrido y remoto seguro.
