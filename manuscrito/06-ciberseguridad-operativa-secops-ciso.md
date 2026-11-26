## Capítulo 6. Ciberseguridad Operativa (CISO y SecOps): Defender la trinchera en tiempo real

Si revisas cómo estaba repartida la seguridad informática en la primera edición de 2022, encontrarás una fotografía fiel de lo que hacía casi toda la industria hasta hace muy poco: la administración diaria de cortafuegos y sistemas defensivos colgaba como una tarea más sobre la espalda del **Administrador de Redes**, mientras las políticas, contingencias y respaldos figuraban dentro del **Área de Control de Riesgos**.

Aquella distribución funcionó mientras los ataques habituales consistían en virus ruidosos enviados por correo masivo o adolescentes probando suerte contra un puerto abierto. En 2026 mantener ese esquema equivale a pedirle al plomero del edificio que también actúe como grupo táctico antibombas en sus ratos libres.

Hoy nos enfrentamos a bandas criminales industrializadas que alquilan plataformas completas de secuestro de datos (*Ransomware as a Service*), compran credenciales corporativas robadas por diez dólares en mercados clandestinos y automatizan barridos globales minutos después de publicarse una vulnerabilidad crítica. Frente a esa asimetría, la **Ciberseguridad Operativa (*Security Operations* o *SecOps*)**, encabezada por un responsable de seguridad de la información (*Chief Information Security Officer* o *CISO*), necesita parcela, presupuesto y autoridad propios, nítidamente separados tanto de quien tiende cables como de quien audita el cumplimiento en papel.

### 6.1. El concepto sin humo: por qué la defensa dejó de ser el pasatiempo del de redes

Despejemos de entrada qué hacen realmente un *CISO* y una célula de *SecOps* cuando les quitas la mística de las películas de espías y el lenguaje apocalíptico de los vendedores de antivirus.

Su trabajo no consiste en garantizar que *"jamás ocurrirá un incidente"* —cualquiera que prometa invulnerabilidad absoluta miente o no sabe de qué habla—. Su misión real se resume en tres verbos medibles: **reducir** la superficie expuesta para que atacar tu empresa salga demasiado caro, **detectar** cualquier intrusión antes de que el atacante llegue a las joyas de la corona, y **contener** el impacto para que una brecha sea un mal martes operativo y no el cierre definitivo de la compañía.

Por qué esto ya no puede ser una tarea lateral del administrador de redes o de sistemas se entiende apenas miras sus incentivos diarios:

- El incentivo natural de Infraestructura y Redes es **que todo conecte rápido y permanezca disponible**. Si para levantar una sucursal urgente a las siete de la tarde hace falta abrir temporalmente una regla amplia en el cortafuegos, el instinto operativo empuja a abrirla y seguir adelante.
- El incentivo natural de *SecOps* es **desconfiar por defecto de cada conexión, identidad y permiso**, cerrando todo lo que no sea estrictamente indispensable y vigilando qué ocurre cuando algo legítimo se comporta de manera anormal.

Ambas fuerzas son saludables cuando dialogan en equilibrio, pero para que ese equilibrio exista debe cumplirse una condición política innegociable: **un CISO sin derecho real de veto es un adorno corporativo**. Si seguridad detecta que una aplicación o servidor está a punto de salir a producción exponiendo datos de clientes sin cifrar o con fallos críticos explotables, debe tener potestad formal para detener el despliegue. Y si la gerencia general decide salir igual por urgencia comercial, el procedimiento sano exige que el gerente general **firme de su puño y letra un acta de aceptación de riesgo cuantificada en dinero**. Te sorprenderá ver qué rápido aparece tiempo para corregir fallos cuando nadie arriba quiere dejar su firma estampada sobre la futura autopsia del incidente.

### 6.2. La teoría vs. la trinchera: del SOC cinematográfico al Zero Trust que sí cabe en tu presupuesto

Cuando una empresa mediana pide asesoría en ciberseguridad, el mercado suele empujarla hacia una fantasía inalcanzable: montar un centro de operaciones de seguridad (*Security Operations Center* o *SOC*) propio veinticuatro por siete lleno de pantallas gigantes con mapas mundi lanzando rayos de colores, alimentado por licencias anuales de seis cifras en plataformas comerciales de correlación (*SIEM*) y orquestación automática (*SOAR*).

