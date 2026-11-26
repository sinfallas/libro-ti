## Capítulo 17. SRE (Site Reliability Engineering) y Observabilidad Moderna

En el cierre de la primera edición dediqué varias páginas a presentar la **Ingeniería de Fiabilidad del Sitio (*Site Reliability Engineering* o *SRE*)**, sus métricas y sus cuatro señales doradas. Al releer aquel texto hoy saltan a la vista dos cosas que debemos poner en su sitio: primero, el tono sonaba demasiado cercano a un manual traducido; y segundo, se había colado una afirmación confusa según la cual *SRE* estaría gobernado verticalmente por el equipo de desarrollo por encima de operaciones.

Corrijamos ambos puntos con bisturí de campo. Cuando Ben Treynor Sloss acuñó el término en Google en 2003, lo definió con una frase cristalina que explica toda la disciplina: **SRE es lo que ocurre cuando le pides a un ingeniero de software que diseñe y gobierne un entorno de operaciones**. No significa subordinar Operaciones a los caprichos de Desarrollo; significa dejar de sostener servicios a fuerza de planillas manuales, guardias heroicas y reinicios artesanales, para tratar la disponibilidad, la latencia y la capacidad como problemas de ingeniería gobernados por código y datos objetivos.

### 17.1. El concepto sin humo: por qué el 100 % de disponibilidad es una mentira cara

Si le preguntas a cualquier director comercial qué porcentaje de disponibilidad quiere para su plataforma el año que viene, responderá sin pestañear: ***"El cien por ciento, jamás puede caerse"***.

El primer deber adulto de *SRE* consiste en explicarle con una servilleta y una calculadora por qué el **100 % de disponibilidad no solo es físicamente imposible** —hasta los cables submarinos los muerden tiburones o anclas de barcos, y aunque tu servidor sea inmortal, el proveedor doméstico de internet de tu cliente igual tendrá microcortes—, sino que **perseguirlo destruye la capacidad de innovar y funde el presupuesto**.

Cada "nueve" adicional en la tabla de disponibilidad cuesta aproximadamente diez veces más dinero y complejidad que el anterior:

- **99 % (*dos nueves*):** Permite hasta **3,65 días** de indisponibilidad acumulada al año (tolerable para herramientas internas administrativas).
- **99,9 % (*tres nueves*):** Permite **8 horas y 45 minutos** al año, o unos **43 minutos al mes** (el punto dulce realista y rentable para la inmensa mayoría de negocios serios).
- **99,99 % (*cuatro nueves*):** Apenas **52 minutos en todo el año** (**4,3 minutos al mes**), lo que ya exige redundancia geográfica activa sin intervención humana.
- **99,999 % (*cinco nueves*):** Solo **5 minutos al año**, reservado a sistemas donde se juegan vidas humanas o redes troncales globales con presupuestos astronómicos.

De aceptar matemáticamente que el objetivo sano no es cien por ciento nace la trilogía que ordena la paz entre áreas —rescatada y afilada desde 2022—:

1. **SLI (*Service Level Indicator* / Indicador de Nivel de Servicio):** El termómetro real medido desde la perspectiva del usuario (por ejemplo: *porcentaje de cobros respondidos con éxito en menos de 400 milisegundos*).
2. **SLO (*Service Level Objective* / Objetivo de Nivel de Servicio):** La meta interna de ingeniería que nos exigimos cumplir (por ejemplo: *99,9 % de éxito mensual en ese SLI*).
3. **SLA (*Service Level Agreement* / Acuerdo de Nivel de Servicio):** El contrato legal externo firmado con clientes, siempre un escalón más holgado que tu meta interna (por ejemplo: *99,5 %*, para que tu alarma interna suene mucho antes de tener que pagar multas contractuales).

