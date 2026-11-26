## Capítulo 12. Gestión de Proyectos y Estrategia de Servicios: Hacer que las cosas terminen

En la primera edición confesé con franqueza algo que sigue provocando miradas raras dentro y fuera del departamento: hablar de un área dedicada específicamente a la **Gestión, Planificación y Estrategia de Servicios** dentro de TI suena, a primera vista, a burocracia exagerada. Como escribí entonces, confunde a mucha gente porque no está llena de programadores ni de administradores de servidores, sino de líderes transversales que coordinan a las demás especialidades técnicas, vigilan riesgos, controlan el pulso económico y negocian codo a codo con Compras e Ingeniería.

Sin embargo, basta mirar el cementerio de iniciativas a medio terminar que acumula cualquier empresa mediana para entender por qué esta función es vital. Los ingenieros excelentes suelen enamorarse del problema técnico y subestimar la coordinación logística; los directivos comerciales suelen enamorarse de la promesa final e ignorar todas las dependencias intermedias. En el medio de ambos mundos alguien tiene que asumir un oficio ingrato pero irreemplazable: **proteger el alcance, despejar obstáculos administrativos y lograr que las cosas realmente se terminen**.

### 12.1. El concepto sin humo: proteger la capacidad para convertir ideas en servicios vivos

Quitémosle la corbata corporativa a las oficinas de proyectos (*Project Management Office* o *PMO*). Cuando funcionan mal, se convierten en una fábrica de planillas y minutas inútiles; cuando funcionan bien, resuelven tres dolores crónicos que ningún especialista técnico puede resolver en soledad:

1. **Impedir que la organización inicie más frentes de los que su plantilla real puede cerrar:** Decir que sí a doce proyectos simultáneos con cuatro ingenieros no es ambición ejecutiva; es garantía matemática de que los doce llegarán tarde y mal.
2. **Coordinar el mundo exterior que no obedece comandos de consola:** Trámites legales, órdenes de compra, tiempos de importación aduanera, contratistas eléctricos, permisos municipales de tendido y ventanas de capacitación a usuarios finales.
3. **Asegurar que un "éxito de proyecto" no sea una bomba de tiempo arrojada sobre Operaciones:** Un sistema que se inaugura el viernes con aplausos pero carece de respaldo, monitoreo y manuales para la mesa de servicio no es un proyecto terminado; es un incidente diferido para el lunes a las ocho de la mañana.

Incluso en una PyME donde no existe sueldo para un director de proyectos exclusivo y este sombrero lo lleva puesto el propio *CIO* o un líder técnico senior tres horas por semana, la disciplina de planificación y cierre sigue siendo exactamente igual de obligatoria.

### 12.2. La teoría vs. la trinchera: ni cascada eterna de dos años ni post-its mágicos contra las leyes físicas

Durante los últimos quince años la gestión de proyectos vivió secuestrada por una guerra religiosa absurda entre dos bandos igual de ciegos cuando se llevan al extremo:

- Por un lado, los nostálgicos de la **planificación predictiva rígida (*Cascada* pura)**, convencidos de que si dibujas en enero un diagrama de barras milimétrico de dieciocho meses para un desarrollo de software incierto, la realidad obedecerá dócilmente al papel.
- Por el otro, los predicadores fundamentalistas del **agilismo de salón**, convencidos de que pegar papeles de colores en una pared y hacer reuniones diarias de quince minutos permite ignorar que un conmutador importado tarda sesenta días en cruzar la aduana o que una migración contable solo puede ejecutarse el fin de semana posterior al cierre fiscal.

En la trinchera tecnológica real de 2026 la respuesta sana es un **enfoque híbrido guiado por la naturaleza física del trabajo**, combinado con una verdad matemática tomada de las líneas de producción industrial (y rescatada de mis apuntes sobre *Kanban*): **limitar con mano de hierro el trabajo en curso (*Work In Progress* o *WIP*)**.

Observa cómo cambia la ejecución cuando combinas hitos duros donde manda la física con flujo continuo donde manda el conocimiento:

| Tipo de restricción | Error habitual en la trinchera | Enfoque híbrido pragmático |
| :--- | :--- | :--- |
| **Compras, obra civil, fibra y cortes** | Improvisar semana a semana descubriendo tarde que falta un contrato o un repuesto. | Hitos secuenciales duros y ruta crítica cerrada antes de comprometer fechas de salida. |
| **Configuración, software y mejoras** | Especificaciones eternas congeladas seis meses antes de mostrar algo funcional. | Entregas incrementales cortas validadas temprano con el usuario real sobre tablero *Kanban*. |
| **Asignación de personas** | Partir al mismo ingeniero en 5 proyectos al *"20 % de dedicación en cada uno"*. | **Límite estricto de WIP:** máximo 1 proyecto principal activo por especialista (cero cambio constante de contexto). |
| **Evaluación inicial de riesgos** | Análisis *D.A.F.O.* formalista copiado y pegado para llenar el expediente. | **Pre-Mortem técnico** crudo antes de gastar el primer dólar o comprometer una fecha. |