En la trinchera real de una PyME o empresa mediana hispanoamericana, intentar empezar por ahí es como comprar un radar militar de última generación para una casa cuya puerta trasera no tiene cerradura. La inmensa mayoría de los ataques exitosos que destruyen empresas medianas en 2026 no usan hazañas dignas de agencias de inteligencia: entran por una contraseña filtrada sin segundo factor, por un escritorio remoto abierto directo a internet, por un servidor sin actualizar desde hace dos años o por un usuario con permisos de administrador local que abrió una factura falsa.

Por eso, frente al teatro millonario, la defensa real en presupuestos ajustados se apoya en **confianza cero (*Zero Trust*) aplicada con gradualidad**, endurecimiento básico (*hardening*) y copias de seguridad indestructibles:

| Frente defensivo | Fantasía corporativa de folleto | Defensa real y efectiva en la trinchera |
| :--- | :--- | :--- |
| **Detección y monitoreo** | *SIEM/SOAR* comercial de 150.000 USD anuales que nadie termina de afinar. | Agentes abiertos bien ajustados (**Wazuh**) vigilando inicios de sesión, elevación de permisos e integridad de archivos críticos. |
| **Privilegios de usuario** | Sistemas complejos de gestión de acceso privilegiado (*PAM*) de seis meses de implantación. | Quitar hoy mismo el permiso de administrador local a todos los puestos de usuario y separar cuentas personales de cuentas de administración. |
| **Gestión de parches** | Escáneres que escupen PDFs de 600 páginas cada lunes sin que nadie corrija nada. | Parchear en menos de 48 horas las vulnerabilidades con explotación activa confirmada (**CISA KEV**) en bordes y servicios críticos. |
| **Última línea de vida** | Confiar en instantáneas dentro del mismo almacenamiento productivo. | Regla **3-2-1-1-0** con al menos una copia **inmutable o desconectada** cuyas llaves no residen en el dominio productivo. |

Mira cómo cambia por completo la supervivencia de la organización cuando pasas de comprar cajas milagrosas a construir capas defensivas que asumen que el atacante tarde o temprano logrará robar una credencial:

![Seguridad de cartón frente a capas reales de Ciberseguridad Operativa](06-arquitectura-zero-trust-pragmatica.png){ width=92% }

### 6.3. Excentricidades y antipatrones: "somos muy chicos", luces que nadie mira y el backup cifrado junto al servidor

He visto repetirse tantas veces la misma autopsia tras un ataque de *ransomware* que casi podría escribir el informe antes de entrar al edificio. El desastre rara vez ocurre por un solo fallo aislado; ocurre por la combinación exacta de tres excentricidades culturales.

La primera es la frase más cara de la historia empresarial reciente: ***"Nosotros somos una empresa chica, ¿para qué nos van a atacar los hackers si no somos un banco?"***.

Quien pronuncia esa frase sigue imaginando a un delincuente con capucha eligiendo manualmente el logotipo de su empresa en un periódico. En 2026 nadie te elige por tu fama: miles de robots automatizados barren cada minuto todo el espacio de direcciones públicas de internet buscando puertos abiertos, paneles sin parchear y credenciales filtradas. Si tu puerta cede, entran, despliegan recolectores automáticos, calculan cuánto facturas leyendo tus propias carpetas de contabilidad y te fijan el rescate a medida de tu cuenta corriente. Para un atacante automatizado, una distribuidora mediana sin defensas es infinitamente más rentable que un banco blindado.

La segunda excentricidad llega cuando, tras algún susto cercano, la directiva decide *"resolver el tema de seguridad"* comprando una caja costosa llena de luces parpadeantes o mil licencias de un agente avanzado, pero sin asignar una sola hora humana para configurarlo, afinar sus reglas ni revisar sus alertas. Seis meses después, cuando abres la consola tras el desastre, descubres que la herramienta cara detectó perfectamente el movimiento extraño a las once de la noche del viernes, mandó trescientos correos automáticos a una casilla que nadie leía el fin de semana y dejó seguir el cifrado porque seguía en *"modo solo auditoría"* desde el día de la instalación.

