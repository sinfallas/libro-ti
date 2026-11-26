## Capítulo 20. Diagnóstico rápido de supervivencia (Checklists) y Epílogo 2026

A lo largo de diecinueve capítulos recorrimos cada rincón, liderazgo y metodología de un entorno tecnológico moderno. Pero en la vida real casi nadie tiene la suerte de fundar un departamento desde una hoja en blanco con servidores recién sacados de su caja.

Lo normal en nuestra profesión es que un lunes a las ocho y media de la mañana te entreguen las llaves —o asumas desde adentro el mando— de un entorno que ya lleva diez años andando a los tumbos: con deudas heredadas, urgencias golpeando la puerta, contratos vencidos, personal cansado y un gerente general preguntándote al tercer día qué vas a cambiar primero.

Este capítulo final condensa el protocolo práctico para sobrevivir a esos **primeros noventa días** sin inmolarse en el intento, entrega **cuatro listas de verificación rápida (*checklists*)** para diagnosticar en media hora dónde están las bombas activas de cualquier organización y cierra esta segunda edición con una reflexión personal de trinchera.

### 20.1. El concepto sin humo: auditar el avión en pleno vuelo sin apagar los motores

Rescatar u ordenar un departamento de TI caótico se parece muy poco a una remodelación arquitectónica donde cierras el edificio seis meses y demueles paredes tranquilo; se parece a reparar la turbina de un avión mientras lleva ciento veinte pasajeros adentro facturando cada minuto.

El objetivo de un diagnóstico inicial sin humo jamás es producir una enciclopedia de hallazgos para lucir inteligente frente al directorio. Su único propósito real consiste en responder en tiempo récord tres preguntas de supervivencia:

1. **¿Qué nos puede matar esta misma noche sin posibilidad de recuperación?** (Copias de seguridad falsas o conectadas en red, accesos maestros en manos de terceros desvinculados, dominios o certificados a punto de expirar).
2. **¿Por dónde se escapa hoy la sangre operativa y financiera?** (Trabajo invisible por pasillo, licencias pagadas sin uso, sistemas fuera de soporte expuestos a internet).
3. **¿Qué piezas feas pero vitales sostienen el negocio y no deben tocarse todavía?** (Dependencias ocultas que nadie documentó y que exigen comprensión antes de cualquier cirugía).

### 20.2. La teoría vs. la trinchera: de la consultoría de seis meses al plan real de 90 días

Cuando una gran corporación cambia de liderazgo tecnológico, suele contratar a una firma internacional para que durante cuatro o seis meses entreviste a medio edificio y entregue una presentación encuadernada de trescientas diapositivas diagnosticando exactamente lo mismo que los técnicos del sótano venían diciendo gratis en el almuerzo desde hacía tres años.

En una empresa mediana o PyME no tienes ni ese semestre de gracia ni ese presupuesto ocioso. Necesitas mostrar control, serenidad y victorias tangibles dividiendo tus **primeros noventa días** en tres tramos de treinta días con objetivos quirúrgicos:

| Tramo del rescate | Objetivo central | Qué SE HACE de inmediato | Qué queda PROHIBIDO hacer |
| :--- | :--- | :--- | :--- |
| **Días 1 al 30 (Oxígeno y red de vida)** | Evitar muerte súbita y escuchar sin soberbia. | Entrevistar 1 a 1 al equipo y al negocio; guardar claves maestras en bóveda (**Vaultwarden**); **probar hoy mismo una restauración real de backup**; asegurar dominios, certificados y *UPS*. | Reescribir sistemas, cambiar herramientas de golpe o hablar mal de la gestión anterior. |
| **Días 31 al 60 (Puerta única y luz)** | Cortar el caos diario y encender visibilidad. | Activar puerta única de tickets con **tolerancia cero** (**GLPI / Zammad**); levantar semáforo *EOL* y aislar activos en rojo; ejecutar primera limpieza de ahorro *FinOps*. | Comprometer fechas de grandes proyectos nuevos sin haber medido antes la carga operativa real. |
| **Días 61 al 90 (Pacto a 3 años)** | Alinear dinero, riesgos y rumbo ejecutivo. | Publicar matriz **RACI** de los 8 dominios; encender sonda externa (**Uptime Kuma**) y 3 primeros *SLOs*; presentar al directorio los Casos de Negocio de 1 página con 3 opciones. | Intentar resolver diez años de deuda acumulada en un solo trimestre sin priorizar por riesgo. |

