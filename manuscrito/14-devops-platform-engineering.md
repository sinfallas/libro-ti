# Parte III — Metodologías Operativas Modernas

## Capítulo 14. DevOps y Platform Engineering: Del eslogan a la ingeniería de entrega

Entramos en la tercera parte de esta obra con una cuenta personal que prometí saldar en el prefacio. En la edición de 2022 agrupé *DevOps*, *DevSecOps*, *MLOps* y *SRE* dentro de un único capítulo final que explicaba con corrección sus definiciones y ventajas, pero dejaba afuera el olor a pólvora de lo que ocurre cuando intentas aplicar esas ideas un lunes real con gente real.

Empecemos por la madre de todas las confusiones laborales de los últimos diez años: **DevOps**.

Pocas palabras nacieron con un propósito tan sensato y terminaron tan desfiguradas por los departamentos de recursos humanos y los vendedores de herramientas. Lo que surgió como un pacto cultural y técnico para terminar con la vieja guerra de trincheras entre quienes escriben software (*Dev*) y quienes lo mantienen vivo (*Ops*) degeneró rápidamente en ofertas de empleo surrealistas, terceros silos burocráticos y toneladas de archivos de configuración rotos. Poner esta disciplina otra vez sobre sus pies —y entender qué debemos tomar y qué debemos descartar de su evolución reciente hacia **Platform Engineering**— es el primer paso para entregar software sin romper la empresa en cada intento.

### 14.1. El concepto sin humo: cultura de entrega, no un cargo milagroso

Volvamos a la raíz limpia que sintetiza el acrónimo **CAMS** (*Culture, Automation, Measurement, Sharing*: Cultura, Automatización, Medición y Uso compartido).

Antes de *DevOps*, la dinámica habitual en casi toda organización funcionaba como un lanzamiento de granada por encima de un muro ciego:

- **Desarrollo** era medido por cuántas funciones nuevas entregaba antes del viernes. Cuanto más rápido cambiaba las cosas, mejor lucía.
- **Operaciones** era medido por que nada se cayera jamás. Cuanto menos cambiaban las cosas, más tranquilo dormía.

Tenías a dos áreas de la misma compañía con incentivos exactamente opuestos. Desarrollo compilaba un paquete en su computadora personal, lo tiraba por correo un viernes a la tarde diciendo *"en mi máquina funciona"* y se iba a su casa; Operaciones intentaba instalarlo a ciegas, veía estallar dependencias ausentes y devolvía el paquete el martes con furia.

**DevOps nunca fue un cargo individual ni una herramienta específica:** es el acuerdo de ingeniería por el cual ambos lados comparten la responsabilidad de que un cambio llegue desde el repositorio de código hasta el usuario final **de forma automática, repetible, verificada y reversible**, sin pasos artesanales ocultos en el medio.

¿Y de dónde salió en los últimos años el término **Platform Engineering** (*Ingeniería de Plataforma*)? Nació como respuesta al péndulo extremo del eslogan *"tú lo construyes, tú lo corres"* (*You build it, you run it*). Algunas empresas interpretaron ese lema de manera literal y pretendieron que cada programador de pantallas web se convirtiera también en experto en ruteo de redes, políticas de cortafuegos, almacenamiento, certificados y aprovisionamiento de servidores. El resultado predecible fue parálisis cognitiva, configuraciones inseguras y recursos duplicados por todos lados.

La ingeniería de plataforma madura reconoce una verdad que en este libro venimos defendiendo desde la primera parte: **las especialidades existen por algo**. Consiste en que el equipo de Infraestructura construya y gobierne cimientos estandarizados y repetibles para que los equipos de desarrollo desplieguen código limpio encima sin tener que reinventar los tornillos del servidor ni romper el gobierno del departamento.

### 14.2. La teoría vs. la trinchera: portales de fantasía frente al aprovisionamiento gobernado

