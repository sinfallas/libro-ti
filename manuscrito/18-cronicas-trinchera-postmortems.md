# Parte IV — Crónicas de Trincheras, Antipatrones y Supervivencia

## Capítulo 18. Crónicas de trinchera y cultura de post-mortems sin culpa

Si llegaste hasta esta cuarta parte esperando la fórmula secreta para que jamás vuelva a caerse un servidor en tu empresa, permíteme ahorrarte una desilusión: **todo sistema complejo operado por seres humanos en el mundo real tarde o temprano falla**. Se cortan cables que decían ser indestructibles, vencen certificados que todos creían automáticos, caducan discos nuevos de fábrica y personas brillantes teclean el comando equivocado cuando llevan catorce horas despiertas.

La diferencia entre un departamento de tecnología amateur y uno profesional nunca radica en si sufre o no incidentes; radica en **qué ocurre en la sala al día siguiente de la caída**.

En las organizaciones inmaduras se convoca un tribunal inquisitorial para encontrar a qué técnico colgar en la plaza pública, tranquilizar la conciencia de los jefes con un despido ejemplificador y seguir operando exactamente sobre la misma trampa mortal esperando a la próxima víctima. En las organizaciones serias se investiga el sistema, se protege a quien dijo la verdad a tiempo y se construye una barandilla técnica para que ese mismo error sea físicamente imposible de repetir.

### 18.1. El concepto sin humo: despedir al piloto no arregla el avión mal diseñado

Imagina que en la cabina de un avión comercial colocan el botón que apaga ambos motores en pleno vuelo exactamente al lado, con el mismo color y la misma forma que el botón que enciende la luz de lectura del copiloto. Un día, cruzando turbulencia nocturna, el copiloto estira la mano cansada y apaga los motores.

Si al aterrizar de emergencia la aerolínea despide al copiloto, contrata a otro y deja ambos botones idénticos en el mismo lugar, **no resolvió absolutamente nada**: solo garantizó que dentro de seis meses otro piloto vuelva a tocar el botón equivocado. La aeronáutica civil se volvió el transporte más seguro de la historia humana el día que dejó de conformarse con culpar al individuo y empezó a poner tapas protectoras rojas, seguros mecánicos y confirmaciones dobles sobre los controles críticos.

En tecnología llamamos a esa filosofía **análisis post-incidente sin culpa (*Blameless Post-Mortem*)**, enmarcado dentro de lo que la ingeniería de seguridad denomina **Cultura Justa (*Just Culture*)**. Conviene trazar su línea divisoria con precisión para que nadie confunda aprendizaje con impunidad:

- **El error honesto de buena fe se protege al 100 %:** Si un técnico ejecutó un paso intentando hacer su trabajo y ese único paso destruyó producción, la pregunta correcta jamás es *"¿quién fue?"*, sino ***"¿por qué nuestra arquitectura permitió que un solo comando humano sin barrera tirara abajo toda la empresa?"***. Castigar a quien levanta la mano y confiesa rápido qué tocó solo logra que, en el próximo incidente, el técnico esconda el error durante tres horas intentando arreglarlo en silencio mientras la empresa pierde diez veces más dinero.
- **El ocultamiento, la mentira o el sabotaje deliberado tienen tolerancia cero:** *Sin culpa* protege la equivocación involuntaria; jamás ampara borrar registros para esconder rastro, mentir en la cronología ni violar a sabiendas por segunda vez un procedimiento de seguridad acordado.

### 18.2. La teoría vs. la trinchera: tres crónicas reales de madrugada (y qué falló de verdad)

En los libros académicos los incidentes ocurren por causas exóticas dignas de tesis doctoral. En la vida real de nuestras empresas, las peores caídas nacen de descuidos mundanos encadenados. Desglosemos tres crónicas reales —debidamente anonimizadas pero fieles hasta el último tornillo a lo que ocurre en la calle— para entrenar el ojo en distinguir al culpable aparente de la causa sistémica verdadera.

