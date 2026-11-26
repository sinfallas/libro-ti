## Capítulo 7. Riesgos, Cumplimiento, Privacidad y Auditoría (GRC, Auditor TI y DPO)

En el capítulo anterior pusimos a los guardianes operativos en las murallas: el equipo de *SecOps* y el *CISO* endureciendo servidores, cerrando accesos y conteniendo ataques en vivo. Pero la experiencia demuestra una ley incómoda de la naturaleza humana: cuando la misma persona que construye la muralla es la única encargada de certificar si los ladrillos quedaron bien puestos, tarde o temprano el cansancio, la prisa o el orgullo le harán mirar hacia otro lado frente a sus propias grietas.

En la primera edición agrupé bajo el **Área de Control de Riesgos** dos figuras fundamentales: el **Auditor de Sistemas de Información** —orientado a bajar al terreno y ofrecer mejoras pragmáticas— y el **Delegado de Protección de Datos (*Data Protection Officer* o *DPO*)**. También señalé que desde allí debían vigilarse los planes de contingencia, la recuperación y las condiciones de salida de los proveedores.

En 2026 esa intuición madura hacia un dominio completo e independiente conocido internacionalmente como **Gobierno, Riesgos y Cumplimiento (*Governance, Risk, and Compliance* o *GRC*)**, integrado junto a la **Auditoría TI** y la **Privacidad de Datos (*DPO*)**. Entender por qué cumplir una norma en un papel no significa estar seguro —y cómo auditar con rigor sin volverse el enemigo burocrático del departamento técnico— es la diferencia entre sobrevivir a una crisis real o hundirse abrazado a un certificado colgado en la recepción.

### 7.1. El concepto sin humo: quien cocina el plato no firma la inspección sanitaria

La regla de oro de todo gobierno tecnológico serio cabe en una sola oración: **quien administra o asegura operativamente un sistema jamás puede auditarse a sí mismo**.

Desarmemos de inmediato una confusión habitual en los directorios: **estar seguro** y **cumplir una norma** no son sinónimos.

- **Estar seguro (*SecOps*)** es una realidad física y técnica: que el atacante no logre escalar privilegios ni destruir tus respaldos un sábado a las tres de la mañana.
- **Gobernar riesgos y cumplir (*GRC*, Auditoría y *DPO*)** es asegurar que las decisiones técnicas respondan a los riesgos reales del negocio, cumplan la ley vigente y **puedan demostrarse con evidencia verificable** ante clientes, reguladores, aseguradoras y accionistas.

Puedes tener una empresa razonablemente segura que pierde licitaciones importantes porque es incapaz de demostrar documentalmente cómo controla sus accesos; y —mucho más frecuente y peligroso— puedes tener una empresa con tres diplomas de certificación enmarcados en el pasillo que cae redonda en diez minutos porque aprobó la auditoría mostrando capturas de pantalla maquilladas.

Dentro de este dominio conviven tres responsabilidades con misiones bien diferenciadas:

1. **Gestión de Riesgos y Continuidad (*GRC*):** Traduce fallos técnicos posibles a impacto económico y operativo, mantiene vivo el mapa de riesgos y exige que los planes de continuidad de negocio (*Business Continuity Plan* o *BCP*) y de recuperación ante desastres (*Disaster Recovery Plan* o *DRP*) existan en el mundo físico, no solo en una carpeta compartida.
2. **Auditoría de Sistemas (*Auditor TI*):** Como ya defendía en 2022, un buen auditor informático no es un inquisidor sentado en una oficina lejana buscando culpables; es un profesional que hace entrevistas y trabajo de campo para detectar anomalías en los procesos y proponer soluciones pragmáticas antes de que esas anomalías estallen en producción.
3. **Delegado de Protección de Datos (*DPO*):** Custodia el cumplimiento de las leyes de privacidad —desde el Reglamento General de Protección de Datos europeo (*RGPD*) hasta el mosaico de leyes nacionales de protección de datos personales hoy vigentes en América Latina—, aplicando una máxima implacable de higiene: **el dato personal que no recolectas ni almacenas por capricho es el único que jamás podrán robarte ni usarse para multarte**.

Observa cómo operan en contrapeso limpio la defensa activa de *SecOps* y la verificación independiente de *GRC* sin pisarse la manguera:

![Segregación saludable entre ejecución defensiva (SecOps) y control independiente (GRC y DPO)](07-segregacion-secops-vs-grc.png){ width=92% }

### 7.2. La teoría vs. la trinchera: de los marcos corporativos al control pragmático con pocos recursos

En bancos globales o empresas cotizadas en bolsa, el área de *GRC* moviliza ejércitos de analistas internos, consultoras externas de renombre, comités trimestrales de directorio y plataformas automatizadas que recolectan evidencias cada hora para sostener certificaciones simultáneas (*ISO/IEC 27001*, *SOC 2 Tipo II*, *PCI-DSS*).