Y el golpe de gracia —la tercera pieza del combo mortal— aparece a las ocho de la mañana del lunes, cuando alguien dice aliviado *"menos mal que tenemos backup diario"* y corre a buscar el servidor de copias de seguridad. Entonces cae el silencio helado en la sala: el almacenamiento de respaldos estaba montado de forma permanente como una carpeta compartida de red en los servidores principales, autenticado con las mismas credenciales del administrador de dominio que el atacante acababa de capturar. El *ransomware* no solo cifró la base de datos viva: **cifró prolijamente los últimos cinco años de copias de seguridad en la misma pasada**.

Junto a ese escenario clásico conviene vigilar otras dos deformaciones internas frecuentes:

- **El CISO de cartón piedra (o chivo expiatorio preventivo):** Nombrar en el cargo a alguien sin presupuesto, sin equipo y reportando tres niveles por debajo del directorio únicamente para cumplir un requisito comercial de clientes. No tiene poder para arreglar nada antes del incendio, pero ya tiene el nombre listo en la puerta para ser despedido cuando ocurra.
- **Las cuentas administrativas genéricas eternas:** Seguir entrando a conmutadores, hipervisores y bases de datos con un único usuario `admin` cuya clave conocen siete empleados actuales y cuatro exproveedores que dejaron de facturar hace dos años. Cuando aparece un borrado malicioso, la auditoría forense descubre que el culpable legal es *"admin"*, es decir, nadie.

#### Señales de alerta temprana

Si detectas dos o más de estos puntos en tu entorno, no estás esperando a ver *si* tendrás un incidente grave, sino *qué fin de semana* ocurrirá:

- Los empleados cotidianos —incluidos gerentes y desarrolladores— trabajan a diario con permisos de administrador local sobre sus computadoras.
- Si alguien roba hoy la credencial del administrador principal del dominio o del hipervisor, con esa misma llave puede borrar o formatear el repositorio de copias de seguridad.
- Tienes servicios administrativos (*RDP*, *SSH*, paneles de gestión de cortafuegos o hipervisores) expuestos directamente a internet sin pasar por identidad fuerte y malla privada.
- Nadie sabe cuánto tiempo exacto tarda en detectarse un inicio de sesión anómalo a las dos de la madrugada de un domingo.
- El plan de respuesta ante incidentes vive guardado únicamente como un documento PDF dentro del mismo servidor de archivos corporativo que quedaría inaccesible durante un ataque.

### 6.4. Marco de acción pragmático: higiene CIS IG1, priorización real y manual en papel

Construir una capacidad seria de *SecOps* sin paralizar al negocio ni fundir la tesorería requiere ejecutar en orden estricto lo que reduce el noventa por ciento del riesgo real antes de gastar en adornos sofisticados.

#### Paso 1: Aplica sin excusas CIS Controls v8 (Grupo IG1) y parchea con CISA KEV

En lugar de perderte en marcos teóricos inabarcables el primer mes, adopta el **Grupo de Implementación 1 (*IG1*) de los Controles CIS v8**: cincuenta y seis medidas concretas de higiene cibernética esencial diseñadas específicamente para organizaciones con recursos limitados.

Tres acciones de esa lista cambian tu perfil de riesgo en una sola semana:

1. Retira los privilegios de administrador local en estaciones de trabajo y obliga a que toda administración técnica se haga desde cuentas nominales separadas de la cuenta con la que el técnico lee el correo.
2. Cierra todo puerto administrativo expuesto a internet y aplica bloqueo de segundo factor fuerte (*MFA*) en cada acceso externo e interno crítico.
3. Prioriza el parcheo usando el catálogo gratuito **CISA KEV** (*Known Exploited Vulnerabilities*): antes de preocuparte por vulnerabilidades teóricas de laboratorio, establece por norma que cualquier fallo incluido en esa lista —porque ya está siendo usado por criminales reales en la calle— se corrige o aísla en menos de cuarenta y ocho horas.

#### Paso 2: Levanta visibilidad centralizada y defensa activa con software abierto

