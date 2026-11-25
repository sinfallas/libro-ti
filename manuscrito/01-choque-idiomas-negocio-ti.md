# Parte I — El Entorno de TI en 2026: Cultura, Negocio y Fricciones

## Capítulo 1. El choque de idiomas entre Negocio y TI

En la primera edición abrí la discusión organizacional con una frase del psicólogo Kurt Lewin que sigue siendo la mejor radiografía jamás escrita sobre nuestro oficio:

> *"Si usted realmente quiere entender algo, trate de cambiarlo."*

Basta intentar cambiar un solo hábito dentro de una empresa —pedir que las solicitudes entren por un formulario en lugar de por un mensaje de voz, exigir una ventana de mantenimiento o proponer retirar un servidor que lleva ocho años encendido de milagro— para descubrir de inmediato qué lugar ocupa realmente la tecnología en la cabeza de quienes dirigen la organización.

A lo largo de los años he comprobado que muchos conceptos tecnológicos parecen contradecirse de una empresa a otra por una razón muy simple: antes de escribir una sola línea de código o tender un metro de fibra, cada compañía proyecta sobre su departamento de TI su propia idea de qué es hacer negocios y para qué existe la empresa. Donde la dirección entiende la tecnología como palanca operativa, TI se sienta a planificar antes de que se firmen contratos imposibles; donde la dirección la concibe como un mal necesario parecido al recibo de la electricidad, TI queda relegada al sótano simbólico (y demasiadas veces físico) al que solo se baja para gritar cuando se corta la luz.

### 1.1. El concepto sin humo: cada empresa tiene el TI que su idea de negocio merece

Quitémosle el barniz académico al llamado *"alineamiento estratégico entre TI y el negocio"*. En la vida real, ese concepto significa algo mucho más terrenal: lograr que quienes pagan la nómina y quienes sostienen los sistemas hablen de los mismos problemas usando unidades de medida compatibles.

El divorcio crónico entre ambas orillas no es una maldición inevitable ni una conspiración unilateral. Si queremos ser intelectualmente honestos, la culpa se reparte exactamente al cincuenta por ciento.

La primera mitad de la responsabilidad recae en una cultura directiva no técnica que sigue tratando a TI como una caja negra de gasto puro. Son gerencias que diseñan productos comerciales, prometen fechas de lanzamiento a clientes o firman contratos con proveedores externos sin consultar jamás la viabilidad técnica, y que recién avisan a Sistemas el viernes por la tarde para que *"conecten todo antes del lunes"*. Ven la tecnología como un taller mecánico molesto: si los motores giran, nadie pregunta cómo están los frenos; si algo falla, todo el gasto acumulado parece excesivo.

Pero la otra mitad de la culpa la fabricamos nosotros desde adentro. En nuestro gremio abunda una soberbia silenciosa que disfruta atrincherándose detrás de siglas impenetrables. He visto ingenieros brillantes perder en tres minutos la atención de un comité directivo porque pretendían justificar una compra urgente hablando de latencia en el percentil noventa y nueve, agotamiento de *IOPS* en la cabina de discos, colisiones de *VLAN* o vulnerabilidades *CVE* con puntaje crítico, sin molestarse en explicar qué tenía que ver todo eso con despachar camiones, cobrar facturas o evitar una multa regulatoria.

Cuando un informático no sabe —o considera indigno de su pureza técnica— explicar cómo gana dinero la empresa que le paga el sueldo, renuncia voluntariamente a participar en las decisiones adultas. Si tú hablas en paquetes por segundo mientras el gerente general piensa en flujo de caja, riesgo legal y retención de clientes, no tienes un problema tecnológico: tienes a dos sordos discutiendo en idiomas distintos mientras el edificio huele a cable quemado.

### 1.2. La teoría vs. la trinchera: el espejo roto de las percepciones

En la literatura corporativa y en las conferencias de las grandes tecnológicas —las antiguas *FAANG* y los gigantes nacidos en torno al software— esta fricción suele resolverse a fuerza de escala y presupuesto. Allí existen gerentes de producto técnico dedicados a traducir prioridades, analistas financieros asignados a cada tribu de ingeniería, telemetría en tiempo real conectada a métricas de ingresos y equipos donde nadie toca producción sin pasar por flujos automatizados.

