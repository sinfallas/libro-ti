## Capítulo 10. Redes y Comunicaciones: La plomería invisible que sostiene todo

Las redes de datos comparten exactamente el mismo destino ingrato que las tuberías de agua potable de un edificio: cuando están bien diseñadas y mantenidas, absolutamente nadie en toda la empresa recuerda que existen; pero en el segundo exacto en que la presión cae o se tapa un conducto, la civilización entera dentro de la oficina retrocede a la Edad de Piedra en menos de cinco minutos.

Si revisas la lista de funciones que tenía el **Administrador de Redes** en la primera edición de 2022, notarás cómo en aquella época le habían caído encima tareas prestadas de medio departamento: además de ruteo, conmutadores, enlaces y proveedores de telecomunicaciones, aparecía instalando computadoras de usuarios, administrando programas y cargando con toda la seguridad informática.

En 2026 limpiamos de raíz esa distorsión de fronteras. Formatear computadoras y atender usuarios pertenece al *Service Desk* (Capítulo 9); gobernar la defensa integral y las políticas contra intrusiones pertenece a *SecOps* (Capítulo 6). Liberado de esos pesos ajenos, el responsable de **Redes y Comunicaciones** puede dedicarse por fin a su verdadera ingeniería: garantizar conectividad determinista, segmentada, documentada y verdaderamente tolerante a fallos entre oficinas, centros de cómputo, nubes y trabajadores remotos.

### 10.1. El concepto sin humo: transportar paquetes rápido, limpio y solo adonde corresponde

Quitémosle el misterio al oficio de redes. Una buena arquitectura de comunicaciones empresariales resuelve tres problemas físicos y lógicos muy concretos:

1. **Disponibilidad sin puntos únicos de corte:** Que la caída de un enlace externo, una fuente eléctrica o un equipo de distribución no deje a cien personas cruzadas de brazos mirando el techo.
2. **Aislamiento de dominios de fallo y de confianza:** Que el tráfico ruidoso o comprometido de una impresora, una cámara de vigilancia o el teléfono de un visitante jamás pueda ver ni alcanzar la red donde laten las bases de datos del negocio.
3. **Previsibilidad y observabilidad:** Saber exactamente qué hay conectado en cada boca de red, cuánto ancho de banda consume cada servicio crítico y dónde está ocurriendo una pérdida de paquetes en tres minutos, sin tener que reiniciar aparatos al azar probando suerte.

Por eso es un error grosero creer que *"como subimos cosas a la nube ya no hace falta alguien fuerte en redes"*. Al contrario: cuanto más distribuida e híbrida se vuelve una organización —con aplicaciones externas, telefonía sobre IP, videollamadas simultáneas en alta definición y sucursales conectadas contra servicios remotos—, **más crítica se vuelve la calidad de tu red local, tu resolución de nombres (*DNS*) y tus enlaces de salida**. La nube más cara del planeta es completamente inútil si tu enlace local se arrastra o tu Wi-Fi corporativo colapsa cada vez que veinte personas abren una reunión al mismo tiempo.

### 10.2. La teoría vs. la trinchera: de las redes definidas por software al cuarto de escobas con cables colgando

En los congresos de fabricantes de redes todo brilla con luces azules ordenadas: pasillos fríos inmaculados, redes definidas por software (*SDN*) que se autoconfiguran desde una consola central, enlaces redundantes de diez o cien gigabits y conmutación automática en milisegundos (*SD-WAN*).

Cuando abres la puerta del cuarto de comunicaciones real de una empresa mediana que creció a empujones durante quince años, el espectáculo suele cortarte la respiración. El bastidor principal comparte espacio con cajas de archivo muerto y artículos de limpieza; una cascada de cables grises, azules y amarillos de tres metros cuelga por delante tapando las luces de los equipos porque nadie compró jamás organizadores ni latiguillos a medida; una zapatilla eléctrica doméstica de ferretería sostiene el enrutador del proveedor; y toda la compañía opera sobre una única subred plana gigantesca donde conviven revueltos el servidor contable, los teléfonos IP y el aire acondicionado inteligente.

Compara ambos mundos para dimensionar dónde están las victorias reales de ingeniería:

| Dimensión de red | Trinchera desordenada habitual | Ingeniería de red pragmática en 2026 |
| :--- | :--- | :--- |
| **Redundancia de internet** | Un solo enlace, o dos fibras contratadas que entran por el mismo caño físico. | Dos acometidas físicas opuestas **más respaldo inalámbrico independiente (5G / satelital LEO)**. |
| **Diseño interno (*LAN*)** | Red plana única (`/16` o `/24` estirada) donde todo alcanza a todo. | Segmentación estricta en *VLANs* por zona de confianza + red de gestión fuera de banda. |
| **Control de direcciones IP** | Planilla `IPs_Oficina.xlsx` olvidada hace dos años con conflictos constantes. | Gestión centralizada de direcciones y bastidores (*IPAM*) como única fuente de verdad. |
| **Wi-Fi corporativo** | Una sola clave compartida escrita en un pizarrón que conocen hasta los exproveedores. | Autenticación individual **WPA3-Enterprise (802.1X)** para personal y red aislada para visitas. |
| **Respaldo de configuración** | Nadie guarda nada; si muere un *switch*, hay que reconfigurarlo de memoria. | Extracción automática nocturna hacia repositorio Git con historial de diferencias. |