Si lees artículos escritos desde gigantes tecnológicos con dos mil desarrolladores, te dirán que hacer *Platform Engineering* exige pasar un año entero construyendo un portal interno de autoservicio (*Internal Developer Platform* o *IDP*) donde cualquier programador hace clic en un botón y crea por su cuenta bases de datos, colas de mensajes y máquinas virtuales nuevas en tres minutos.

Detente a pensar cinco segundos qué ocurre si habilitas ese autoservicio irrestricto en una empresa mediana o PyME real con seis u ocho desarrolladores y presupuesto contado: en dos meses tendrás catorce bases de datos huérfanas sin respaldo, tres entornos olvidados facturando las veinticuatro horas, reglas de red inconsistentes y a *FinOps* y *SecOps* al borde del colapso nervioso.

En la trinchera real rige un equilibrio mucho más sano, alineado con el principio de **parcelas claras y trazabilidad absoluta** que establecimos en los Capítulos 1, 8 y 13:

- **El despliegue de código de aplicación es 100 % automático** a través de canalizaciones (*pipelines*) limpias cada vez que un cambio supera pruebas y revisión.
- **Pero la creación o modificación de infraestructura permanece estrictamente centralizada mediante tickets formales hacia el área de Infraestructura.** La diferencia moderna es que Infraestructura ya no resuelve ese ticket haciendo clics manuales durante dos días: lo resuelve ejecutando sus propias recetas de **Infraestructura como Código (*Infrastructure as Code* o *IaC*)** versionadas en Git.

Observa cómo contrastan la caricatura del mercado, el exceso corporativo y el modelo gobernado que sí funciona en organizaciones reales:

| Dimensión de entrega | Falso DevOps / Descontrol | Modelo Gobernado en Trinchera (2026) |
| :--- | :--- | :--- |
| **Alta de nueva infraestructura** | O tarda 3 semanas a mano, o cada programador crea recursos sueltos sin control. | **Ticket formal obligatorio hacia Infraestructura**, resuelto en minutos ejecutando *IaC* estandarizado. |
| **Configuración de entornos** | Desarrollo, pruebas y producción configurados a mano con versiones distintas. | Entornos definidos declarativamente en Git; cero diferencias ocultas entre prueba y producción. |
| **Despliegue de aplicaciones** | Copiar archivos por *FTP/SCP* a medianoche cruzando los dedos. | *Pipeline* automático de integración y entrega continua (*CI/CD*) con vuelta atrás en un comando. |
| **Cambios urgentes en vivo** | Entrar por *SSH* al servidor productivo y editar archivos a mano sin avisar. | Prohibido tocar producción a mano: todo ajuste entra por Git y se despliega por el conducto único. |

Mira cómo fluye el trabajo sin roces ni pérdidas de gobierno cuando separas el aprovisionamiento controlado por Infraestructura de la entrega continua de aplicaciones:

![Del caos en YAML y toques por SSH hacia ingeniería de entrega gobernada con IaC](14-flujo-gitops-idp.png){ width=92% }

### 14.3. Excentricidades y antipatrones: contratar a "un chico DevOps", la deriva por SSH y el pipeline eterno

Pocas áreas han generado tanto humor involuntario en el mercado laboral como las búsquedas de personal vinculadas a este capítulo.

#### 1. El mito de contratar a "un chico DevOps" para arreglar una guerra cultural

Todos hemos leído ese aviso clasificado digno de ciencia ficción: una empresa busca contratar a **una sola persona** —preferiblemente con sueldo semisenior— que domine a fondo Linux, Windows, redes BGP, tres nubes públicas distintas, *Kubernetes*, *Terraform*, *Ansible*, *Jenkins*, *Python*, *Go*, bases de datos relacionales, seguridad perimetral y, ya que estamos, que *"implante la cultura DevOps en toda la compañía"*.