Y de restar tu *SLO* del cien por ciento nace la herramienta política más brillante de toda la informática moderna: **el Presupuesto de Error (*Error Budget*)**. Si acordamos con dirección un *SLO* del `99,9 %`, tenemos un presupuesto permitido de fallo de **43 minutos este mes**. Mientras hay presupuesto disponible, Desarrollo despliega mejoras a buen ritmo. Pero si un cambio descuidado consume 45 minutos de caída el día diez del mes, **no hay gritos ni peleas personales: el presupuesto llegó a cero y, por regla matemática acordada de antemano, se congelan automáticamente los lanzamientos de funciones nuevas** dedicando el esfuerzo conjunto a estabilizar, automatizar pruebas y blindar el sistema hasta recuperar el margen.

### 17.2. La teoría vs. la trinchera: del monitoreo de fierros a la Observabilidad que ve al cliente

En muchas organizaciones creen tener todo bajo control porque instalaron hace ocho años un panel lleno de agujas que miden uso de procesador, memoria libre y espacio en disco. A eso lo llamamos **monitoreo clásico de infraestructura**: sirve para saber si el servidor respira, pero es completamente ciego a si el negocio funciona. Puedes tener cuatro servidores con el procesador relajado al diez por ciento y discos a la mitad mientras una llave vencida contra la pasarela bancaria rechaza el cien por ciento de las ventas.

La **Observabilidad moderna** da vuelta la cámara: en lugar de preguntar *"¿está caliente el hierro?"*, instrumenta el software para poder responder *por qué* falló una transacción específica que nunca habíamos visto fallar antes, apoyándose en tres señales correlacionadas por un mismo identificador de rastro (`trace_id`):

1. **Métricas:** Números agregados baratos de consultar en el tiempo (*¿cuántos errores por segundo tenemos ahora mismo?*).
2. **Registros estructurados (*Logs* en JSON):** El diario detallado con contexto legible por máquinas (*¿qué mensaje de error exacto arrojó ese pedido?*).
3. **Trazas distribuidas (*Traces*):** La radiografía de punta a punta con tiempos exactos por etapa (*de los 3,2 segundos que tardó el cobro, 20 ms fueron en la web, 15 ms en nuestra base y 3.165 ms esperando al proveedor fiscal externo*).

Observa cómo contrasta el falso *SRE* cosmético frente a la adopción pragmática en equipos medianos:

| Dimensión operativa | Falso SRE en trinchera | Práctica SRE y Observabilidad Real (2026) |
| :--- | :--- | :--- |
| **Trabajo repetitivo (*Toil*)** | El 90 % del día se va reiniciando servicios, limpiando discos o corriendo scripts a mano. | **Techo duro < 50 %:** toda tarea manual repetitiva sin valor duradero se automatiza por código. |
| **Qué miran los tableros** | Semáforos de CPU, ping y RAM desconectados del recorrido del cliente. | **Las 4 señales doradas** (Latencia, Tráfico, Errores y Saturación) sobre viajes críticos del usuario. |
| **Agentes e instrumentación** | Agentes propietarios cerrados que cobran fortunas por gigabyte enviado. | Estándar abierto **OpenTelemetry (*OTel*)**: instrumentas una vez y envías adonde tú decidas. |
| **Guardias nocturnas (*On-Call*)** | Despertar humanos a las 3:00 a. m. porque un respaldo tardó diez minutos más o un disco llegó al 80 %. | **Solo despierta a alguien lo que ya duele al usuario y exige acción humana inmediata.** |

Mira el cambio completo en la calidad de vida del equipo cuando conectas observabilidad unificada con presupuestos de error objetivos:

![Del falso SRE quemado por alertas basura a la fiabilidad gobernada por SLOs y OpenTelemetry](17-embudo-sli-slo-error-budget.png){ width=92% }

### 17.3. Excentricidades y antipatrones: cambiar firmas de correo sin quitar trabajo manual y la guardia torturadora

Tres escenas reales retratan cómo se pervierte esta disciplina cuando se copia el vocabulario sin tocar la cultura.

#### 1. Rebautizar a los administradores de siempre como "SRE" dejándoles el 95 % de *toil*

Un lunes Recursos Humanos anuncia con pompa la "modernización operativa": los mismos tres administradores de sistemas que venían corriendo detrás de tickets manuales pasan a llamarse en el recibo de sueldo *Site Reliability Engineers*. Les cambian la firma del correo, pero nadie les quita de encima las tareas mecánicas diarias ni les asigna una sola hora protegida para programar automatizaciones.