Observa cómo cambia radicalmente la resistencia de una sede cuando pasas del cableado improvisado a una topología segmentada con medios físicos independientes:

![De la red plana y la falsa redundancia hacia una arquitectura segmentada y resiliente](10-segmentacion-red-redundante.png){ width=92% }

### 10.3. Excentricidades y antipatrones: la excavadora traicionera, el rack espagueti y el mini-switch clandestino

Si los administradores de redes tienen ese humor ácido tan característico es porque les toca lidiar con las leyes de la física chocando contra la creatividad humana. Tres escenas reales explican casi todas sus canas.

#### 1. El mito de la "doble fibra" por el mismo tubo

La directiva aprueba orgullosa contratar un segundo proveedor de internet para *"tener redundancia total en casa central"*. Se firman ambos contratos con empresas distintas y todos duermen en paz. Un martes a las diez y media de la mañana, una cuadrilla municipal que repara un caño de agua a dos cuadras mete la pala mecánica en la zanja y **ambos proveedores caen muertos en el mismo segundo exacto**.

Recién ese día alguien averigua dos verdades incómodas de las telecomunicaciones urbanas: primero, que el proveedor B en realidad le alquilaba el tramo final de fibra mayorista al proveedor A; y segundo, que ambos cables entraban al edificio exactamente por el mismo poste y el mismo ducto subterráneo en la vereda. **Redundancia en factura nunca es redundancia física.** Si ambos caminos comparten una sola zanja, un solo poste o una sola fuente eléctrica, sigues teniendo un punto único de fallo pagado al doble de precio.

#### 2. El bastidor "espagueti" y el mini-switch hogareño escondido bajo el escritorio

En una oficina donde faltan bocas de red, algún empleado bienintencionado trae de su casa un conmutador plástico barato de cinco puertos, lo esconde detrás de una cajonera y enchufa ahí su computadora y la del compañero. Dos meses después alguien patea sin querer un cable suelto debajo de esa mesa, ve una punta desconectada y —con toda la buena voluntad del mundo— la vuelve a clavar en otro puerto libre del mismo aparatito barato.

En un segundo acaba de cerrar un bucle físico de capa dos sobre una red donde nadie activó protecciones básicas en los conmutadores principales. La tormenta de paquetes de difusión (*broadcast storm*) satura instantáneamente cada equipo del piso, tumba los teléfonos IP, congela las sesiones contra el servidor y obliga al técnico de redes a caminar escritorio por escritorio levantando alfombras como un sabueso hasta encontrar el bendito aparato plástico parpadeando como árbol de Navidad debajo de una papelera.

#### 3. "Siempre es culpa de la red" (y el cambio del viernes sin guardar)

Existe una ley universal en TI: cada vez que una aplicación nueva anda lenta o falla una consulta mal programada, el primer diagnóstico automático de cualquier desarrollador o proveedor externo será ***"hay un problema en la red o en el firewall"***. El administrador de redes pasa la mitad de su vida capturando paquetes para demostrar la inocencia de sus cables... salvo ese fatídico diez por ciento de las veces en que, tras tres horas jurando que la red está perfecta, descubre con humildad que efectivamente era un registro viejo en el servidor **DNS** interno.

Y su primo hermano mortal: entrar por consola un viernes a las seis menos cuarto a ajustar una regla en un enrutador remoto, equivocarse en una máscara de red, cortarse el propio acceso y descubrir que la configuración anterior no estaba respaldada en ningún lado.

#### Señales de alerta temprana

Tu infraestructura de comunicaciones camina por la cornisa si marcas positivo en cualquiera de estos puntos:

- No puedes desconectar cualquier cable de un bastidor sabiendo de antemano, por su etiqueta en ambas puntas, qué equipo exacto dejará de tener servicio.
- Tus dos proveedores de internet ingresan al edificio por la misma acometida física o careces de un enlace inalámbrico de respaldo independiente.
- Si conectas una computadora desconocida en una boca de red de una sala de reuniones, recibe automáticamente dirección IP con acceso directo a la red de servidores.
- La contraseña del Wi-Fi principal es la misma para todos los empleados y lleva años sin cambiarse porque *"se desconectarían las impresoras y los celulares"*.
- Si esta noche se quema el conmutador central o el cortafuegos de borde, no tienes un archivo de configuración actualizado de ayer listo para volcar en un equipo de reemplazo en quince minutos.

