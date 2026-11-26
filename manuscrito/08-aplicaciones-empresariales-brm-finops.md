## Capítulo 8. Aplicaciones Empresariales (BRM/ERP) y FinOps: Hablar el idioma del dinero

Cuando releo la primera edición de 2022 siempre me detengo con una sonrisa en cómo titulé al líder del **Área de Negocio y Aplicaciones Empresariales**: lo llamé directamente *"Gerente Financiero"*. Técnicamente el nombre se prestaba a confusión con el director administrativo de la empresa, pero detrás de ese bautizo había una verdad profunda que en 2026 se volvió más urgente que nunca: quien lidera las aplicaciones nucleares de negocio debe hablar con absoluta fluidez el idioma de la contabilidad, de los procesos operativos y del dinero.

En esta edición corregimos el título sin perder el colmillo. Este octavo dominio une dos disciplinas inseparables en una organización moderna: por un lado, el liderazgo de **Aplicaciones Empresariales** y relación con el negocio (*Business Relationship Manager* o *BRM*), responsable de traducir la operación real sobre sistemas *ERP, CRM, BI, BPM, HCM* y nómina; por el otro, la práctica de **FinOps** (*Financial Operations*), encargada de iluminar con luz de quirófano cada dólar gastado en licencias, suscripciones *SaaS* y consumo de nube para convertir el presupuesto de TI en una conversación financiera adulta.

### 8.1. El concepto sin humo: procesos limpios adentro y cuentas claras afuera

Quitémosle las siglas de consultoría a ambas mitades de este rol para ver qué problema real resuelven un lunes a las nueve de la mañana.

Una empresa no compra un *ERP* (*Enterprise Resource Planning*), un *CRM* comercial, un gestor de capital humano (*HCM*) o un motor de inteligencia de negocios (*Business Intelligence* o *BI*) para tener pantallas bonitas; los implementa para que una venta registrada en la punta comercial descuente inventario en almacén, dispare la orden logística, emita la factura fiscal y asiente el cobro en contabilidad **una sola vez y sin intervención artesanal en el medio**.

El papel del líder de Aplicaciones Empresariales (*BRM*) consiste en pararse exactamente en la frontera entre los dueños funcionales del negocio y el equipo técnico para evitar dos tragedias simétricas: impedir que los técnicos programen soluciones desconectadas de la ley contable o laboral, e **impedir que los gerentes funcionales deformen el software estándar para perpetuar vicios administrativos absurdos**.

¿Y dónde entra **FinOps** en esta ecuación? Durante treinta años la informática compró activos una vez cada cuatro años: pedías cotización de un servidor y cien licencias perpetuas, Finanzas aprobaba la orden de compra, amortizaba el bien y nadie volvía a tocar el tema. Hoy el gasto tecnológico es un grifo abierto por minuto y por usuario: decenas de suscripciones mensuales cobradas por asiento, instancias elásticas, almacenamiento que crece en silencio, créditos de interfaces de programación (*APIs*) y renovaciones anuales automáticas.

*FinOps* no significa "recortar gastos a hachazos para dejar contento al contador"; significa **trazabilidad financiera y economía unitaria**. Es poder sentarse frente al directorio y responder sin tartamudear cuánto cuesta tecnológicamente procesar cada pedido, cuánto gasta en licencias reales el departamento comercial frente a producción y qué retorno concreto produce cada plataforma encendida.

### 8.2. La teoría vs. la trinchera: del ecosistema integrado a la jungla de Excel y tarjetas sueltas

En la teoría corporativa ideal, todas las transacciones de la compañía fluyen limpias hacia un único *ERP* inmaculado, los tableros de *BI* reflejan el cierre financiero al minuto y un equipo especializado vigila cada etiqueta de gasto en tiempo real.

En la trinchera cotidiana de una empresa mediana o PyME, la escena suele parecerse mucho más a un mercado persa. El *ERP* oficial lleva años parchado por tres consultoras distintas que se odian entre sí; cada área descarga listados a medias los viernes y los cruza en quince hojas de cálculo locales cuyas fórmulas nadie audita —logrando que en la reunión del lunes Ventas declare haber vendido cien, Logística diga haber entregado ochenta y Finanzas asegure haber facturado setenta—; mientras tanto, mercadeo, recursos humanos y operaciones contratan herramientas en la nube por su cuenta pasando la tarjeta corporativa del jefe de área.

Observa el contraste entre operar a ciegas y gobernar aplicaciones y dinero bajo una misma disciplina:

| Dimensión de negocio y gasto | Caos habitual en la trinchera | Gobierno sano (BRM + FinOps) |
| :--- | :--- | :--- |
| **Adopción del *ERP*** | Se reescribe medio sistema a medida para imitar el formulario en papel de 1998. | **Regla 80/20 (*Clean Core*):** el proceso se adapta al estándar; solo se extiende lo diferencial. |
| **Reportes y *BI*** | Guerra de Excels contradictorios armados a mano antes de cada comité. | Una sola capa analítica auditada conectada a datos maestros limpios. |
| **Compras de *SaaS*** | Cada gerencia contrata suscripciones aisladas sin avisar a TI ni a Seguridad. | Registro central obligatorio con dueño nominal, revisión de seguridad y fecha de vencimiento. |
| **Visibilidad del gasto TI** | Una bolsa opaca llamada *"Gastos de Sistemas"* que siempre parece carísima. | Costo asignado por área consumidora y medido como costo unitario por transacción o cliente. |

Mira cómo este dominio transforma la relación entre tecnología y finanzas cuando reemplazas la caja negra por gobierno funcional y visibilidad económica:

![De la opacidad del ERP deformado y el despilfarro SaaS al gobierno BRM y FinOps](08-puente-brm-erp-finops.png){ width=92% }

### 8.3. Excentricidades y antipatrones: la factura sorpresa de fin de año, el Frankenstein a medida y el Excel paralelo

Si quieres ganarte la atención inmediata de cualquier gerente general escéptico, no le hables de arquitectura: muéstrale la radiografía real de lo que su empresa está pagando hoy por cosas que nadie usa.

Hay una escena que he visto repetirse con precisión quirúrgica en cierres anuales de presupuesto: **la gran factura sorpresa de nube y *SaaS***.

Todo empieza con aparente inocencia. Alguien contrata veinte licencias anuales de diseño o gestión con renovación automática; otro equipo levanta cuatro servidores grandes en la nube *"solo por dos semanas para probar una migración"*; ventas suma cincuenta asientos de una herramienta telefónica; y durante dos años entran y salen cuarenta empleados por rotación normal de personal. Como nadie cruza las bajas con la facturación de proveedores ni apaga entornos huérfanos, llega diciembre y Finanzas descubre con espanto que la empresa acaba de pagar decenas de miles de dólares por asientos asignados a exempleados que trabajan en otra firma desde hace catorce meses, discos virtuales desconectados cobrando cada hora y tres herramientas distintas pagadas en paralelo que cumplen exactamente la misma función.

Ese sangrado silencioso suele ir de la mano de otros dos antipatrones clásicos en el mundo de las aplicaciones empresariales:

#### 1. El monstruo de Frankenstein del *ERP* deformado a medida

Cuando una empresa implanta un *ERP*, siempre aparece algún jefe administrativo diciendo la frase maldita: *"Aquí siempre hemos aprobado las compras con cinco firmas cruzadas según el día de la luna; modifiquen el sistema para que haga exactamente lo mismo"*.

Si el líder de aplicaciones carece de carácter y cede a cada capricho, en dos años habrás pagado miles de horas de consultoría para tocar las tripas del sistema estándar hasta convertirlo en un engendro único en el planeta. El castigo llega el día que cambia la ley impositiva y necesitas actualizar de versión: el fabricante te informa que tus trescientos parches artesanales rompen toda actualización oficial y que migrar cuesta tanto como comprar e implantar el *ERP* entero de nuevo. **Automatizar un proceso burocrático estúpido nunca produce eficiencia: solo produce burocracia estúpida automatizada e imposible de actualizar.**

#### 2. La dictadura de la "contabilidad paralela" en hojas de cálculo

Ocurre cuando la organización gasta una fortuna en sostener un sistema empresarial, pero tolera que los mandos medios sigan tomando decisiones sobre archivos locales guardados en su escritorio porque *"el reporte del sistema no me gusta cómo sale"*. En lugar de corregir el dato maestro en el origen o construir el reporte oficial una sola vez en la plataforma de *BI*, se institucionaliza una fábrica manual de copiar y pegar donde un dedo mal puesto en una celda mueve millones ficticios en el balance mensual.

#### Señales de alerta temprana

Sabes que necesitas intervención urgente en Aplicaciones y *FinOps* cuando detectas esto:

- Nadie en TI ni en Contabilidad tiene una lista única con todas las suscripciones *SaaS* activas, sus fechas de preaviso de cancelación y quién las autorizó.
- Sigues pagando licencias mensuales nominales de correo, *CRM* o herramientas colaborativas de personas desvinculadas hace más de treinta días.
- Tu *ERP* lleva tres o más versiones mayores de atraso porque *"si actualizamos perdemos los desarrollos hechos a medida"*.
- Dos gerentes llegan al comité mensual con números de ventas o costos distintos para el mismo período.
- El cien por ciento de la factura tecnológica se imputa contablemente como gasto interno de TI, haciendo que el resto de las áreas pidan licencias y recursos como si fueran gratis.

### 8.4. Marco de acción pragmático: regla 80/20, núcleo limpio y disciplina FinOps desde el primer mes