En *SRE* llamamos ***toil*** (*trabajo penoso repetitivo*) a toda tarea manual, operativa, automatizable y desprovista de valor duradero que crece linealmente con el tamaño del sistema. La regla fundacional de la disciplina exige que un ingeniero de fiabilidad dedique **al menos la mitad de su tiempo a ingeniería** (escribir código y sistemas que eliminen para siempre el problema de mañana) y **nunca más del cincuenta por ciento a apagar fuegos operativos**. Rebautizar un puesto saturado de tareas manuales sin darle tiempo para automatizar es ponerle calcomanías de auto de Fórmula 1 a un tractor empantanado.

#### 2. El tablero verde mientras nadie puede pagar (otra vez el efecto sandía)

Sábado al mediodía de quincena. Cae una queja furiosa por redes sociales diciendo que ningún cliente logra finalizar compras en la tienda electrónica. Abres el monitor de infraestructura y ves una postal idílica: todos los servidores en verde brillante, uso de procesador al ocho por ciento —claro, nadie puede comprar, así que el procesador descansa feliz—, memoria sobrada y cero pérdida de paquetes.

Nadie había configurado una sola métrica de negocio (*"si en horario diurno pasan diez minutos con cero órdenes completadas, dispara alarma máxima"*), ni una sonda sintética externa que simulara un inicio de sesión real desde afuera de la red de la empresa. Estaban vigilando la salud de los ladrillos mientras el local comercial tenía la persiana metálica trabada con candado.

#### 3. La guardia nocturna que fabrica zombis humanos

Por miedo a perderse algo, alguien configura alertas de madrugada para cada estornudo del entorno: CPU encima del setenta y cinco por ciento durante dos minutos, uso de disco al setenta y nueve por ciento, un nodo secundario que parpadeó tres segundos y se recuperó solo. El teléfono del ingeniero de guardia suena catorce veces entre la una y las cinco de la mañana por cosas que no requerían hacer absolutamente nada urgente.

A la tercera semana de tortura del sueño ocurre lo inevitable: el cerebro humano se defiende poniendo el teléfono debajo de la almohada o creando un filtro que manda todos los avisos a una carpeta leída recién después del desayuno. Y la noche en que de verdad revienta la base principal a las dos y cuarto, nadie se entera hasta que abren las oficinas. **Cada alerta basura que suena de madrugada le roba atención a la única emergencia verdadera del año.**

#### Señales de alerta temprana

Tu modelo de confiabilidad y monitoreo está roto si identificas estos síntomas:

- Los clientes o el gerente comercial te avisan por teléfono que un servicio cayó antes de que suene tu propio sistema de monitoreo.
- Tu servidor de monitoreo vive alojado exactamente dentro del mismo único clúster y enlace de internet que debe vigilar (cuando cae la sede, el vigilante muere mudo junto con la víctima).
- Un ingeniero de guardia recibe más de dos llamados nocturnos por semana que se cierran con *"falsa alarma, no había nada que tocar"*.
- Nadie sabe responder con un número exacto qué disponibilidad real tuvo el sistema crítico el mes pasado vista desde el cliente final.
- Careces de trazabilidad para correlacionar un error visto por el usuario con la línea exacta de registro y la consulta de base de datos que lo provocó.

### 17.4. Marco de acción pragmático: OpenTelemetry, stack libre, sonda externa y 3 primeros SLOs

Adoptar lo mejor de *SRE* y observabilidad moderna en una empresa real —aunque tu equipo tenga cuatro personas y cero presupuesto para licencias astronómicas por gigabyte— se ejecuta en cuatro pasos concretos.

#### Paso 1: Estandariza en OpenTelemetry (*OTel*) y registros estructurados

Prohíbe instalar agentes cerrados distintos en cada aplicación o escribir registros en texto libre caótico difícil de filtrar. Instrumenta tus servicios con el estándar abierto mundial de la Fundación Cloud Native: **OpenTelemetry (*OTel*)**, emitiendo registros en formato **JSON estructurado** que incluyan siempre marca de tiempo en UTC, nivel de severidad, servicio, usuario anonimizado e identificador único de traza (`trace_id`), cuidando jamás volcar contraseñas ni datos sensibles en texto plano dentro de los registros.