Detengámonos un segundo en esa falacia contable de asignar una persona a cinco proyectos simultáneos al veinte por ciento cada uno. Los seres humanos no somos procesadores con memoria infinita: cada vez que sacas a un ingeniero de una migración compleja para meterlo en otra reunión, luego en un incidente y después en un tercer proyecto, entre el treinta y el cuarenta por ciento de su jornada se evapora solo en reconstruir mentalmente por dónde iba. Terminar un proyecto entero en tres semanas y recién entonces empezar el segundo entrega valor al negocio meses antes que arrastrar cinco proyectos en paralelo durante todo el año.

### 12.3. Excentricidades y antipatrones: arrancar por el final, el loro preguntador y el alcance infinito

Si quieres entender por qué fracasa más de la mitad de los proyectos empresariales de tecnología sin necesidad de leer estudios internacionales, basta asomarse a tres escenas que todo veterano lleva grabadas a fuego.

#### 1. Arrancar el proyecto exactamente por el final

Lunes a las nueve de la mañana. Te llaman a una reunión "informativa" donde Mercadeo o Gerencia General anuncia con entusiasmo que la empresa ya publicó en prensa —o prometió por contrato a un cliente clave— que el próximo día primero sale en vivo la nueva plataforma comercial; o bien Compras te reenvía alegremente la factura ya pagada de un sistema contratado el viernes anterior. Acto seguido todos giran la cabeza hacia ti y preguntan: *"Bueno, ¿cuántos días necesitan en Sistemas para dejarlo andando?"*.

No hubo relevamiento de requerimientos, nadie revisó si esa herramienta soporta el volumen transaccional, Seguridad jamás auditó dónde guarda los datos y nadie calculó cuánto cuesta integrarla con el *ERP* actual. Fijar primero la fecha política de inauguración o pagar primero la licencia y recién después averiguar qué había que construir equivale a vender los boletos de un vuelo transatlántico antes de comprobar si el avión tiene motores. Cuando un proyecto nace al revés, todo el ciclo posterior se reduce a recortar calidad, seguridad y horas de sueño para disimular una imprudencia ejecutiva.

#### 2. El gestor de proyectos "loro preguntador"

Es la versión caricaturesca del rol que más rechazo genera entre la gente técnica: alguien que no entiende el alcance, no negocia con proveedores atrasados, no protege al equipo de interrupciones externas y cuyo único trabajo visible consiste en aparecer a las diez de la mañana, a las dos de la tarde y a las cinco y media repitiendo como un loro: *"¿Cómo vamos?, ¿qué porcentaje de avance pongo en el Excel?, ¿llegamos al viernes?"*.

Preguntar tres veces por día cuánto falta no acelera ningún desarrollo; solo le quita tiempo real a la única persona que está intentando terminarlo. Un verdadero líder de proyecto no persigue porcentajes imaginarios (ese famoso proyecto que pasa cuatro meses al *"noventa por ciento de avance"*): despeja bloqueos administrativos afuera para que los ingenieros puedan construir en paz adentro.

#### 3. El alcance elástico infinito (*scope creep*) y el lanzamiento "por encima del muro"

Empiezas acordando construir una bicicleta sencilla para repartir pedidos urgentes. A la segunda semana alguien pide agregarle techo *"ya que estamos tocando eso"*; a la cuarta semana Finanzas exige cuatro ruedas y maletero refrigerado, pero manteniendo exactamente el mismo presupuesto y la misma fecha original de la bicicleta. Si nadie custodia la frontera del alcance diciendo *"excelente idea para la Fase 2 una vez entregada la Fase 1"*, el proyecto jamás cruza la meta.

Y cuando por fin cruza la meta agotado y sin margen, ocurre la traición final interna: el equipo del proyecto descorcha el brindis, da de alta a los usuarios el viernes por la tarde y se desentiende por completo, dejando a Soporte y Operaciones frente a un sistema nuevo del que no tienen diagramas, ni alertas configuradas, ni idea de qué hacer cuando falle el lunes a primera hora.

#### Señales de alerta temprana

Tu cartera de proyectos va directo contra el iceberg si observas estos indicadores:

- Enterarse por rumores o por facturas consumadas de iniciativas tecnológicas que ya tienen fecha comprometida hacia afuera.
- Reportes semanales donde tareas críticas llevan tres semanas seguidas clavadas en el mítico *"85 % o 90 % completado"*.
- Más proyectos activos en la lista oficial que ingenieros disponibles para ejecutarlos sin descuidar la operación diaria.
- Cero participación de *SecOps* y *Service Desk* hasta cuarenta y ocho horas antes de la puesta en producción.
- Ningún proyecto cancelado ni pausado formalmente en los últimos dos años pese a haber sumado diez urgencias nuevas encima.