Poner orden financiero y funcional en las aplicaciones de negocio es una de las intervenciones más agradecidas de toda la gestión tecnológica, porque suele **pagarse sola en noventa días** con el dinero recuperado del despilfarro oculto.

#### Paso 1: Impón la regla del 80/20 y la doctrina de *Clean Core* en tu ERP y BI

Tanto si operas sobre plataformas abiertas consolidadas —como **ERPNext** u **Odoo**— como si tu empresa ya corre sobre un *ERP* propietario tradicional, establece por política escrita la regla del **núcleo limpio (*Clean Core*)**:

1. **Del 80 % al 90 % de los procesos** (contabilidad general, cuentas por pagar, inventario estándar, compras, liquidación de nómina) **se adaptan sin excusas al flujo nativo del software**. Si el estándar mundial resuelve un asiento en tres pasos y tu empresa lo hacía en nueve, se cambia el procedimiento interno, no el código del sistema.
2. **Solo el 10 % al 20 % verdaderamente diferencial** para tu negocio se desarrolla o integra, y siempre **por fuera del núcleo** usando interfaces de programación (*APIs*), eventos o módulos desacoplados que jamás impidan actualizar la versión base.
3. Conecta sobre esa base limpia una única herramienta abierta y auditable de *BI* —como **Metabase** o **Apache Superset**— donde Finanzas y el *BRM* certifiquen una sola definición matemática para cada indicador clave. Queda prohibido presentar en directorio cifras sacadas de planillas artesanales no conectadas a la fuente oficial.

#### Paso 2: Etiqueta todo gasto y aplica el estándar abierto FOCUS

Aterriza la metodología de la **FinOps Foundation** y su especificación abierta de costos **FOCUS** (*FinOps Open Cost and Usage Specification*) —complementada con **OpenCost** si operas contenedores o nubes híbridas— mediante cuatro reglas operativas que no cuestan un centavo:

- **Prohibido existir sin dueño ni etiqueta:** Ninguna máquina virtual, base de datos, cubo de almacenamiento ni suscripción *SaaS* puede crearse sin cuatro metadatos obligatorios: `owner` (persona responsable), `cost_center` (departamento del negocio que consume el servicio), `env` (producción, pruebas o temporal) y `ttl` (fecha de caducidad automática para todo entorno no productivo).
- **Imputación transparente (*Showback / Chargeback*):** Aunque Finanzas pague una sola factura consolidada, publica cada mes el desglose exacto de cuánto consumió Comercial, cuánto Operaciones y cuánto Recursos Humanos. Cuando un gerente ve descontado en su propio presupuesto el capricho de pedir cincuenta licencias *premium*, su criterio de ahorro mejora milagrosamente de un día para el otro.
- **Alertas duras antes del desastre:** Configura avisos automáticos al **50 %, 80 % y 100 %** del presupuesto mensual en cada cuenta de nube o consumo de *APIs* para detectar en horas —y no treinta días después— un bucle roto o una consulta descontrolada.

#### Paso 3: Ejecuta la cacería mensual de licencias zombis y calcula tu costo unitario

El último día hábil de cada mes, el *BRM* junto a Soporte ejecuta una revisión de treinta minutos con impacto directo en caja:

| Control mensual FinOps | Criterio objetivo de corte | Destino estratégico del ahorro |
| :--- | :--- | :--- |
| **Auditoría de asientos *SaaS*** | Toda licencia paga sin inicio de sesión en los últimos **30 días** (salvo licencia médica/vacaciones) pasa a plan gratuito o se revoca. | Crear un fondo visible de reinversión para renovar infraestructura vencida o controles de seguridad. |
| **Limpieza de recursos huérfanos** | Discos desacoplados, direcciones IP públicas sin uso, instantáneas viejas de prueba y entornos con `ttl` vencido se eliminan. | Reducir entre 15 % y 30 % la factura fija mensual de nube en el primer trimestre. |
| **Calendario de renovaciones** | Alerta obligatoria **60 días antes** de cualquier renovación anual automática para renegociar precios o cancelar a tiempo. | Eliminar para siempre las renovaciones forzosas por olvido administrativo. |

Corona este hábito publicando una sola métrica de **economía unitaria** entendible por cualquier socio de la firma: *costo total tecnológico dividido entre pedidos facturados* (o clientes activos). Si las ventas suben un cuarenta por ciento y el costo tecnológico por pedido baja un diez por ciento, ya nadie volverá a mirar tu presupuesto como un agujero negro: estarás demostrando con contabilidad pura que una buena ingeniería multiplica la rentabilidad del negocio.

Con las cuentas claras y los procesos troncales gobernados, bajemos ahora a la trinchera donde el departamento entero se juega su reputación humana todos los días frente a cada empleado de la empresa: el **Service Desk** gobernado con **ITIL 4 pragmático**.