### 20.3. Excentricidades y antipatrones: el "sheriff recién llegado" y la valla de Chesterton

El escritor inglés G. K. Chesterton formuló hace casi un siglo un principio que todo informático debería tatuarse antes de borrar una sola línea ajena: *si encuentras una valla atravesada en medio de un camino y no entiendes para qué sirve, no te apresures a derribarla; ve primero a averiguar por qué alguien se tomó el trabajo de construirla, y recién cuando lo sepas tendrás derecho a decidir si debes quitarla*.

En informática ese principio se viola todos los lunes por culpa del antipatrón más arrogante de nuestro gremio: **el síndrome del "sheriff recién llegado"**.

Llega el nuevo jefe de sistemas o el nuevo arquitecto estrella, abre el servidor principal, mira durante diez minutos lo que construyó el equipo anterior y suelta con desprecio: *"¿Pero quién fue el cavernícola que armó esta porquería?, ¡mira este script espantoso corriendo cada cinco minutos, yo lo apago ahora mismo y lo hacemos bien!"*.

Comenta la línea, deshabilita la tarea programada sin preguntar a nadie y se va a almorzar satisfecho de su superioridad técnica. El miércoles al mediodía estalla el escándalo: la interfaz contable dejó de despachar guías de remisión en todas las sucursales porque aquel script "horrible" de cuarenta líneas limpiaba un bloqueo fantasma de un módulo fiscal propietario cuyo fabricante jamás corrigió un defecto de cierre de conexiones.

**Casi todo parche feo que sobrevive años en producción es la cicatriz de un incendio real que tú todavía no conoces.** Criticar al predecesor es el deporte más barato del mundo porque el que se fue no está presente para explicarte que le dieron cero dólares de presupuesto y veinticuatro horas de plazo. Entiende primero qué sostiene la valla, documenta su función, prepara el reemplazo probado y recién entonces retírala con bisturí.

Junto al sheriff imprudente evita otras dos trampas mortales al asumir un entorno:

- **Prometer milagros en treinta días para caer simpático:** Si en tu primera semana prometes a todos los gerentes que sus proyectos atrasados saldrán el mes que viene antes de saber siquiera si existen respaldos sanos, quemarás todo tu crédito político antes del día sesenta.
- **Encerrarte en la oficina técnica sin pisar el negocio:** Si pasas tu primer mes mirando consolas sin ir a sentarte media hora al lado de quien factura en mostrador, de quien despacha en almacén y del director financiero, diseñarás prioridades perfectas para TI e inútiles para la empresa.

#### Señales de alerta temprana en un traspaso o rescate

Prende todas las alarmas desde la primera tarde si encuentras cualquiera de estos vacíos:

- El proveedor externo o el administrador saliente se resiste a entregar credenciales de nivel raíz argumentando que *"por seguridad es mejor que las guardemos nosotros"*.
- Nadie puede mostrarte la factura y cuenta titular donde están registrados el nombre de dominio principal y las cuentas maestras de nube.
- Te dicen *"los backups corren solos todas las noches"*, pero nadie recuerda la fecha exacta de la última vez que levantaron una máquina virtual completa desde esa copia.

### 20.4. Marco de acción pragmático: 4 Checklists de diagnóstico rápido en 30 minutos

Usa estas cuatro listas de verificación directa como radiografía semestral —o en tu primera semana al frente de cualquier entorno—. Cada *"No"* que marques no es motivo de pánico: es simplemente el orden exacto de tu lista de trabajo para los próximos trimestres.