#### Crónica 1: El cursor parpadeando en la ventana negra equivocada (3:12 a. m.)

- **Qué ocurrió:** Viernes de madrugada durante una migración mayor de base de datos. Tras cinco horas de trabajo tenso, un administrador experimentado tenía abiertas en su segundo monitor dos terminales negras idénticas: a la izquierda el entorno de preproducción donde debía limpiar las tablas temporales de ensayo; a la derecha el nodo primario de producción. Un mensaje urgente lo distrajo diez segundos; al volver la vista pegó la sentencia de vaciado y presionó *Enter* sobre la ventana derecha. Cuatro años de movimientos transaccionales desaparecieron en menos de un segundo.
- **La reacción torpe habitual:** Sancionar al administrador por *"falta de atención grave"*.
- **Qué había fallado realmente en el sistema:** Tres barreras ausentes: **(1)** un humano seguía teniendo permiso directo de escritura destructiva sobre producción sin pasar por un script validado; **(2)** ambas terminales usaban exactamente el mismo esquema visual neutro sin aviso rojo estridente en el indicador de comandos (*prompt*) productivo; y **(3)** por fortuna esa noche sí existía instantánea previa tomada veinte minutos antes, lo que convirtió una tragedia irreversible en cuarenta minutos de restauración controlada porque el técnico avisó en el segundo uno sin esconder nada.

#### Crónica 2: El dominio y el certificado huérfanos en lunes de quincena