En la trinchera de una empresa mediana o de una PyME hispanoamericana, el paisaje se parece bastante menos a un campus californiano y bastante más a una guardia de urgencias en noche de quincena. Tres o cuatro personas sostienen a pulso la conectividad de sucursales, el sistema de planificación de recursos empresariales (*Enterprise Resource Planning* o *ERP*), los respaldos, las cuentas de correo, las auditorías de clientes y la portátil del gerente comercial que dejó caer café sobre el teclado media hora antes de una presentación.

De ese choque de escalas nacen dos percepciones enfrentadas que ya apuntaba en 2022 y que hoy, lejos de suavizarse, se han vuelto más agudas. Observa cómo el mismo fenómeno diario se interpreta de forma opuesta según el lado del mostrador:

| Dimensión operativa | Cómo lo ve el Negocio desde afuera | Qué vive realmente TI en la trinchera |
| :--- | :--- | :--- |
| **Velocidad y capacidad** | *"TI no es ágil, cuesta demasiado y seguro tiene recursos técnicos o humanos ociosos."* | Lo urgente de cada hora devora a lo importante; el día se va apagando incendios no planificados. |
| **Ejecución de proyectos** | *"Los proyectos tecnológicos nunca terminan a tiempo, o directamente no terminan jamás."* | El mismo técnico que debe migrar el servidor es interrumpido veinte veces al día por urgencias informales. |
| **Prioridades y trato** | *"Para que Sistemas te resuelva rápido hay que ser amigo del técnico o escalar a gritos."* | La ausencia de acuerdos de nivel de servicio (*SLAs*) institucionaliza la informalidad, la burocracia mal entendida y el **amiguismo**. |
| **Dinero y resultados** | *"TI no es transparente con los costos ni entrega lo que pedimos cuando el mercado lo exige."* | Sin catálogo ni medición formal de servicios resulta imposible sentarse a conversar con datos objetivos. |

Lo más peligroso de esta tabla es que **ambas partes tienen razón en lo que perciben**, porque están atrapadas en un sistema que se retroalimenta solo. Cuando no existe una frontera clara para recibir, clasificar y medir el trabajo, la organización entra en una espiral destructiva de la que nadie sale ileso:

![El bucle de desconfianza entre Negocio y TI](01-bucle-desconfianza-negocio-ti.png){ width=92% }

Repasa con calma ese circuito porque explica el ochenta por ciento del desgaste emocional en nuestro sector. Cada vez que alguien del equipo técnico acepta resolver *"un favorcito de cinco minutos"* pedido en el pasillo o por mensajería instantánea, cree estar siendo colaborativo. En realidad está firmando su propia sentencia: ese esfuerzo no queda registrado en ningún lado, el tiempo invertido se le roba en silencio al proyecto trimestral que sí mira la gerencia, el proyecto se atrasa y, a fin de año, la dirección concluye que el departamento es lento e ineficiente. Acto seguido recorta presupuesto o congela contrataciones, aumentando la presión y multiplicando los incendios del mes siguiente.

### 1.3. Excentricidades y antipatrones: del "tiene enchufe" a los proyectos zombis

Si hubiera que elegir el malentendido más caro dentro y fuera de un departamento de tecnología, ganaría por goleada la fantasía corporativa de que **todos los informáticos somos iguales y servimos exactamente para lo mismo**.

Fuera del área técnica casi nadie le pediría al contador fiscal que rediseñe la campaña gráfica de mercadeo, ni al abogado laboral que repare el montacargas del almacén. Sin embargo, basta llevar colgada la etiqueta de "Sistemas" para que una parte sorprendente de la empresa asuma que posees un conocimiento místico universal sobre cualquier objeto que funcione con corriente alterna.

A lo largo de mi carrera he visto cómo ese mito produce dos aberraciones cotidianas. La primera es pintoresca hasta que deja de hacer gracia: el síndrome de *"tiene enchufe, llámenle a Sistemas"*. Da igual si eres administrador de redes, arquitecto de software o especialista en seguridad; nunca falta quien te interrumpa en mitad de una contingencia crítica para pedirte que cuadres una fórmula rebelde en una planilla contable, destrabes una impresora matricial cubierta de polvo, revises por qué no enfría el aire acondicionado de la sala de reuniones o configures el televisor inteligente del despacho presidencial.