Cuando ese pobre valiente acepta el puesto, descubre a la segunda semana cuál era la trampa real: Desarrollo sigue escribiendo código sin pruebas y tirándolo sin documentar, Operaciones sigue atrincherado negándose a cambiar sus rituales, y a él lo sentaron como amortiguador humano en el medio para mantener con cinta adhesiva quinientas líneas frágiles de configuración en un servidor viejo de *Jenkins* al que todos culpan cuando algo no sale.

Peor todavía es su variante corporativa: crear un **"Departamento de DevOps"** separado de Desarrollo y separado de Infraestructura. En lugar de derribar el muro entre dos silos, la empresa acaba de construir con orgullo **un tercer silo en el medio**, obligando ahora a abrir tres reuniones donde antes bastaba una.

#### 2. La traición nocturna por SSH (*configuration drift*)

El equipo invierte meses definiendo limpiamente sus servidores y reglas en herramientas de *Infraestructura como Código*. Todo está versionado en Git. Hasta que un miércoles a las diez de la noche hay una urgencia: alguien con permisos altos entra directo por consola *SSH* al servidor de producción, cambia un parámetro de memoria, abre un puerto a mano y se va a dormir sin tocar jamás el repositorio.

A eso lo llamamos **deriva de configuración (*configuration drift*)**, y es una bomba con mecha retardada. Durante dos semanas todo parece normal, hasta que otro compañero ejecuta de buena fe la receta oficial guardada en Git para agregar un disco menor: la herramienta detecta que el servidor real no coincide con el código declarado, pisa sin piedad el arreglo manual nocturno y tumba el servicio en pleno mediodía sin que nadie entienda por qué.

#### 3. El *pipeline* tortuga de cincuenta minutos lleno de pruebas falsas (*flaky tests*)

Automatizar mal es peor que no automatizar. Hay equipos que acumulan tuberías de integración continua tan lentas y mal diseñadas que cada pequeño cambio de dos líneas tarda cincuenta minutos en compilar y, encima, falla la mitad de las veces por pruebas inestables (*flaky tests*) que pasan cuando le das al botón *"Reintentar"*.

Cuando el camino oficial tarda casi una hora y miente, entrenas al equipo en el peor reflejo posible: ignorar las luces rojas, desactivar validaciones *"solo por hoy"* o pedir despliegues manuales de emergencia que saltean todos los controles.

#### Señales de alerta temprana

Tu práctica de entrega está enferma si reconoces cualquiera de estos síntomas:

- Desplegar una versión nueva exige una "noche de brujas" con cuatro personas conectadas por videollamada siguiendo un documento Word de veintidós pasos manuales.
- Nadie se anima a ejecutar la herramienta de *IaC* en producción por miedo a qué cambios hechos a mano podría sobrescribir.
- Tienes un único especialista que entiende cómo funciona el *pipeline* de compilación y, cuando falta, nadie puede sacar una corrección urgente.
- El entorno de preproducción difiere tanto del entorno real que aprobar pruebas allí no garantiza absolutamente nada al subir a producción.
- El indicador de éxito que presume el área es *"hacemos treinta despliegues por semana"*, ocultando que diez de ellos fueron parches desesperados para arreglar lo que rompieron los otros veinte.

### 14.4. Marco de acción pragmático: ticket hacia IaC, pipelines de diez minutos y métricas DORA sin vanidad

Implantar una ingeniería de entrega sólida, gobernable y sin humo comercial en 2026 se apoya en cuatro reglas operativas directas.

#### Paso 1: Centraliza el aprovisionamiento por ticket, ejecútalo 100 % con IaC y cierra el SSH

Mantén la frontera sana de gobierno: cuando un proyecto o equipo necesita un nuevo servidor, base de datos, cubo de almacenamiento o cambio de red, **abre el ticket formal correspondiente hacia Infraestructura** (validando capacidad, *FinOps* y seguridad como ya vimos).