En una empresa mediana o PyME regional, la palabra "auditoría" suele aparecer recién cuando un cliente grande amenaza con cancelar el contrato si no le envías mañana un cuestionario de ochenta preguntas respondido, o cuando entra en vigor una nueva ley local de datos personales con multas millonarias. Sin presupuesto para un departamento entero de cumplimiento, la tentación inmediata es copiar plantillas ajenas o delegarle el trámite al técnico más callado del rincón.

Compara cómo se vive este dominio cuando se copia la burocracia vacía frente a cuando se aterriza con criterio de trinchera:

| Eje de gobierno y control | Burocracia corporativa o teatro | Aplicación pragmática en la trinchera |
| :--- | :--- | :--- |
| **Políticas de seguridad** | Manuales de 140 páginas redactados en jerga legal que ningún empleado leyó jamás. | Diez reglas operativas breves, firmadas, entendibles y verificadas técnicamente en los sistemas. |
| **Continuidad y *DRP*** | Documento teórico guardado hace cuatro años asumiendo que todo restaurará bien. | Simulacro semestral con cronómetro en mano levantando el sistema crítico en entorno aislado. |
| **Privacidad (*DPO*)** | Avisos legales eternos en la web mientras adentro se copian bases de clientes sin control. | Inventario claro de qué datos personales entran, por qué se piden, quién los ve y cuándo se borran. |
| **Relación con Auditoría** | Guerra fría: TI esconde problemas y el auditor festeja cada hallazgo como trofeo personal. | Auditoría de campo orientada a destrabar cuellos de botella y conseguir respaldo para corregir riesgos. |

### 7.3. Excentricidades y antipatrones: el cumplimiento de papel, el auditor policía y la trampa sin salida

Pocas escenas desnudan mejor la hipocresía organizacional que la semana previa a una auditoría externa en una empresa adicta al **cumplimiento de papel**.

Durante once meses y medio nadie tuvo tiempo para revisar permisos de usuarios dados de baja, probar restauraciones ni actualizar el inventario de activos. Pero setenta y dos horas antes de que llegue el auditor externo se declara estado de sitio: se descargan veinte políticas genéricas de internet —a veces olvidando siquiera borrar el nombre de otra compañía en el pie de página—, se imprimen planillas de control de cambios con fechas retroactivas firmadas de corrido con el mismo bolígrafo azul y se elige cuidadosamente el único servidor prolijo del centro de datos para mostrarlo como muestra representativa.

El viernes por la tarde todos brindan porque aprobaron la revisión sin observaciones mayores. El problema es que el atacante que entra el mes siguiente no lee certificados ISO: lee tus configuraciones reales. Engañar a un auditor superficial es facilísimo; engañar a la realidad operativa cuando se incendia el almacenamiento principal es imposible, y entonces aquel certificado enmarcado solo sirve para agravar la negligencia ante el seguro y el juez.

Alrededor de esta farsa giran otros tres antipatrones clásicos que conviene erradicar:

#### 1. El auditor policía desconectado de la física

Es el profesional de control que jamás administró un servidor ni participó en una migración real, pero reparte informes altisonantes exigiendo controles imposibles o anacrónicos —como obligar a cambiar contraseñas complejas cada treinta días sin segundo factor, provocando que toda la oficina anote `Primavera2026!` en un papel amarillo pegado al monitor—. Cuando el auditor no pisa el barro ni propone alternativas viables, empuja al equipo técnico a inventar atajos clandestinos para poder seguir trabajando.

#### 2. El síndrome de Diógenes con datos personales

Por pereza de diseño o fantasía comercial (*"guardemos todo por si algún día sirve para mercadeo"*), formularios web, sistemas de recursos humanos y bases comerciales acumulan fotografías de documentos de identidad, direcciones particulares, historiales médicos o datos financieros de personas que dejaron de ser clientes hace ocho años. Cada fila innecesaria que conservas sin base legal multiplica por mil el impacto jurídico, reputacional y económico el día que ocurre una filtración.

#### 3. Contratos con proveedores sin cláusula ni plan de salida

En 2022 ya advertía que Control de Riesgos debe vigilar **las salidas de los proveedores**. Sin embargo, casi todos los contratos tecnológicos se firman en plena etapa de enamoramiento comercial: se negocia el descuento de entrada, pero nadie lee qué ocurre cuando el servicio cae tres días seguidos, quién notifica en menos de veinticuatro horas una brecha de seguridad del proveedor o en qué plazo y formato abierto están obligados a entregarte tus propios datos —y destruir su copia— cuando decides rescindir el contrato.