### 10.4. Marco de acción pragmático: orden físico, zonas estancas y automatización abierta

Llevar una red empresarial del caos artesanal a nivel profesional no requiere comprar chasis propietarios impagables; requiere disciplina topológica, protecciones estándar en capa de acceso y un puñado de herramientas abiertas brillantes.

#### Paso 1: Muerte definitiva a la red plana (segmenta en 5 zonas mínimas)

Aunque tu oficina tenga apenas cuarenta puestos, divide hoy mismo tu red mediante redes virtuales (*VLANs*) gobernadas desde tu cortafuegos central —por ejemplo sobre plataformas abiertas de primer nivel como **OPNsense**, **pfSense** o **VyOS**— en al menos cinco compartimentos estancos:

1. **Zona de Gestión (*Management / OOB*):** Interfaces de administración de conmutadores, hipervisores, cortafuegos y controladoras, inaccesibles desde cualquier puesto de usuario normal.
2. **Zona de Servidores y Datos:** Donde viven los sistemas productivos, alcanzables únicamente por los puertos exactos necesarios.
3. **Zona de Estaciones Corporativas y Voz:** Equipos de trabajo autenticados y telefonía IP con calidad de servicio (*QoS*) priorizada.
4. **Zona de Dispositivos No Confiables (*IoT*, Cámaras, Impresoras, Relojes biométricos):** Aparatos cuyo firmware suele ser un coladero de seguridad; salen solo adonde estrictamente deben y jamás ven la red de servidores ni de usuarios.
5. **Zona de Invitados:** Salida limpia exclusivamente hacia internet con aislamiento entre clientes inalámbricos (*client isolation*), sin tocar un solo recurso interno.

En el Wi-Fi corporativo, jubila la contraseña única compartida y enlaza tus puntos de acceso contra RADIUS (**FreeRADIUS** o tu propio directorio de identidad) usando **WPA3-Enterprise (802.1X)**: cuando un empleado se desvincula de la empresa, pierde el Wi-Fi en el mismo segundo sin tocar la configuración de un solo equipo del resto.

#### Paso 2: Blinda los puertos físicos de acceso y asegura redundancia por medios distintos

Para que ningún mini-*switch* clandestino ni servidor *DHCP* casero vuelva a tumbar un piso entero, activa por plantilla estándar tres escudos nativos que trae cualquier conmutador administrable decente:

- **BPDU Guard + Spanning Tree (RSTP):** Si alguien conecta un conmutador no autorizado o arma un bucle debajo de su mesa, el puerto individual se apaga automáticamente en milisegundos protegiendo a todo el edificio.
- **DHCP Snooping:** Impide que un enrutador doméstico enchufado al revés reparta direcciones IP falsas dejando sin red a los vecinos.
- **Límite de difusión (*Storm Control*):** Pone techo duro al tráfico anómalo antes de saturar enlaces troncales.

Y en el borde externo (*WAN*), exige que tus enlaces de fibra entren por cámaras y rutas físicas distintas, sumando como tercer seguro económico de última milla un módem empresarial **5G** o una antena **satelital de órbita baja (*LEO*)** en conmutación automática (*failover*): cuesta una fracción mínima de lo que pierde la empresa en dos horas sin facturar cuando una excavadora rompe la calle.

#### Paso 3: Documenta en NetBox, respalda con Oxidized y observa con LibreNMS/Zabbix

Cierra el círculo operativo con tres plataformas libres que te ahorrarán cientos de horas al año:

| Necesidad operativa | Herramienta abierta recomendada | Qué problema erradica para siempre |
| :--- | :--- | :--- |
| **Inventario IP, VLANs y bastidores** | **NetBox** (o **phpIPAM** para entornos más simples) | Elimina las hojas de cálculo obsoletas, los choques de IPs duplicadas y documenta cada cable y *rack*. |
| **Respaldo automático de equipos de red** | **Oxidized** integrado con un repositorio Git privado | Extrae cada noche (o tras cada cambio) la configuración de *switches*, *routers* y *firewalls*, avisando qué línea exacta cambió. |
| **Monitoreo de enlaces y tráfico** | **LibreNMS** o **Zabbix** (*SNMP*, latencia, pérdida de paquetes) | Te entera a ti cinco minutos antes que al usuario de que un enlace secundario cayó o una interfaz acumula errores ópticos. |

Acompaña ese software con higiene física elemental: ventana anual para retirar cables muertos, etiquetado termocontraíble en ambos extremos de cada latiguillo troncal y doble fuente eléctrica conectada a fases/respaldos de energía ininterrumpida (*UPS*) probados con carga real.

Cuando la plomería de comunicaciones queda así de limpia, predecible y segmentada, deja de ser el sospechoso habitual de cada lentitud y se convierte en la autopista silenciosa sobre la que descansan los servidores, hipervisores y nubes del próximo dominio: **Sistemas e Infraestructura**.
