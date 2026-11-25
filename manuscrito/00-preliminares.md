---
title: "Fundamentos de TI"
subtitle: "Un recorrido por las excentricidades de un entorno de TI — Segunda Edición (2026)"
author: "Jesús A. Palencia S."
date: "2026"
lang: "es"
rights: "Creative Commons Atribución-CompartirIgual 4.0 Internacional (CC BY-SA 4.0)"
---

# Preliminares

## Créditos y Licencia

**Título:** *Fundamentos de TI: Un recorrido por las excentricidades de un entorno de TI*  
**Autor:** Jesús A. Palencia S.  
**Edición:** Segunda edición, revisada, actualizada y expandida (2026)  
**Primera edición:** Octubre de 2022 (39 páginas)  

![Licencia Creative Commons Atribución-CompartirIgual 4.0 Internacional (CC BY-SA 4.0)](licencia.png)

Esta obra se distribuye bajo la licencia **Creative Commons Atribución-CompartirIgual 4.0 Internacional (CC BY-SA 4.0)**. Eres libre de compartir —copiar y redistribuir el material en cualquier medio o formato— y de adaptar —remezclar, transformar y construir a partir del material para cualquier propósito, incluso comercial—, siempre que reconozcas adecuadamente la autoría original, proporciones un enlace a la licencia, indiques si se han realizado cambios y distribuyas tus contribuciones bajo la misma licencia que el original. Texto legal completo en: https://creativecommons.org/licenses/by-sa/4.0/deed.es

**Arquitectura editorial abierta (*Books as Code*):**  
El código fuente íntegro de esta edición —escrito en Markdown modular, diagramado como código y compilado de forma determinista hacia formato abierto OpenDocument Text (`.odt`) mediante Pandoc en contenedores aislados— está disponible públicamente en:  
https://github.com/sinfallas/libro-ti

**Contacto y apoyo al autor:**  
Correo electrónico y donaciones voluntarias vía PayPal: `sinfallas@gmail.com`

> *Nota sobre marcas y referencias técnicas:* Todos los nombres de productos, estándares, proyectos de software libre o marcas comerciales citados a lo largo de esta obra pertenecen a sus respectivos propietarios y se mencionan con fines estrictamente técnicos, críticos y educativos, sin patrocinio ni afiliación comercial de ningún proveedor.

* * *

## Dedicatoria

Esta obra está dedicada a todas aquellas personas que se encuentran dentro de un departamento de TI y quieren conocer un poco más sobre las excentricidades de nuestro entorno.

A quienes han pasado madrugadas sosteniendo servicios críticos mientras el resto de la organización dormía, a quienes intentan poner orden sin presupuesto ni aplausos, y a quienes todavía defienden que hacer buena ingeniería importa aunque nadie vea los cables.

* * *

## Prefacio a la Segunda Edición (2026)

Mi nombre es **Jesús Palencia**. He sido informático por más tiempo que cualquier otro aspecto de mi vida —estudiante, padre, amigo—; soy informático de profesión y excéntrico por convicción. Paso mis días tratando de entender el mundo a mi alrededor a través de un computador, aunque a veces sospecho que es el computador quien vive a través de mí.

Durante mucho tiempo —más del que me gustaría admitir en voz alta— he visto el ir y venir de tecnologías, metodologías, marcos de trabajo e implementaciones que no solo cambiaron la manera en que las empresas venden sus productos, sino la forma en que se definen a sí mismas. También he visto cómo la industria empujó a las organizaciones, a golpe de obsolescencia programada y mercadeo agresivo, a perseguir siempre el último artilugio de moda. Esa carrera alteró de forma permanente cómo interactúan las personas entre sí y con su puesto de trabajo: desde las primeras políticas improvisadas de *Bring Your Own Device* (*BYOD*, o trae tu propio dispositivo) hasta el trabajo híbrido y remoto que desdibujó por completo las paredes físicas de la oficina.

Cuando publiqué la primera edición de este libro a finales de 2022, mi intención era modesta: condensar en treinta y nueve páginas una guía franca sobre cómo se organiza un departamento de tecnología, qué hace realmente cada perfil y por qué vivimos atrapados en fricciones tan particulares. Creí, con cierta ingenuidad, que bastaba con dejar trazado el mapa básico. Cuatro años después, la trinchera me demostró que aquel boceto se había quedado corto.