La segunda consecuencia del mismo mito no tiene nada de pintoresca: **los recortes ciegos de plantilla**. Cuando un directivo mira una nómina de seis personas en TI sin entender qué función cumple cada especialidad, su intuición contable le susurra que *"hay demasiada gente haciendo lo mismo"*. Entonces despide o no reemplaza al responsable de redes o de respaldos esperando que el desarrollador de aplicaciones absorba esa carga *"en sus ratos libres"*. El resultado equivale a quitarle el anestesista a un quirófano porque ya hay un cirujano presente: durante un par de semanas parece que ahorraste un sueldo, hasta que la primera emergencia real demuestra por las malas que las especialidades no eran intercambiables.

Junto a esta confusión de roles conviven otros dos antipatrones que pudren la relación con el negocio:

- **La epidemia de proyectos zombis:** Iniciativas aprobadas con entusiasmo en enero a las que jamás se les asignaron horas protegidas ni criterios de cierre. No están vivas porque nadie trabaja en ellas de forma sostenida, pero tampoco nadie se atreve a declararlas muertas en un acta. Siguen caminando por las presentaciones mensuales consumiendo reuniones de seguimiento vacías y erosionando la credibilidad del área.
- **La tiranía del pasillo, el WhatsApp y el *amiguismo*:** Donde no hay reglas públicas de atención, manda la ley de la selva corporativa. Se atiende primero a quien cae más simpático, a quien comparte el café de la mañana con el técnico o al gerente que levanta más la voz. Peor aún: los cambios ejecutados a las corridas por pedido verbal no dejan rastro documental, rompen dependencias que nadie evaluó y terminan en culpas cruzadas cuando el servicio cae.

Frente a este desorden he visto fracasar todas las posturas tibias. Intentar educar a la organización con *"excepciones razonables"* —diciendo que el sistema de tickets es obligatorio salvo cuando un jefe tiene prisa— garantiza que al tercer día absolutamente todo vuelva a ser urgente y verbal.

Por eso mi postura en la trinchera es de **tolerancia cero absoluta**: **si no existe un ticket previo con el formulario completo, nadie en TI mueve un dedo, aunque quien lo pida sea un gerente o el dueño de la silla más alta del piso**.

Sé perfectamente que la primera semana que aplicas esta regla a rajatabla se levantan ampollas, llueven quejas y más de un ego acostumbrado al atajo intenta medir fuerzas. Pero ocurre algo revelador en cuanto la dirección comprende que la regla no es capricho burocrático sino protección operativa para todos:

1. Desaparecen por arte de magia la mitad de las supuestas *"urgencias de vida o muerte"* que ni siquiera justificaban dos minutos del solicitante llenando cuatro campos claros.
2. Se acaba el *amiguismo* porque el orden de atención responde al impacto real sobre el negocio y no a la simpatía personal.
3. Por primera vez existen números irrefutables sobre cuántas horas reales consume el soporte diario, quién genera más incidentes repetitivos y cuánta capacidad neta queda para ejecutar proyectos sin mentir en las fechas.

#### Señales de alerta temprana en tu organización

Sabes que el choque de idiomas ya está causando daño estructural cuando detectas tres o más de estos síntomas:

- Los técnicos reciben solicitudes laborales en su teléfono personal fuera de horario como práctica normalizada.
- Nadie fuera de TI sabe explicar quién administra la infraestructura, quién ve las aplicaciones y quién audita la seguridad.
- Tienes más proyectos "en curso" que personas reales dentro del departamento técnico.
- En las reuniones con gerencia se discuten marcas de hardware o nombres de herramientas antes de definir qué problema de negocio se quiere resolver.
- Cuando pides reforzar un servicio crítico, la respuesta habitual es *"nunca se ha caído, así que no hace falta gastar"*.

### 1.4. Marco de acción pragmático: diccionario financiero y orden desde el día uno

Romper este ciclo no requiere contratar una consultoría millonaria ni paralizar la empresa seis meses redactando manuales que nadie va a leer. Requiere intervenir en dos frentes simultáneos: cambiar el vocabulario con el que te sientas ante la directiva e imponer una puerta única de entrada al trabajo técnico.

#### Paso 1: Habla en dinero por hora, riesgo legal y continuidad

Antes de llevar cualquier propuesta técnica a gerencia, pásala por un filtro implacable: elimina las siglas internas del título y exprésala en impacto sobre facturación, costos evitados o exposición legal. Dos métricas abiertas de continuidad te darán aquí más autoridad que cien diapositivas técnicas: el *Recovery Time Objective* (*RTO*, tiempo máximo que el negocio soporta estar caído antes de sangrar dinero grave) y el *Recovery Point Objective* (*RPO*, cuántas horas o minutos de datos transaccionales puede permitirse perder sin rehacer la contabilidad a mano).