Puertas adentro, Infraestructura atiende ese requerimiento modificando archivos declarativos en Git mediante **OpenTofu** (la bifurcación abierta y comunitaria de *Terraform* bajo la Fundación Linux) para crear los recursos base y **Ansible** para configurar el sistema operativo y sus servicios. Una vez adoptado este flujo, **revoca el acceso interactivo cotidiano por SSH a los servidores productivos**: salvo modo de rescate auditado ante catástrofe mayor, ningún humano edita un servidor vivo a mano. Si no está en Git, no existe.

#### Paso 2: Construye pipelines limpios, reproducibles y menores de diez minutos

Estandariza la compilación, empaquetado y entrega de tus aplicaciones sobre motores claros y auditables como **GitLab CI**, **Woodpecker CI** (ligero, nativo en contenedores y excelente junto a *Gitea / Forgejo*) o **GitHub Actions**. Para que el equipo confíe en su tubería y jamás intente puentearla, cumple tres mandamientos técnicos:

1. **Todo corre dentro de contenedores efímeros fijados por versión:** Se acaba para siempre el *"en la máquina de compilación faltaba una librería"*.
2. **Tiempo total menor a 10 minutos:** Usa caché inteligente de dependencias y paraleliza pruebas; si supera diez minutos, optimizar el *pipeline* pasa a ser deuda prioritaria.
3. **Tolerancia cero con pruebas intermitentes (*flaky tests*):** Una prueba que falla al azar sin cambio de código se corrige en cuarenta y ocho horas o se reescribe; jamás se normaliza darle tres veces al botón de reintento.
4. **Reversión (*rollback*) probada en menos de dos minutos:** Todo artefacto desplegado es una imagen inmutable etiquetada con el identificador exacto del *commit*; si la versión nueva degrada el servicio, volver a la imagen anterior tarda un solo comando automático.

#### Paso 3: Mide la realidad con las 4 métricas DORA (priorizando estabilidad)

Olvida las métricas de vanidad como contar líneas de código o cantidad de *commits*. El programa de investigación **DORA** (*DevOps Research and Assessment*) demostró durante una década que el desempeño real de entrega de cualquier organización se resume en cuatro indicadores que se equilibran entre sí —dos de velocidad y dos de estabilidad—:

| Métrica DORA | Qué mide exactamente | Cómo interpretarla sin autoengaño en trinchera |
| :--- | :--- | :--- |
| **1. Tiempo de entrega de cambios (*Lead Time*)** | Cuánto tarda un *commit* aprobado en llegar corriendo a producción. | Mide fricción real del proceso; bajarlo de semanas a horas elimina entregas gigantes y riesgosas. |
| **2. Frecuencia de despliegue** | Con qué regularidad entregas cambios pequeños y controlados. | No compitas por desplegar cada cinco minutos si tu negocio no lo pide; apunta a poder desplegar cualquier día hábil **sin miedo ni horas extra**. |
| **3. Tasa de fallos por cambio (*Change Failure Rate*)** | Qué porcentaje de despliegues causa incidente, degradación o marcha atrás. | **Tu brújula principal de calidad:** mantenla por debajo del **5 %–10 %**. Velocidad con fallos altos es simple negligencia acelerada. |
| **4. Tiempo medio de recuperación (*MTTR*)** | Cuánto tardas en restaurar el servicio cuando un cambio sale mal. | Con artefactos inmutables y reversión inmediata, debe medirse en **minutos**, nunca en jornadas enteras. |

Cuando los cambios son pequeños, viajan por un carril único automatizado y la infraestructura subyacente nace de código gobernado por especialistas bajo pedido trazable, desaparecen las madrugadas de pánico pegando archivos a mano.

Pero ese carril rápido tiene una implicación obvia: si tu tubería despliega en ocho minutos, también puede desplegar una vulnerabilidad crítica o una clave expuesta en ocho minutos. Cómo blindar cada eslabón de esa cadena sin volver a frenar las entregas es la misión exacta del próximo capítulo: **DevSecOps en la práctica**.