### Cuatro años después: cuando se acabó el cheque en blanco

Si has estado sentado en una reunión de presupuesto tecnológico en los últimos años, seguro reconoces la escena porque a mí me ha tocado vivirla con distintos nombres, logos y sillas, pero con el mismo guion exacto.

Llegas a la mesa con datos concretos: conmutadores de red (*switches*) cuyo soporte del fabricante venció hace tres años, un sistema de copias de seguridad que tarda demasiado en restaurar o licencias críticas al límite de su capacidad. Pides una inversión razonable para evitar que la operación se detenga un martes a mitad de facturación. La respuesta del otro lado de la mesa es un gesto grave, una mirada a la planilla financiera y la frase ritual: *"Este trimestre no hay presupuesto; tenemos que hacer más con menos"*.

Hasta ahí nada nuevo. La verdadera excentricidad ocurre cinco minutos después, en esa misma sala y con ese mismo presupuesto supuestamente agotado, cuando alguien de dirección se inclina hacia adelante con brillo en los ojos y pregunta cuánto cuesta contratar de inmediato la moda tecnológica que vio esa mañana en un desayuno ejecutivo o en una revista de negocios. En 2022 la consigna mágica era *"subir absolutamente todo al Cloud antes de fin de año"*; en 2026 es *"ponerle inteligencia artificial a todos los procesos de la empresa para el mes que viene"*. Para sostener los cimientos nunca alcanza el dinero, pero para comprar humo con etiqueta brillante casi siempre aparece una partida extraordinaria.

Entre aquella primera edición y este 2026 confluyeron tres golpes de realidad que obligaron a reescribir y multiplicar esta obra:

1. **Se terminó la luna de miel financiera con la nube pública (*Cloud*):** Durante años se vendió la idea de que alquilar servidores ajenos equivalía automáticamente a modernizarse y ahorrar dinero. Muchas empresas migraron sus problemas tal cual estaban, sin rediseñar nada ni vigilar el consumo, hasta que las facturas mensuales —sumadas a subidas bruscas en licenciamiento de virtualización y suscripciones de software como servicio (*SaaS*)— obligaron a sentar las cuentas sobre la mesa y hablar en serio de disciplina financiera (*FinOps*) e infraestructura híbrida.
2. **Explotó la fiebre de la "IA mágica" sobre bases rotas:** La irrupción de los modelos de lenguaje y los agentes autónomos trajo herramientas extraordinarias, pero también el espejismo corporativo más ruidoso de la década. Pretender que un modelo generativo arregle una organización cuyos datos viven duplicados en hojas de cálculo contradictorias, sin permisos claros ni gobierno documental, no produce transformación digital: solo produce respuestas equivocadas a mayor velocidad y fugas de información confidencial a través del *Shadow AI* (el uso clandestino de herramientas de inteligencia artificial públicas por parte de los empleados).
3. **Las brechas de ciberseguridad dejaron de perdonar la improvisación:** El secuestro de datos (*ransomware*), el robo de credenciales y los ataques a la cadena de suministro dejaron de ser titulares lejanos reservados a multinacionales. Hoy golpean por igual a una clínica mediana, a una distribuidora regional o a un despacho contable. Seguir tratando la seguridad operativa como una tarea secundaria del administrador de redes, o confundir seguridad con llenar carpetas para aprobar una auditoría en papel, se volvió una receta directa para el desastre.

### Qué cambia en esta edición (y qué me niego a cambiar)

Al revisar con ojo crítico el texto original de 2022 encontré dos libros distintos conviviendo bajo la misma portada. La primera mitad hablaba con mi propia voz: señalaba el choque de idiomas entre el negocio y TI, denunciaba la informalidad y el *"amiguismo"* que nacen cuando no existen acuerdos de nivel de servicio (*Service Level Agreements* o SLAs), y desmontaba el mito gerencial de que todos los informáticos servimos indistintamente para diseñar arquitectura, auditar riesgos, cablear un piso o reparar una impresora. En cambio, el capítulo final sobre metodologías modernas cayó en la trampa de sonar demasiado académico, casi como una enciclopedia correcta pero distante de los golpes cotidianos.

