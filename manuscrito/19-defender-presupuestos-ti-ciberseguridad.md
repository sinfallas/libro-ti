## Capítulo 19. Cómo defender presupuestos de infraestructura y ciberseguridad ante gerencias escépticas

En toda organización existe una asimetría psicológica injusta contra quienes cuidamos los cimientos. Si el área comercial pide cincuenta mil dólares para una campaña nueva, promete traer doscientos mil en ventas visibles el mes que viene; todos aplauden y firman. En cambio, cuando tú pides quince mil dólares para renovar conmutadores fuera de soporte, reemplazar baterías o aislar copias de seguridad inmutables, el retorno prometido en caso de éxito absoluto es... **que el martes que viene todo siga exactamente igual de aburrido y silencioso que hoy**.

A eso lo llamo **la paradoja del bombero invisible**: cuanto más impecable es el trabajo preventivo de Infraestructura y Ciberseguridad, menos incendios ocurren; y cuantos menos incendios ocurren, más tentado se siente un directorio no técnico a preguntar en voz alta: ***"¿Para qué les pagamos tanto y por qué quieren comprar más cosas si aquí nunca pasa nada?"***.

Aprender a cruzar ese desierto de escepticismo sin mendigar favores, sin asustar con cuentos infantiles y hablando el idioma exacto del director financiero (*CFO*) es una habilidad de supervivencia tan importante como saber levantar un servidor caído.

### 19.1. El concepto sin humo: no estás pidiendo gasto técnico, estás vendiendo seguro de flujo de caja

El primer cambio mental empieza dentro de tu propia cabeza antes de pisar la sala de juntas: **deja de ir a pedir plata "para Sistemas"**.

Un gerente general no tiene ninguna obligación emocional de financiar el amor al arte de tu cuarto de servidores. Lo que sí le quita el sueño a las tres de la mañana son cuatro cosas muy concretas:

1. Que se detenga la facturación, el despacho o la planta productiva.
2. Perder clientes grandes por incumplir contratos o sufrir daño reputacional público.
3. Enfrentar multas legales o demandas por negligencia comprobada ante una fuga de datos.
4. Que los costos fijos crezcan descontrolados comiéndose el margen neto (*EBITDA*) o la caja disponible.

Una inversión seria en infraestructura o ciberseguridad jamás se presenta como *"queremos modernizar la plataforma"*; se presenta como **una póliza cuantificada de protección del flujo de caja o una reducción directa del costo operativo futuro**. No estás comprando discos duros ni licencias defensivas: estás comprando que la empresa pueda seguir cobrando facturas el día que falle un equipo físico o entre un correo malicioso en recepción.

### 19.2. La teoría vs. la trinchera: del comité corporativo ideal a negociar peso por peso

En bancos regulados o multinacionales maduras, una parte sustancial del presupuesto defensivo viene preaprobada por mandato regulatorio externo: si no renuevas tal control, el regulador suspende la licencia para operar, así que nadie discute el cheque.

En una empresa mediana o PyME privada, compites dólar contra dólar frente a comprar una camioneta más de reparto, abrir un local nuevo o pagar aguinaldos en un trimestre ajustado. Allí el director financiero no es un villano de caricatura que odia la tecnología: es alguien obligado a administrar escasez frente a diez gerentes que juran que su pedido es de vida o muerte.

Además, existe un detalle contable que el noventa por ciento de los líderes técnicos ignora y que define la mitad de las aprobaciones en el mundo real: **entender si a tu director financiero este año le duele más el CAPEX o el OPEX**:

- **CAPEX (*Capital Expenditure* / Inversión de capital):** Comprar hardware propio o infraestructura física amortizable en tres a cinco años. Consume efectivo hoy, pero contablemente no golpea entero el gasto operativo del mes, **mejorando indicadores como el EBITDA** (clave cuando la empresa busca crédito bancario o valuación).
- **OPEX (*Operational Expenditure* / Gasto operativo):** Alquiler mensual de nube, servicios administrados o *leasing* operativo. Protege la liquidez inmediata de caja hoy y se deduce como gasto corriente del ejercicio, aunque reduce el margen operativo mensual reportado.

Observa cómo cambia tu efectividad cuando pasas de rogar con siglas técnicas a negociar con inteligencia financiera:

| Enfoque en la reunión | Cómo fracasa el pedido técnico | Cómo gana el planteo financiero |
| :--- | :--- | :--- |
| **Argumento central** | *"El clúster tiene paquetes descartados y necesitamos nodos NVMe con 25 GbE."* | *"Evitamos parar 18 horas la facturación mayorista en temporada alta."* |
| **Formato de decisión** | Pedido único binario (*"apruébenme 20.000 USD, sí o no"*). | **Tres opciones graduadas** (Óptima, Pragmática recomendada y Aceptar riesgo firmado). |
| **Origen de los fondos** | Todo es dinero nuevo adicional sobre un presupuesto ya cerrado. | Parte o todo se **autofinancia** con ahorros *FinOps* demostrados el trimestre anterior. |
| **Estructura contable** | Imponer compra al contado o suscripción sin preguntar la situación fiscal. | Preguntar antes al *CFO*: *"¿Este trimestre te sirve más estructurarlo como CAPEX o como OPEX?"*. |

### 19.3. Excentricidades y antipatrones: el cheque del lunes negro, el terrorismo FUD y el presupuesto inflado

Tres errores clásicos explican por qué tantos presupuestos legítimos mueren rechazados mientras el dinero termina quemándose en el peor momento posible.

#### 1. Negar monedas en calma y firmar cheques en blanco en medio del incendio

Es la continuación natural de la paradoja del bombero invisible. En marzo pides seis mil dólares para separar el servidor de respaldos inmutables y cambiar baterías vencidas; te responden que *"aguantemos hasta el año que viene"*.

En octubre entra un incidente grave o se quema la controladora sin respaldo limpio. Ese domingo a medianoche desaparecen mágicamente todas las restricciones presupuestarias: el mismo directorio que regateó seis mil dólares aprueba sin pestañear **cincuenta mil dólares de emergencia** en consultores forenses de urgencia, envíos aéreos con sobreprecio, horas extra y cuatro días enteros de ventas perdidas. Pagar tres o cinco veces más caro después del golpe por haberse ahorrado el mantenimiento preventivo es el impuesto más estúpido que existe en los negocios.

#### 2. El autoboicot por terrorismo técnico (*FUD*)

Cansado de que no lo escuchen, el líder técnico decide asustar al directorio usando miedo, incertidumbre y duda (*Fear, Uncertainty, and Doubt* o *FUD*): entra anunciando que *"los hackers rusos nos van a destruir mañana si no compramos esta plataforma mágica"*.

El miedo sin números funciona exactamente una sola vez. Si te aprueban el gasto asustados y durante el año siguiente no ocurre el apocalipsis prometido —o peor, si no te lo aprueban y por pura suerte estadística tampoco ocurre nada durante seis meses—, acabas de destruir tu credibilidad profesional para los próximos cinco años. Pasas a ser visto como el alarmista exagerado al que siempre hay que dividirle el discurso por cuatro.

#### 3. Inflar el presupuesto un 40 % "por si me recortan la mitad"

Vieja maña de regateo callejero llevada al directorio: necesitas diez mil reales, pero pides dieciséis mil esperando cerrar en diez tras el recorte ritual. El problema es que cualquier director financiero competente termina auditando un par de precios de mercado; el día que descubre un sobreprecio artificial inflado por ti mismo, **jamás vuelve a creer en una sola planilla que salga de tu oficina**, incluso el día que traigas un presupuesto ajustado hasta el último centavo.

#### Señales de alerta temprana

Tu forma de defender recursos necesita corrección urgente si te ves reflejado aquí:

- Llegas a la reunión anual de presupuesto sin saber cuánto dinero exacto factura tu empresa en una hora hábil promedio.
- Presentas cotizaciones de proveedores reenviando directamente el PDF técnico lleno de códigos de parte sin una sola carilla ejecutiva tuya adelante.
- Cuando dirección rechaza una inversión crítica de continuidad o seguridad, te vas mascullando bronca por el pasillo sin dejar constancia escrita y firmada del riesgo asumido.
- Nunca llegaste a Finanzas devolviendo primero un ahorro concreto logrado por eficiencia interna antes de pedir una partida nueva.

### 19.4. Marco de acción pragmático: costo de parada, autofinanciación FinOps y Caso de Negocio de 1 página

Conseguir presupuesto sostenido en organizaciones escépticas se logra aplicando un método transparente, frío y documentado en cuatro movimientos.

#### Paso 1: Calcula junto a Finanzas el Costo Real por Hora de Inactividad

Antes de pedir un solo tornillo, siéntate veinte minutos con alguien de Administración y acuerden una cifra conservadora —incluso redondeada hacia abajo para que nadie pueda discutirla— de **cuánto pierde la empresa por cada hora completa con sus sistemas principales caídos**:

> **Costo Real por Hora Caída** = Margen de ventas perdidas + Costo salarial ocioso + Horas extra de rescate + Multas contractuales SLA

Si sesenta empleados detenidos representan mil doscientos dólares por hora en sueldos improductivos y la empresa deja de ganar otros dos mil ochocientos en margen no facturado, **cada hora caída cuesta cuatro mil dólares**. Multiplicado por veinticuatro horas de recuperación lenta sin el equipo redundante, un solo incidente cuesta **noventa y seis mil dólares**. Cuando pones al lado una inversión preventiva de ocho mil dólares que baja esa parada a treinta minutos, ya no es un gasto de TI: es evitar perder noventa y cuatro mil dólares con un retorno de doce a uno.

#### Paso 2: Llega con la billetera abierta gracias a victorias tempranas de FinOps

Nada desarma más rápido a un gerente escéptico que un líder de TI que **primero ahorra y después pide**. Ejecuta la higiene del Capítulo 8 (cancelar licencias *SaaS* de usuarios inactivos, renegociar enlaces duplicados, apagar instancias ociosas o repatriar cargas desangradas) y entra a la reunión con esta apertura imbatible:

> *"Revisando contratos y consumo ocioso acabamos de generar un ahorro recurrente verificado de 24.000 dólares anuales. Proponemos devolver 10.000 netos al resultado del ejercicio y reinvertir los otros 14.000 en eliminar los dos riesgos críticos de continuidad que hoy amenazan la facturación."*

Pasaste en treinta segundos de ser quien gasta dinero a ser un socio que fabrica presupuesto propio.

#### Paso 3: Presenta siempre 3 opciones cerradas (con acta de aceptación de riesgo)

Nunca acorrales a un directivo en un *"tómalo o déjalo"*, pero tampoco le permitas rechazar una cobertura vital gratis y sin huella. Pregunta primero al *CFO* si prefiere estructurar el desembolso como *CAPEX* o como *OPEX* (arrendamiento/suscripción) y entrégale siempre **esta plantilla ejecutiva de una sola página**:

```markdown
## Caso de Negocio de Continuidad / Seguridad (1 Página)

**Iniciativa:** [Ej. Renovación de respaldo inmutable y conmutación eléctrica]
**Proceso de negocio protegido:** [Facturación nacional, despacho y nómina — 120 usuarios]
**Exposición actual verificada:** Costo estimado de parada = USD [X]/hora. Hoy una falla física implica [36] horas de corte = USD [36 * X] de pérdida directa.

### Opciones de decisión para Dirección (TCO total a 36 meses)
- **Opción A — Cobertura Alta Disponibilidad (Óptima):** USD [$$$] ([CAPEX/OPEX]). Reduce caída máxima (RTO) a < 15 minutos sin pérdida de datos.
- **Opción B — Mitigación Pragmática (RECOMENDADA POR TI):** USD [$$] (Autofinanciada en un [Y]% con ahorros FinOps ya ejecutados). Reduce caída máxima a < 2 horas con copia inmutable verificada.
- **Opción C — Postergar inversión (Riesgo Aceptado):** USD 0 hoy. Dirección asume formalmente una exposición de USD [36 * X] y hasta [2 días] sin operar ante falla del activo fuera de soporte.

**Decisión adoptada por Gerencia General:** [ ] Opción A   [ ] Opción B   [ ] Opción C
**Firma y fecha de resolución / aceptación de riesgo:** ___________________________
```

Observa la magia psicológica y legal de la **Opción C**: no amenazas a nadie ni faltas el respeto; simplemente traduces el *"no hagamos nada"* a una cifra concreta que alguien debe firmar con su nombre y apellido. En ocho de cada diez reuniones, quien iba a decir *"véanlo el año que viene"* mira el renglón de firma de la Opción C, traga saliva y aprueba en el acto la Opción B recomendada. Y en el dos de cada diez restante donde igual deciden postergar por falta real de caja, tú cumples lealmente la decisión empresarial, pero **tu equipo duerme protegido sabiendo que la responsabilidad quedó documentada donde corresponde**.

Nos queda una última parada antes del glosario final. Imagina que el lunes que viene entras por primera vez —o decides empezar de cero— frente a un entorno lleno de urgencias y no sabes qué cable tocar primero sin volar por los aires: cerramos el libro en el **Capítulo 20** con el mapa de supervivencia de los primeros noventa días, las listas de diagnóstico rápido en treinta minutos y el epílogo de esta segunda edición.