- **Qué ocurrió:** Lunes 15 a las nueve y cuarto de la mañana, pico absoluto de cobranzas y pedidos. De golpe todos los clientes ven en sus navegadores una advertencia aterradora de sitio inseguro o directamente el nombre de la empresa deja de resolver en internet. Durante tres horas reina el caos porque nadie encuentra en qué proveedor externo estaba registrado el dominio ni quién tiene la clave del panel: había sido comprado ocho años atrás con la tarjeta personal y el correo corporativo de un antiguo jefe de sistemas cuya casilla fue eliminada al renunciar.
- **La reacción torpe habitual:** Culpar al equipo actual por *"no haberse acordado de la fecha"*.
- **Qué había fallado realmente en el sistema:** Confiar la continuidad del negocio a la memoria humana y a correos nominales individuales en lugar de **(1)** registrar todo activo crítico bajo cuentas institucionales de rol (`dominios@...` custodiada en la bóveda compartida), **(2)** automatizar la renovación de certificados (*ACME / Let's Encrypt*) y **(3)** vigilar fechas de expiración desde una sonda externa independiente (**Uptime Kuma**) que avise treinta días antes.

#### Crónica 3: Los cuarenta segundos de verdad de la UPS "eterna"

- **Qué ocurrió:** Tormenta de verano a media tarde; cae el suministro eléctrico comercial del edificio. Todos miran tranquilos el cuarto de máquinas pensando *"tenemos una UPS grande que aguanta cuarenta minutos hasta que arranque el grupo electrógeno"*. Exactamente treinta y ocho segundos después se escucha un pitido agudo final y todo el bastidor se apaga en seco como si hubieran arrancado los enchufes de la pared, corrompiendo volúmenes que no alcanzaron a vaciar caché.
- **La reacción torpe habitual:** Echarle la culpa a la marca de la *UPS* o al proveedor eléctrico.
- **Qué había fallado realmente en el sistema:** Las baterías de plomo-ácido llevaban cuatro años y medio instaladas sin recambio y jamás nadie había ejecutado una prueba controlada de descarga real bajando la llave térmica un sábado: el visor frontal marcaba *"100 % de carga"* en reposo, pero la resistencia interna estaba muerta y colapsó apenas recibió amperaje real.

Observa el patrón común que une las tres historias en esta tabla comparativa:

| Incidente real | Culpable fácil (Falsa salida) | Verdadera causa sistémica | Barandilla de ingeniería definitiva |
| :--- | :--- | :--- | :--- |
| **Comando en consola equivocada** | *"El técnico se distrajo a las 3 a. m."* | Acceso manual destructivo + entornos visualmente indistinguibles. | Cero *SSH/SQL* manual directo en vivo; *prompts* rojos de advertencia y confirmación explícita del nombre del host. |
| **Certificado / dominio vencido** | *"Nadie anotó el vencimiento en la agenda."* | Activo atado a cuenta personal eliminada y renovación artesanal. | Titularidad corporativa en bóveda (**Vaultwarden**), renovación automática y alerta externa a 30/15/7 días. |
| **Apagón instantáneo de *UPS*** | *"Falló el equipo eléctrico."* | Cero pruebas empíricas de carga real y ciclo de baterías ignorado. | Prueba trimestral bajando llave térmica con carga controlada y reemplazo preventivo en semáforo *EOL*. |

### 18.3. Excentricidades y antipatrones: "tener más cuidado", el teatro del culpable y el cementerio de acciones

Tres vicios destruyen cualquier posibilidad de aprender de los golpes operativos.

#### 1. Cerrar un informe diciendo "Causa raíz: error humano — Acción: tener más cuidado"

Si algún día te entregan un análisis post-incidente cuya conclusión final es *"hubo un error humano y se instruyó al personal a prestar mayor atención en el futuro"*, devuélvelo en el acto sin firmarlo. **"Tener más cuidado" no es un control de ingeniería: es un deseo piadoso.** Los seres humanos nos cansamos, nos enfermamos y nos distraemos exactamente igual hoy que hace diez mil años. Donde termina diciendo "error humano" no termina la investigación: **ahí es exactamente donde recién debe empezar**.

#### 2. La reunión de linchamiento disfrazada de revisión técnica

Ocurre cuando en la reunión post-incidente entran gerentes alterados preguntando en tono policial *"¿pero por qué hiciste clic ahí?, ¿cómo no te diste cuenta?"* aprovechando la ventaja tramposa de conocer el final de la película (*sesgo retrospectivo*). A las tres de la tarde del martes, descansado y con todos los registros sobre la mesa, parece obvio cuál era el cable correcto; el sábado a las cuatro de la mañana con media empresa caída y tres alarmas sonando al mismo tiempo, el técnico tomó la decisión que parecía más razonable con la información incompleta que la pantalla le mostraba en ese segundo.

#### 3. El informe brillante de diez páginas cuyas acciones jamás se ejecutan

El equipo hace una autopsia ejemplar, redacta doce acciones preventivas excelentes, guarda el documento en una carpeta compartida y vuelve corriendo a la rutina diaria sin abrir un solo ticket ni reservar horas para implementarlas. Ocho meses después ocurre **exactamente el mismo incidente paso por paso**, y alguien rescata con vergüenza el documento anterior donde ya habían prometido arreglarlo el año pasado.

#### Señales de alerta temprana

La cultura frente al fallo en tu organización está enferma si notas cualquiera de estos síntomas:

- Cuando algo se rompe tras un cambio, la primera reacción del equipo es revisar registros para demostrar *"yo no fui"* antes de colaborar para levantar el servicio.
- Los incidentes menores o casi-accidentes (*near misses*) se ocultan en silencio para que la jefatura no se entere.
- Más de la mitad de tus reportes de incidentes pasados señalan fallos individuales de personas en lugar de controles técnicos o de proceso inexistentes.
- No tuviste tiempo de completar ninguna de las tareas correctivas surgidas de las últimas dos caídas importantes.

### 18.4. Marco de acción pragmático: 5 Porqués sistémicos y plantilla de Post-Mortem lista para usar

Institucionalizar el aprendizaje real tras cada incidente grave (`P1`) —o tras aquellos sustos donde estuviste a un milímetro del desastre— se logra con un método simple ejecutado dentro de las cuarenta y ocho horas posteriores a haber apagado el fuego.

#### Paso 1: Aplica los "5 Porqués" apuntando siempre al sistema, nunca al apellido

Cada vez que aparezca un nombre propio en la explicación, sigue preguntando *por qué* hasta chocar contra un diseño técnico o proceso mejorable:

1. *¿Por qué cayó el sistema de pedidos?* Porque se llenó el disco de la base de datos.
2. *¿Por qué se llenó el disco?* Porque un registro de depuración creció cien gigabytes en seis horas.
3. *¿Por qué nadie lo detuvo antes?* Porque no existía rotación automática con tope de tamaño ni alerta predictiva de saturación.
4. *¿Por qué ese servidor salió sin rotación ni alerta?* Porque fue creado manualmente fuera de la plantilla base de **Ansible**.
5. *¿Por qué se pudo crear un servidor productivo fuera de plantilla?* Porque aún no cerramos el candado de entrega visto en el Capítulo 12. **Ahí tienes tus verdaderas acciones de ingeniería.**

#### Paso 2: Usa esta plantilla de una carilla y limita las acciones a tres tickets reales

Copia esta estructura directamente en **BookStack**, **Outline** o tu repositorio Git para cada incidente mayor. Queda prohibido usar nombres propios en tono acusatorio (usa roles: *Ingeniero de guardia*, *Operador de despliegue*) y rige una ley férrea: **máximo tres acciones preventivas concretas, pero las tres entran hoy mismo al tablero con responsable nominal y vencimiento menor a treinta días**:

```markdown
## Post-Mortem Sin Culpa: [ID y Título claro del incidente]

- **Fecha y duración total:** [YYYY-MM-DD | HH:MM UTC inicio -> HH:MM UTC fin (X min)]
- **Impacto real en el negocio:** [Usuarios afectados, pedidos demorados, % de Error Budget consumido]
- **Resumen ejecutivo (3 líneas sin siglas):** [Qué vio el cliente y cómo se restauró]

### 1. Cronología verificada (Hora UTC)
- HH:MM — Cambio o evento disparador inicial.
- HH:MM — Primera alerta automática (o reclamo si falló la detección).
- HH:MM — Acción de contención que detuvo el sangrado.
- HH:MM — Servicio verificado al 100 % operativo.

### 2. Análisis sistémico (Cero "tener más cuidado")
- **Disparador técnico inmediato:** [Qué componente exacto falló]
- **Defensas que faltaron o fallaron:** [Por qué el sistema permitió el impacto o tardó en avisar]
- **Qué funcionó bien y debemos conservar:** [Respaldos, comunicación, rollback, etc.]

### 3. Acciones preventivas comprometidas (Máximo 3 — Plazo <= 30 días)
1. [Ticket #123] Automatizar/bloquear técnicamente X — Dueño: [Rol/Nombre] — Fecha: [YYYY-MM-DD]
2. [Ticket #124] Agregar alerta sintética sobre Y — Dueño: [Rol/Nombre] — Fecha: [YYYY-MM-DD]
3. [Ticket #125] Actualizar runbook y probarlo con suplente — Dueño: [Rol/Nombre] — Fecha: [YYYY-MM-DD]
```

Cuando tu equipo comprueba en la primera caída real que decir la verdad rápido se premia con respeto profesional y mejoras concretas, la velocidad de detección y recuperación se reduce a la mitad: nadie pierde tiempo borrando huellas porque todos están concentrados en salvar el servicio.

Ahora bien, muchas de esas mejoras estructurales —cambiar la *UPS* muerta, comprar el segundo enlace inalámbrico o levantar el nodo de respaldo inmutable— chocan al día siguiente con la pared más dura de todas: **conseguir que una gerencia escéptica apruebe el dinero antes de que ocurra la desgracia**. A ganar esa batalla en el directorio dedicamos por completo el Capítulo 19.