#### Señales de alerta temprana

Tienes un problema serio de gobierno y cumplimiento si reconoces estos síntomas:

- Existen cuentas activas en el correo, el *ERP* o la red pertenecientes a empleados o consultores que dejaron de trabajar en la empresa hace meses.
- Tu plan de recuperación ante desastres (*DRP*) nunca fue ejecutado de principio a fin con reloj en mano durante el último año.
- Nadie en la organización puede listar en diez minutos qué sistemas externos procesan hoy datos personales de tus clientes y empleados.
- Quien configura los accesos administrativos es exactamente la misma persona que aprueba las altas y audita los registros sin intervención de un tercero.
- Tus contratos con proveedores críticos de nube o software se renuevan automáticamente sin revisión anual de riesgos ni plan técnico de salida.

### 7.4. Marco de acción pragmático: marcos abiertos, plataformas libres y tres pruebas semestrales

Implementar *GRC*, auditoría útil y gobierno de privacidad sin sepultar al departamento bajo montañas de papel requiere apoyarse en estándares probados, herramientas abiertas y tres rituales de verificación empírica.

#### Paso 1: Adopta NIST CSF 2.0 e ISO/IEC 27001 sin burocracia sobre software libre

No hace falta inventar una metodología casera ni pagar consultorías eternas para ordenar riesgos. Utiliza la estructura clara de **NIST Cybersecurity Framework 2.0** —cuya función transversal *Govern* (*Gobernar*) conecta directamente con *Identify, Protect, Detect, Respond* y *Recover*— alineada con los controles prácticos del Anexo A de **ISO/IEC 27001**.

En lugar de llevar ese control en cuarenta hojas de cálculo inconexas que quedan obsoletas al mes, centraliza riesgos, políticas, evidencias y evaluaciones de proveedores en plataformas abiertas de *GRC* diseñadas para humanos:

- **CISO Assistant:** Herramienta libre moderna y ágil que trae precargados decenas de marcos internacionales (*ISO 27001, NIST CSF, CIS Controls, RGPD*), permitiendo mapear un solo control técnico real contra múltiples normativas sin duplicar trabajo.
- **Eramba (Community):** Excelente opción madura para llevar de forma estructurada el registro formal de riesgos, excepciones aceptadas por gerencia, revisiones periódicas de accesos y vencimientos de contratos con terceros.

#### Paso 2: Aplica la dieta estricta de datos del DPO

Siéntate con las áreas comerciales, legales y de recursos humanos y levanta el **Registro de Actividades de Tratamiento**: una tabla sencilla que responda para cada base de datos qué información personal guardas, con qué base legal exacta, quién puede verla, dónde reside físicamente y **cuál es su fecha automática de purga o anonimización**. Todo campo sensible que nadie sepa justificar operativamente se elimina del formulario y se borra de forma segura de las bases históricas.

#### Paso 3: Ejecuta sin excusas las tres pruebas de verdad cada seis meses

Reemplaza las auditorías decorativas por tres verificaciones prácticas semestrales cuyos resultados llegan sin filtro al directorio:

| Prueba semestral de campo | Cómo se ejecuta de verdad | Métrica que demuestra control real |
| :--- | :--- | :--- |
| **1. Simulacro cronometrado de *DRP*** | Tomar la copia inmutable de un sistema crítico (*ERP* o facturación) y levantarla operativa en una red aislada con el técnico suplente leyendo el manual. | *RTO* y *RPO* medidos con reloj real frente a lo prometido al negocio (cero suposiciones). |
| **2. Cruce implacable de bajas y privilegios** | Exportar la lista oficial de personal activo en nómina de RR. HH. y cruzarla contra todas las cuentas habilitadas en identidad, correo, *VPN* y *ERP*. | **0 cuentas huérfanas** de exempleados o proveedores inactivos abiertas más de 24 horas tras la baja. |
| **3. Inspección de salida de proveedores** | Elegir los tres proveedores tecnológicos más críticos, verificar su exportación completa de datos y revisar penalidades, jurisdicción y avisos de brecha. | Datos exportables en formatos estándar verificados y plan alternativo de contingencia documentado. |

Cuando *GRC*, el Auditor TI y el *DPO* trabajan sobre evidencias vivas como estas, ocurre un milagro organizacional: los técnicos dejan de ver al auditor como un estorbo burocrático y descubren en él a su mejor aliado institucional para que la gerencia financie las mejoras que *SecOps* e Infraestructura venían pidiendo en soledad.

Y hablando de financiar mejoras y entender números: pasemos al octavo capítulo para transformar uno de los roles más incomprendidos de la edición anterior en el puente económico definitivo del departamento: **Aplicaciones Empresariales (*BRM / ERP*) y *FinOps***.