En esta Segunda Edición corregí esa deuda de raíz. Aquí no vas a encontrar definiciones copiadas de un manual universitario ni promesas recicladas del folleto comercial de ningún fabricante. Cada capítulo de este libro somete los conceptos al mismo filtro de cuatro preguntas prácticas: qué problema real resuelve el área o metodología cuando le quitas el mercadeo; cómo luce la diferencia entre lo que hacen las gigantes tecnológicas con miles de ingenieros y lo que podemos hacer en empresas medianas o PyMEs donde tres personas sostienen ocho frentes; cuáles son las excentricidades y errores humanos que sabotean el intento; y con qué métricas, estándares abiertos y pasos concretos puedes poner orden mañana por la mañana sin paralizar la empresa.

También actualicé la anatomía completa del departamento de TI. Separé de forma tajante la **Ciberseguridad Operativa** de las funciones de **Riesgos, Cumplimiento y Auditoría**, porque nadie puede auditar con honestidad la misma trinchera que configura todos los días. Replanteé la gestión de aplicaciones empresariales integrando transparencia financiera, llevé el centro de soporte hacia un **ITIL 4 pragmático**, dediqué capítulos profundos e independientes a **DevOps y Platform Engineering**, **DevSecOps**, **LLMOps e IA Agéntica** y **SRE con Observabilidad moderna**, e incorporé una cuarta parte entera con crónicas de incidentes, cultura de análisis post-incidente sin culpa (*blameless post-mortems*), defensa de presupuestos ante directivas escépticas y listas de diagnóstico rápido.

Lo único que me negué a cambiar es el espíritu libre de la obra y la premisa con la que cerré la edición anterior: ninguna estructura descrita en estas páginas debe aplicarse como dogma ciego. Las empresas fracasan tanto por negarse a cambiar su caos histórico como por copiar sin criterio el organigrama de moda de una corporación que factura diez mil veces más.

### Brújula de lectura según tu silla en la organización

Aunque este libro sigue un orden progresivo —desde la cultura y las fricciones del entorno hasta la operación avanzada y la supervivencia directiva—, no todo el mundo llega a él con la misma urgencia. Según el lugar que ocupes hoy, esta es la ruta más directa para sacarle provecho:

| Si hoy ocupas este rol | Tu fricción más probable | Por dónde atacar primero |
| :--- | :--- | :--- |
| **Técnico, administrador o ingeniero en la trinchera** | Apagas incendios todo el día, te piden tareas fuera de tu parcela y sientes que la urgencia impide automatizar o documentar nada. | **Parte I** (Caps. 1–3) para ponerle nombre al caos, **Parte II** según tu especialidad técnica y **Parte III** (Caps. 14–17) para aterrizar automatización, seguridad y observabilidad reales. |
| **CIO, líder de área, CISO o coordinador de TI** | Vives atrapado traduciendo problemas técnicos a un directorio impaciente mientras intentas cubrir ocho dominios con un equipo reducido. | **Parte II** completa (Caps. 5–13) para delimitar responsabilidades sin *bus factor* suicida, y **Parte IV** (Caps. 18–20) para defender presupuestos con números y auditar tus primeros 90 días. |
| **Gerente general, finanzas, compras o auditor no técnico** | Percibes a TI como una caja negra costosa, lenta y llena de siglas incomprensibles donde cada cambio parece complicarlo todo. | **Parte I** (Caps. 1, 2 y 4), **Capítulos 7, 8 y 9** (riesgos, dinero y niveles de servicio) y **Capítulo 19** para entender cuánto cuesta realmente no invertir a tiempo en continuidad. |

Si al pasar estas páginas sueltas alguna sonrisa irónica porque sientes que estuve espiando las reuniones de tu oficina, quédate tranquilo: no hace falta trabajar en el mismo edificio. La tecnología cambia de siglas cada cinco años, pero nuestras excentricidades humanas siguen siendo sorprendentemente parecidas en cualquier latitud. Pasemos a examinarlas de frente.