Usa esta tabla de conversión como plantilla base para tus próximas conversaciones presupuestarias:

| Lo que solemos decir en jerga TI | Lo que escucha la gerencia | Cómo traducirlo al idioma del negocio |
| :--- | :--- | :--- |
| *"Necesitamos cambiar los switches de acceso porque están End-of-Life y sin soporte."* | *"Quieren comprar juguetes nuevos aunque la red hoy funciona."* | *"Si este equipo falla un lunes, 80 personas quedan sin facturar durante 48 horas mientras conseguimos repuesto. Cada hora parados cuesta X dólares; renovarlo cuesta menos que medio día caídos."* |
| *"Hay que segmentar la red plana en VLANs y cerrar permisos de administrador local."* | *"Nos quieren poner trabas internas y complicar el trabajo."* | *"Hoy, si un solo empleado abre un archivo malicioso en ventas, el secuestro de datos paraliza también contabilidad y almacén en diez minutos. Aislar áreas limita el incendio a una sola oficina."* |
| *"Debemos probar la restauración completa de los backups en un entorno aislado."* | *"Piden horas extra para revisar copias que ya se hacen todas las noches."* | *"Tener archivos guardados no garantiza poder arrancar el ERP tras un desastre. Hoy desconocemos si tardaríamos 4 horas o 9 días en volver a cobrar; esta prueba certifica el tiempo real de recuperación."* |
| *"Sin ticket completo previo no vamos a atender requerimientos directos."* | *"Sistemas se puso burocrático y no quiere colaborar."* | *"Para entregar a tiempo los tres proyectos que dirección nos pidió este trimestre, necesitamos eliminar el trabajo fantasma y priorizar fallos que detienen ventas por encima de ajustes cosméticos."* |

#### Paso 2: Implanta puerta única con herramientas libres probadas

No uses el presupuesto como excusa para seguir gestionando el departamento por correo suelto o chats grupales. Existen plataformas de código abierto maduras, auditables y sin costo de licenciamiento por agente que puedes levantar en contenedor en una tarde:

- **GLPI:** Ideal cuando además de mesa de servicios (*Service Desk*) con formularios estrictos necesitas inventario automático de activos, contratos de proveedores y control del ciclo de vida del equipamiento en una misma base de datos.
- **Zammad:** Excelente alternativa moderna si buscas una interfaz rápida para usuarios y técnicos, trazabilidad limpia de tiempos de respuesta y reglas claras de escalamiento sin curvas de aprendizaje eternas.
- **osTicket:** La opción minimalista de combate cuando el hardware disponible es mínimo y necesitas pasar del caos absoluto al registro formal obligatorio en cuestión de horas.

Elige una sola herramienta, diseña formularios breves pero obligatorios (qué sistema falla, a cuántos usuarios o clientes detiene, evidencia del error y aprobación si implica permisos) y consigue el respaldo escrito de la gerencia general antes de encender la regla de tolerancia cero. Una nota de tres párrafos firmada por dirección anunciando que *ningún trabajo técnico está autorizado fuera del portal* te ahorrará meses de discusiones personales en los pasillos.

#### Paso 3: Publica quién hace qué y mata los proyectos zombis

La transparencia desarma los mitos. Publica en la intranet o wiki interna una página sencilla con las funciones reales que cubre el departamento, quién lidera cada frente, qué cosas **sí** atiende TI y qué cosas no forman parte de su alcance. En paralelo, reúne la lista completa de proyectos abiertos, calcula cuántas horas reales quedan libres tras restar la operación medida en tickets y obliga al negocio a elegir qué dos o tres iniciativas siguen vivas este trimestre congelando explícitamente el resto.

Cuando dejas de decir que sí en los pasillos, traduces los riesgos a moneda dura y muestras con datos limpios en qué se invierte cada hora de ingeniería, ocurre un cambio silencioso pero definitivo: dejas de ser el mecánico al que llaman cuando algo echa humo y empiezas a sentarte en la mesa como alguien que gobierna una parte vital del negocio. Recién sobre ese terreno firme vale la pena examinar el siguiente enemigo silencioso de todo entorno tecnológico: la deuda técnica y la adicción corporativa al último artilugio de moda.