#### 1. Salud de Gobierno, Roles, FinOps y Service Desk

- [ ] ¿Existe una matriz pública de una página donde toda la empresa vea quién es dueño de cada uno de los 8 dominios de TI?
- [ ] ¿Están todas las credenciales administrativas guardadas en bóveda corporativa por rol (**Vaultwarden / Passbolt**) con cero claves exclusivas en la cabeza de una sola persona?
- [ ] ¿Puede cada integrante clave salir diez días hábiles de vacaciones reales desconectado gracias a un suplente entrenado con guías al día?
- [ ] ¿Rige puerta única de tickets (**GLPI / Zammad / osTicket**) con tolerancia cero a pedidos informales por pasillo o mensajería personal?
- [ ] ¿Se calcula la prioridad de incidentes por matriz objetiva *Impacto × Urgencia* auditando que la tasa de reapertura sea menor al 5 %?
- [ ] ¿Tienen dueño nominal, centro de costo y alerta de presupuesto todas las suscripciones *SaaS* y cuentas de nube, purgando cada mes licencias sin uso mayor a 30 días?
- [ ] ¿Existe candado en Compras que impida adquirir tecnología o comprometer fechas comerciales sin factibilidad previa de TI y Seguridad?

#### 2. Salud de Redes, Sistemas, Nube Híbrida y Continuidad

- [ ] ¿Entran los enlaces de internet por rutas físicas distintas y cuentas además con un respaldo inalámbrico independiente (5G o satelital *LEO*) probado en conmutación real?
- [ ] ¿Está segmentada la red en zonas estancas (*VLANs*: Gestión, Servidores, Usuarios, *IoT*/Cámaras e Invitados) con *BPDU Guard* y *DHCP Snooping* activos en bocas físicas?
- [ ] ¿Se extraen automáticamente cada noche las configuraciones de *routers, switches* y *firewalls* hacia un repositorio Git (**Oxidized**) y el inventario IP vive en **NetBox / phpIPAM**?
- [ ] ¿Nacen los servidores a partir de plantillas reproducibles (**cloud-init + Ansible**) sobre virtualización sostenible (**Proxmox VE / KVM**) y sistemas íntegros (**ZFS**)?
- [ ] ¿Existe un semáforo vivo *EOL/EOS* donde todo sistema con soporte vencido esté en migración o aislado con controles compensatorios estrictos?
- [ ] ¿Cumplen tus copias de seguridad críticas la regla **3-2-1-1-0**, incluyendo al menos una copia **inmutable o desconectada** fuera del alcance de las credenciales del dominio productivo?
- [ ] ¿Ejecutaste en los últimos seis meses un simulacro cronometrado de recuperación (*DRP*) y una prueba con carga real de tus baterías *UPS*?

#### 3. Salud de Ciberseguridad Operativa, Cumplimiento, Privacidad e IA

- [ ] ¿Está separada la operación diaria de seguridad (*SecOps*) de quien audita el control de riesgos y cumplimiento (*GRC / Auditor TI*)?
- [ ] ¿Tienen todos los accesos remotos, correos y consolas críticas segundo factor fuerte activo (**FIDO2 / Passkeys** o *TOTP*, cero SMS) sobre identidad centralizada?
- [ ] ¿Trabajan las estaciones de usuario sin permisos de administrador local y se aplican en menos de 48 horas los parches con explotación activa (**CISA KEV**)?
- [ ] ¿Usan los trabajadores remotos en *BYOD* sesiones o cápsulas aisladas (**Guacamole / Kasm**) y mallas de privilegio mínimo (**NetBird / Headscale**) en vez de *VPNs* planas?
- [ ] ¿Existe impreso en papel fuera de la red el protocolo de acción de los primeros 60 minutos ante un ataque de *ransomware*?
- [ ] ¿Cruzas cada semestre la nómina activa de RR. HH. contra todas las cuentas habilitadas garantizando cero accesos vivos de exempleados?
- [ ] ¿Pasa el uso corporativo de inteligencia artificial por puerta controlada (**LiteLLM / Open WebUI**) con límites de gasto, respeto de permisos en *RAG* y confirmación humana en agentes?