Cero presupuesto en licencias jamás equivale a operar a ciegas. Con un servidor modesto bien dimensionado puedes desplegar un escudo operativo sumamente respetable:

- **Wazuh:** Plataforma libre de *SIEM* y *XDR* que unifica recolección de eventos de Windows y Linux, detección de intrusiones, vigilancia de integridad sobre archivos críticos del sistema y auditoría continua de configuraciones inseguras. La regla de oro es conectar pocas fuentes al principio y afinar las alertas para que cuando suene el aviso a medianoche sea fuego real y no ruido de fondo.
- **CrowdSec (o Fail2ban):** En cualquier servicio que deba asomarse obligatoriamente a internet, bloquea en segundos direcciones IP que intentan fuerza bruta o escaneos maliciosos compartiendo inteligencia comunitaria en tiempo real.
- **Trivy y Greenbone OpenVAS:** Automatiza revisiones periódicas de vulnerabilidades sobre contenedores, librerías y red interna para encontrar tú mismo las puertas mal cerradas antes de que las encuentre un extraño.

#### Paso 3: Implanta respaldos verdaderamente inmutables bajo la regla 3-2-1-1-0

Actualiza para siempre la vieja regla de respaldos al estándar de supervivencia de 2026 (**3-2-1-1-0**):

- **3** copias totales de tus datos críticos.
- **2** soportes o tecnologías de almacenamiento independientes.
- **1** copia ubicada físicamente fuera del edificio o región principal.
- **1** copia estrictamente **inmutable o desconectada (*offline / air-gapped*)**: usando **Proxmox Backup Server**, **Restic** o **BorgBackup** sobre almacenamiento con bloqueo temporal de borrado (*Object Lock / WORM*) y credenciales invertidas (el servidor de respaldo *jala* los datos desde un segmento aislado; el servidor productivo jamás tiene llaves para entrar ni borrar en el almacén de respaldos).
- **0** errores en las pruebas automáticas y humanas periódicas de restauración completa.

#### Paso 4: Ten listo (e impreso en papel) tu *Playbook* de los primeros 60 minutos

Durante un ataque real de *ransomware* o una intrusión activa reina la adrenalina, se caen los teléfonos IP internos, no abre el correo corporativo y todo el mundo grita órdenes contradictorias. Redacta hoy mismo una guía operativa de dos páginas, **guárdala impresa en carpetas físicas en manos del líder de seguridad, del CIO y en sala de servidores**, y asegura que cubra esta secuencia exacta:

| Ventana crítica | Acción operativa obligatoria | Error fatal que queda prohibido cometer |
| :--- | :--- | :--- |
| **Minutos 0 a 15 (Aislamiento)** | Desconectar cables de red, deshabilitar puertos de *switch* o cortar túneles entre segmentos afectados para frenar la propagación lateral. | **Apagar de golpe servidores críticos sin criterio** (destruyendo llaves o rastros volátiles en memoria RAM) o dejar la red conectada *"para mirar qué pasa"*. |
| **Minutos 15 a 30 (Canal limpio)** | Migrar toda comunicación del comité de crisis a un canal externo seguro preacordado fuera del dominio comprometido. | Discutir contraseñas nuevas y planes de recuperación dentro del mismo correo corporativo donde el atacante sigue leyendo todo. |
| **Minutos 30 a 60 (Diagnóstico y verdad)** | Identificar paciente cero, verificar integridad de la copia inmutable limpia y notificar formalmente a Dirección General y Asesoría Legal / *GRC*. | Ocultar el incidente esperando *"arreglarlo callados"*, borrar evidencias o negociar pagos en caliente sin respaldo limpio verificado. |

Cuando *SecOps* opera con este rigor diario, deja de ser el área que reparte miedo y se convierte en el cinturón de seguridad que permite a la empresa correr sin matarse en la primera curva. Pero para saber si esos controles siguen vivos seis meses después —y para gobernar riesgos legales, privacidad y continuidad sin convertirse en juez y parte— hace falta su contrapeso institucional indispensable: el dominio de **Riesgos, Cumplimiento, Privacidad y Auditoría**, que abordamos a continuación.