#### Paso 2: Levanta un stack abierto y austero (más un vigilante fuera de casa)

Construye tu plataforma central de observabilidad con herramientas abiertas livianas que no devoren toda tu memoria RAM:

- **Métricas:** **VictoriaMetrics** o **Prometheus** recolectando series temporales de sistemas, bases y aplicaciones con bajísimo consumo de recursos.
- **Registros (*Logs*):** **Grafana Loki**, que indexa únicamente etiquetas clave en lugar de todo el cuerpo del texto, reduciendo diez veces el costo de almacenamiento frente a motores pesados tradicionales.
- **Trazas:** **Grafana Tempo** o **Jaeger** para seguir viajes lentos entre componentes.
- **Visualización y alertas:** **Grafana** junto a **Alertmanager** agrupando y deduplicando avisos para que una caída de red envíe una sola alerta clara en vez de doscientos mensajes sueltos.
- **El vigilante externo independiente:** Despliega una instancia pequeña de **Uptime Kuma** en un servidor económico **fuera de tu red y proveedor principal**, ejecutando comprobaciones sintéticas cada sesenta segundos contra tus portales, certificados *TLS* (avisando treinta días antes de que venzan) y resolución *DNS*. Así jamás volverás a quedarte sordo cuando caiga tu propio edificio.

#### Paso 3: Arranca definiendo solo 3 SLOs sobre las 4 señales doradas

No intentes medir trescientas cosas el primer día. Elige los **tres recorridos más vitales del negocio** (por ejemplo: *autenticación de usuarios*, *consulta de catálogo/saldo* y *emisión de pedido/factura*) e instruméntalos sobre las **cuatro señales doradas**:

| Señal Dorada | Qué pregunta real responde | Regla práctica de alerta (Despertar vs. Ticket) |
| :--- | :--- | :--- |
| **1. Latencia** | ¿Cuánto tarda en responderse una petición exitosa frente a una fallida (medida en percentil 95/99, no en promedios mentirosos)? | Alerta inmediata solo si la lentitud rompe la experiencia humana sostenida durante > 5 minutos. |
| **2. Tráfico** | ¿Cuántas operaciones reales por minuto están entrando respecto a un día normal a esta hora? | **Ojo al silencio anómalo:** cero pedidos un martes al mediodía es tan urgente como un pico de errores. |
| **3. Errores** | ¿Qué porcentaje de intentos devuelve fallo explícito (`HTTP 5xx`) o respuesta de negocio inválida? | Alerta nocturna gobernada por velocidad de quema (*burn rate*) del presupuesto de error mensual. |
| **4. Saturación** | ¿Qué tan lleno está el recurso más limitado (conexiones de base de datos, cola, memoria o disco)? | Predicción lineal: si el disco se llenará en < 4 horas despierta guardia; si faltan 5 días, abre ticket hábil. |

#### Paso 4: Aplica el impuesto implacable contra el *toil*

Cierra el círculo reservando en cada semana operativa un bloque intocable para matar la tarea manual que más veces interrumpió la guardia anterior: si un servicio requirió ser reiniciado o limpiado a mano dos veces, a la tercera no se documenta un paso manual más largo; se corrige el defecto de memoria o se automatiza su autorrecuperación y auditoría.

Con *DevOps*, *DevSecOps*, *LLMOps* y *SRE* aterrizados sin humo sobre la tierra firme de nuestras empresas, cerramos toda la **Parte III**.

Sin embargo, por muy bien que diseñes redes, contenedores, barandillas y tableros, hay una verdad que todo veterano aprende en carne propia: **algún día igual ocurrirá un incidente grande, algún día igual tendrás que sentarte frente a un directorio incrédulo a defender dinero para cosas invisibles, y algún día te tocará entrar el lunes a rescatar un departamento incendiado**. Para esas batallas decisivas de la vida real reservamos íntegra la **Parte IV**.