#### 4. Salud de Arquitectura, Desarrollo, DevSecOps y Observabilidad

- [ ] ¿Está estandarizado el desarrollo interno en máximo 1 o 2 stacks oficiales documentando decisiones estructurales con *ADRs* en Git?
- [ ] ¿Se integran todos los sistemas mediante contratos limpios (**OpenAPI**) con prohibición absoluta de leer o escribir directo en bases de datos ajenas?
- [ ] ¿Pasa todo cambio por revisión humana de pares, pruebas automáticas y detectores de secretos (**Gitleaks**), análisis de código (**Semgrep**) e inventario/escaneo (**Trivy**) en menos de diez minutos?
- [ ] ¿Corren tus contenedores productivos como artefactos inmutables sin `root`, con disco de solo lectura (`read_only`), `cap_drop: ALL` e imágenes fijadas por `SHA-256`?
- [ ] ¿Mides tus recorridos críticos de negocio con **OpenTelemetry**, tres *SLOs* claros, presupuesto de error acordado y un vigilante externo independiente (**Uptime Kuma**)?
- [ ] ¿Solo despiertan al ingeniero de guardia alertas accionables que ya duelen al usuario, y cada incidente grave cierra con un *Post-Mortem* sin culpa de máximo 3 tickets reales?

* * *

### 20.5. Epílogo a la Segunda Edición: las siglas cambian, las excentricidades permanecen

En las conclusiones de aquella breve primera edición de 2022 escribí algo que hoy, con más páginas, más cicatrices y cuatro años intensos de cambios encima, sostengo exactamente con la misma convicción: **no todos los entornos de TI deben estar calcados de un mismo molde, y nada de lo escrito aquí pretende convertirse en una biblia rígida**.

Este libro nació y creció para servirte como una linterna pragmática cuando te toque mirar de frente tu propia organización. A veces te servirá para confirmar que el problema que sufres cada mañana a solas no es locura tuya, sino un antipatrón clásico que se repite en media industria; otras veces te dará las palabras financieras exactas para destrabar una reunión difícil con tu gerencia, o la lista de herramientas abiertas para poner orden este mismo mes sin pedir permiso ni fortunas.

Si algo me han enseñado décadas viviendo alrededor de computadoras, cables, salas frías y comités humanos es que la tecnología muda de piel cada cinco años con un ruido ensordecedor. Ayer la salvación universal se llamaba virtualización, luego nube pública, después microservicios y hoy inteligencia artificial agéntica; dentro de cinco años llevará otro acrónimo nuevo que algún vendedor jurará que hace obsoleto todo el resto.

Sin embargo, debajo de cada ola nueva siguen mandando exactamente los mismos fundamentos invisibles: conocer tus activos, separar responsabilidades con honestidad, hablar claro con quien dirige el negocio, proteger tus respaldos como si te fuera la vida en ello, documentar para que tu compañero pueda irse tranquilo de vacaciones y recordar siempre que detrás de cada pantalla y de cada ticket hay personas de carne y hueso intentando hacer su trabajo.

Las máquinas son predecibles; nuestras excentricidades humanas son las que vuelven apasionante —y a veces deliciosamente absurdo— este oficio.

No me queda más que decir: gracias por acompañarme en este recorrido ampliado. Espero de corazón que hayas disfrutado este texto tanto como yo disfruté volviendo a abrir el capó de nuestro entorno, y sobre todo, que mañana por la mañana te sirva para construir un departamento un poco más cuerdo, más libre y más sólido.

**Jesús A. Palencia S.**  
*Segunda Edición, 2026*
