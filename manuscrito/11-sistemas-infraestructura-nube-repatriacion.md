## Capítulo 11. Sistemas e Infraestructura: Nube pública vs. virtualización on-premise y repatriación

En la edición de 2022 señalé una injusticia de lenguaje muy extendida en el mundo empresarial: al **Área de Sistemas e Infraestructuras** suele colgarle la etiqueta despectiva de *"commodity"* —como si fuera azúcar a granel o bolsas de cemento genéricas—, pese a ser el cimiento literal que sostiene absolutamente todo servicio de información y cuyos costos pueden hacer ganar o perder fortunas silenciosas a la compañía.

También habrás notado en el mapa de migración un ajuste quirúrgico respecto a 2022: entonces coloqué al *Ingeniero de Fiabilidad del Sitio (SRE)* directamente como cabeza de este dominio. La experiencia acumulada en estos años demostró que conviene separar ambos planos: la metodología **SRE y Observabilidad** merece su propio capítulo profundo en la Parte III (Capítulo 17), mientras que aquí necesitamos hablar sin rodeos del oficio puro y duro de **Sistemas e Infraestructura**: cómputo, hipervisores, sistemas operativos, almacenamiento, centros de datos, nubes públicas y una palabra que hasta hace tres años parecía prohibida en las revistas del sector: **repatriación**.

### 11.1. El concepto sin humo: silicio, sistemas base y soberanía económica

El líder de Sistemas e Infraestructura no administra "cajas" ni colecciona certificados de proveedores de nube: **administra capacidad de cómputo, persistencia de datos y continuidad física al menor costo sostenible por unidad de rendimiento**.

Entre 2022 y 2026 dos terremotos sacudieron los cimientos de este dominio obligando a recalcular todas las planillas financieras de TI:

1. **El fin de la inocencia en el licenciamiento de virtualización comercial:** Durante quince años la receta cómoda para cualquier empresa mediana fue comprar dos o tres servidores físicos, instalarles encima el hipervisor comercial dominante del mercado y renovar el soporte anual casi sin mirar la factura. Tras las grandes compras corporativas del sector, miles de organizaciones recibieron cotizaciones de renovación con aumentos de entre el trescientos y el seiscientos por ciento, obligadas a contratar paquetes forzosos facturados por cada núcleo físico de sus propios procesadores. De un plumazo quedó demostrado el peligro mortal de construir los cimientos de tu casa sobre software cerrado que te cobra alquiler creciente por usar tu propio hardware.
2. **La madurez de la repatriación selectiva desde la nube pública:** Pasada la euforia inicial de *"cerrar todos los cuartos de servidores"*, empresas de todos los tamaños hicieron cuentas reales a tres años y descubrieron una ley económica elemental: **para cargas estables que corren veinticuatro horas los trescientos sesenta y cinco días del año con tráfico predecible, operar nodos propios en alojamiento profesional (*colocation*) o servidores dedicados cuesta una fracción de lo que cobran los hiperescaladores públicos**, siempre que automatices con seriedad.

Repatriar una base de datos pesada o un conjunto de máquinas fijas cuando la compra del equipamiento se amortiza en doce o dieciséis meses no es nostalgia noventera ni miedo al progreso: es ingeniería financiera aplicada que libera presupuesto para lo que de verdad necesita elasticidad en la nube.

### 11.2. La teoría vs. la trinchera: de la elasticidad infinita a los dioses griegos bajo llave

En los diagramas comerciales de los proveedores de nube, escalar infraestructura consiste en mover un control deslizante con el ratón mientras todo se autorrepara solo; y en los folletos de infraestructura hiperconvergente local, todo se soluciona comprando nodos cerrados de cien mil dólares.

En la trinchera real de una empresa mediana o PyME, el panorama mezcla ambos mundos sin manual de instrucciones: la mitad de los sistemas corre en cuatro máquinas virtuales caras en la nube que alguien dimensionó con el doble de memoria *"por las dudas"* hace tres años y jamás volvió a ajustar; la otra mitad late en dos servidores físicos veteranos dentro de la oficina donde cada sistema operativo fue instalado a mano con opciones distintas según el humor del técnico de turno.

Compara cómo opera una infraestructura cautiva y artesanal frente a una arquitectura híbrida y reproducible en 2026:

| Dimensión de Sistemas | Trinchera artesanal / Cautiva | Ingeniería de Sistemas Moderna (2026) |
| :--- | :--- | :--- |
| **Virtualización local** | Atada a un único hipervisor comercial con peaje abusivo por núcleo físico. | Virtualización abierta de grado empresarial (**Proxmox VE / KVM / XCP-ng**) sin rehén comercial. |
| **Creación de servidores** | Instalación manual paso a paso (*"Siguiente, Siguiente"*) tardando medio día. | Plantillas inmutables con **cloud-init + Ansible** listas y endurecidas en menos de 10 minutos. |
| **Protección de discos** | Fe ciega en controladoras *RAID* viejas sin verificación de corrupción silenciosa. | Sistemas de archivos modernos (**ZFS**) con sumas de verificación, instantáneas atómicas y réplica externa. |
| **Decisión Nube vs. Local** | Por moda ejecutiva o costumbre histórica, sin medir costo real a 36 meses. | Matriz objetiva **TCO a 36 meses**: base estable en hierro/*colo* y picos variables en nube. |

Mira el salto estructural que da el departamento cuando abandona las mascotas manuales y el alquiler perpetuo sin cuentas para pasar a infraestructura estandarizada:

![De los servidores mascota y licencias cautivas hacia infraestructura híbrida reproducible](11-matriz-decision-carga-hibrida.png){ width=92% }

### 11.3. Excentricidades y antipatrones: el mito de que RAID es backup, los servidores mascota y el Ceph de juguete

Tres errores clásicos siguen protagonizando las peores madrugadas en la vida de los administradores de sistemas.

#### 1. "Tranquilo jefe, no hace falta backup porque el servidor tiene RAID"

Cuesta creer que en pleno 2026 todavía haya que repetir esto en voz alta, pero sigo encontrándomelo en auditorías reales cada pocos meses. Alguien configura un arreglo redundante de discos (*RAID 1, RAID 5 o RAID 10*) y duerme convencido de que sus datos están a salvo de cualquier desgracia.

Digámoslo para que quede grabado en piedra: **RAID solo protege disponibilidad ante la rotura mecánica o electrónica de un disco individual; jamás protege tus datos**.

Si un script mal ejecutado lanza un `DELETE` sin condición sobre la tabla de clientes, el controlador *RAID* replicará obedientemente ese borrado a velocidad supersónica en todos los discos del espejo en el mismo milisegundo. Si entra un *ransomware*, cifrará ambos discos con idéntica perfección. Si cae una sobretensión severa que quema la fuente y la controladora del chasis, o si se corrompe el sistema de archivos antes de que alguien lo note, tu flamante espejo solo garantiza tener dos copias idénticas del mismo cadáver.

#### 2. El zoológico de servidores "mascota" con nombres mitológicos

En la cultura clásica de sistemas los servidores se criaban como **mascotas queridas**: les ponían nombres de dioses griegos o planetas (`zeus`, `poseidon`, `saturno`), cuando enfermaban todo el equipo se desvelaba curándolos a mano por consola, acumulaban librerías compiladas a medida en directorios raros y nadie en la Tierra sabía enumerar todos los toques manuales que tenían encima.

El drama de las mascotas aparece el día que `zeus` muere definitivamente o necesitas levantar un entorno idéntico para probar una actualización crítica: nadie puede reproducirlo. En ingeniería moderna los servidores —físicos, virtuales o en nube— se tratan como **ganado numerado** (`erp-db-01`, `web-prod-02`): nacen idénticos a partir de una receta automatizada y, si uno presenta un comportamiento extraño, no pasas tres noches curándolo con paños tibios; levantas el reemplazo limpio desde código en diez minutos, conmutas el tráfico y destruyes el enfermo.

#### 3. Querer armar almacenamiento distribuido sin respetar las leyes de la física

Al huir con justa razón de las licencias caras, algunos equipos caen en la trampa opuesta: leen en un foro que **Ceph** ofrece almacenamiento distribuido autorreparable y deciden montarlo sobre dos servidores reciclados conectados por un mísero cable de red de **1 Gigabit** usando discos rígidos mecánicos o unidades *SSD* domésticas de oferta sin protección ante corte eléctrico (*PLP*).

A la primera reconstrucción de un disco fallido, el tráfico de sincronización ahoga toda la red, la latencia de escritura sube a segundos enteros y las bases de datos entran en pánico. **El software libre elimina el costo de las licencias artificiales, pero jamás deroga las leyes de la física.** Si no tienes al menos tres nodos reales, unidades empresariales con condensadores de protección y enlaces dedicados de diez o veinticinco gigabits para almacenamiento, un buen arreglo local sobre **ZFS** con replicación asíncrona frecuente entre dos nodos te dará diez veces mejor rendimiento y cero dolores de cabeza.

#### Señales de alerta temprana

Tu área de Sistemas necesita cirugía preventiva si reconoces cualquiera de estas señales:

- Tardas más de una hora de trabajo manual en entregar un servidor Linux o Windows nuevo, endurecido, monitoreado y unido al respaldo.
- Tus servidores tienen nombres propios creativos y nadie recuerda qué tres servicios distintos conviven dentro de cada uno.
- Estás pagando en la nube instancias grandes al cien por ciento de precio por hora (*on-demand*) para cargas que llevan dos años encendidas sin apagarse un solo minuto.
- Tu renovación anual de licencias de virtualización supera lo que costaría comprar servidores físicos nuevos equivalentes.
- Tienes un cuarto de servidores propio refrigerado con un equipo doméstico de pared instalado justo encima del bastidor, esperando el día inevitable en que se tape la manguera de desagüe y llueva agua condensada sobre las fuentes de poder.

### 11.4. Marco de acción pragmático: virtualización abierta, plantillas limpias y calculadora TCO a 36 meses

Recuperar el control técnico y económico de tus sistemas sin poner en riesgo la operación diaria se ejecuta sobre tres pasos ordenados.

#### Paso 1: Estandariza sobre virtualización abierta y sistemas de archivos íntegros

Para tu capa local o en centro de datos alquilado (*colocation*), construye sobre plataformas abiertas probadas en cientos de miles de servidores productivos: **Proxmox Virtual Environment (Proxmox VE)** —basado en Debian y el hipervisor nativo del kernel Linux **KVM**, con soporte empresarial opcional limpio y sin peajes extorsivos— o **XCP-ng** junto a **Xen Orchestra**.

Debajo de las máquinas virtuales utiliza **ZFS** sobre discos empresariales: verifica matemáticamente cada bloque leído para detectar degradación silenciosa del medio físico, toma instantáneas en milisegundos antes de cualquier cambio delicado y replica bloques diferenciales cada pocos minutos hacia un segundo nodo físico independiente (sin olvidar jamás la copia externa inmutable en **Proxmox Backup Server** vista en el Capítulo 6).

#### Paso 2: Destierra la instalación manual con cloud-init y Ansible

Prohíbe instalar sistemas operativos haciendo clic frente a una pantalla. Crea una sola imagen dorada (*golden image*) mínima de tu distribución Linux LTS estándar y de Windows Server si aplica, inyecta identidad, llaves SSH y red inicial mediante **cloud-init**, y aplica la configuración exacta del rol (paquetes, endurecimiento de seguridad, agente de monitoreo y respaldo) mediante recetas versionadas en Git con **Ansible** (complementado con **OpenTofu** para aprovisionar máquinas virtuales tanto en Proxmox como en nubes públicas con el mismo flujo declarativo).

#### Paso 3: Decide dónde vive cada carga con la calculadora honesta a 36 meses

Antes de subir un sistema nuevo a un hiperescalador o de repatriar uno existente, arma una planilla financiera a **treinta y seis meses** donde ambos lados jueguen sin esconder cartas debajo de la manga:

| Rubro de costo real a 36 meses | Nube Pública (Hiperescalador) | Colocation / Bare-Metal Dedicado | Cuarto Propio (*On-Premise* en sede) |
| :--- | :--- | :--- | :--- |
| **Cómputo y memoria** | Alquiler mensual (evaluar reservas a 1–3 años si es fijo). | Compra amortizada en 36 meses o alquiler mensual fijo predecible. | Compra de al menos 2 nodos físicos + contratos de garantía de hardware. |
| **Almacenamiento e *IOPS*** | Cobro mensual por GB provisionado + plus por rendimiento e instantáneas. | Costo único de unidades *NVMe/SSD* empresariales con repuesto frío en sitio. | Costo único de unidades empresariales + reemplazo preventivo por desgaste. |
| **Red y salida de datos (*Egress*)** | **Factor crítico:** sumar cada GB descargado, respaldado afuera o cruzado entre zonas. | Ancho de banda generoso o tarifa plana incluida en el alquiler de *rack*. | Costo de los enlaces redundantes empresariales contratados en la oficina. |
| **Energía, clima y seguridad física** | Incluido en la tarifa del proveedor. | Incluido en el canon mensual del centro de datos certificado (*Tier III*). | **No olvidar sumar:** consumo eléctrico 24/7, baterías de *UPS* cada 3 años y climatización doble. |
| **Horas humanas de operación** | Menos tiempo cambiando discos; más tiempo gobernando costos, permisos y red. | Tiempo acotado de parcheo de hipervisor y visitas puntuales de mantenimiento. | Mayor carga física local de atención eléctrica, térmica y recambio de partes. |

La regla empírica de trinchera rara vez falla: si tu empresa es pequeña y no tiene un recinto seco, seguro y con respaldo eléctrico serio, **no armes un cuarto de servidores casero debajo de una escalera**; usa servidores dedicados o *colocation* combinado con servicios puntuales en nube. Y si tu factura mensual en un hiperescalador por cargas fijas compra el hierro equivalente completo en menos de catorce o dieciocho meses, prepara tus plantillas automatizadas y repatria sin complejos esa carga base.

Ahora bien: ni la mejor red ni la infraestructura híbrida más rentable llegan jamás a buen puerto si cada migración dura tres años y muere a mitad de camino. Toca entrar al duodécimo capítulo para poner orden en el arte más esquivo de nuestro oficio: **lograr que los proyectos tecnológicos realmente terminen**.