### 12.4. Marco de acción pragmático: candado en compras, Pre-Mortem crudo y definición de operable

Hacer que los proyectos tecnológicos terminen a tiempo y sin cadáveres en el camino no exige certificaciones pomposas; exige instalar cuatro compuertas simples y firmes.

#### Paso 1: Instala el Candado Cero en Compras y Dirección

Acuerda con Gerencia General y Administración una regla administrativa de dos líneas: **Compras no puede liberar ninguna orden de pago de software, hardware o consultoría tecnológica —ni Comercial puede firmar fechas técnicas ante terceros— sin una Ficha de Factibilidad de una carilla firmada por TI y Seguridad**. No es un trámite de tres meses; es una revisión rápida de cuarenta y ocho horas que verifica compatibilidad, costos ocultos a tres años, seguridad de datos y capacidad real del equipo antes de atarse las manos.

#### Paso 2: Reemplaza el viejo D.A.F.O. por un Pre-Mortem técnico implacable

En la edición de 2022 incluí realizar análisis *D.A.F.O.* tradicionales al planificar proyectos. Con la mano en el corazón: en la práctica casi todo el mundo llena esos cuatro cuadrantes con frases tibias de compromiso que no previenen ningún desastre.

Sustitúyelo por un ritual infinitamente más efectivo de cuarenta y cinco minutos antes de arrancar cualquier proyecto relevante: el **Pre-Mortem técnico**. Reúne a quienes van a construirlo, asegurarlo y soportarlo y plantea esta consigna exacta:

> *"Viajemos seis meses hacia el futuro: este proyecto acaba de fracasar de manera estrepitosa, generó pérdidas y tumbó la operación. Escriba cada uno en silencio las tres razones reales por las que nos estrellamos."*

Cuando le das permiso explícito al equipo para señalar el desastre *antes* de empezar, afloran en diez minutos todas las verdades que nadie se animaba a decir por cortesía política: que los datos de origen están podridos, que el proveedor externo nunca entrega las *APIs* a tiempo, que coincide con el cierre anual contable o que nadie sabe operar esa base de datos. Conviertes esos puntos en controles concretos antes de mover una sola piedra.

#### Paso 3: Gobierna la cartera en un tablero único con regla "uno entra, uno sale"

Deja las hojas de cálculo ocultas y publica toda la cartera activa en una herramienta abierta, limpia y visible como **OpenProject**, **Plane** o **Taiga**, fijando un tope innegociable de trabajo en curso (*WIP*).

Si la capacidad real de tu departamento —descontando operación, incidentes y el veinte por ciento de saneamiento de deuda visto en el Capítulo 2— permite ejecutar **tres proyectos serios este trimestre**, el tablero tiene exactamente tres casillas activas. Cuando un director llegue el martes con una iniciativa "impostergable", jamás le respondas con un *"no se puede"* seco; muéstrale el tablero abierto y hazle la única pregunta adulta posible: ***"Con todo gusto lo arrancamos mañana mismo; indícame por escrito cuál de estos tres proyectos aprobados pasamos a congelador para liberar al equipo"***.

#### Paso 4: Exige la "Definición de Terminado y Operable" antes de descorchar nada

Prohíbe dar por concluido un proyecto solo porque *"la pantalla ya abre en producción"*. Ninguna iniciativa cierra su acta ni libera a sus responsables hasta superar estos cinco puntos de entrega limpia hacia la operación:

| Criterio de cierre real | Qué se verifica objetivamente | Quién da el visto bueno |
| :--- | :--- | :--- |
| **1. Seguridad base validada** | Autenticación integrada, privilegios mínimos, sin secretos expuestos ni puertos sobrantes. | *CISO / SecOps*. |
| **2. Continuidad y respaldo probado** | Copia automática activa bajo regla 3-2-1-1-0 y **una restauración real verificada**. | Sistemas e Infraestructura. |
| **3. Monitoreo encendido** | Alertas reales de caída, errores y capacidad conectadas antes del primer usuario. | Sistemas / Observabilidad. |
| **4. Soporte entrenado (*Runbook*)** | Guía operativa en **BookStack / Outline** y sesión de traspaso para casos N1/N2. | *Service Desk*. |
| **5. Apagado de lo viejo** | Si reemplaza a otro sistema, fecha firme agendada para retirar y dejar de pagar el anterior. | *BRM / FinOps*. |

Con los proyectos aterrizando enteros y a tiempo, nos queda por examinar el octavo y último dominio de esta anatomía departamental antes de saltar a las metodologías modernas: el rincón donde se decide si el software propio de la empresa será un activo limpio durante diez años o un laberinto indescifrable a los seis meses: **Arquitectura de Software y Desarrollo**.
