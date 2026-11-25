# Parte II — Anatomía, Gobierno y Liderazgo de un Departamento de TI

## Capítulo 5. Anatomía real de un Departamento de TI: 8 dominios, CIO y Two-Pizza Teams

En la primera edición sostuve una idea que incomoda por igual a los fanáticos de la burocracia y a los amantes del caos creativo: **no existe el organigrama perfecto ni eterno para un departamento de TI**. Una estructura organizacional jamás es un fin en sí misma; es apenas el medio —tan plano, fluido y transparente como sea posible— para que la tecnología responda a lo que el negocio necesita sin devorar la salud mental de quienes trabajan adentro.

Cuando una empresa esconde su estructura técnica o deja las responsabilidades en una nebulosa verbal, ocurren dos desastres simultáneos: hacia afuera, el resto de los departamentos dispara pedidos al azar contra el primer informático que cruza el pasillo; hacia adentro, algunas tareas críticas quedan en tierra de nadie mientras tres personas chocan tocando el mismo servidor sin avisarse.

Abrir esta segunda parte exige dibujar el mapa completo de un departamento moderno en 2026 antes de recorrer, uno por uno, cada uno de sus liderazgos en los capítulos siguientes. Veremos qué cambió respecto a las siete áreas clásicas de 2022, cuál es el verdadero oficio de quien dirige todo el conjunto y cómo aterrizar este diseño cuando no trabajas en una multinacional de diez mil empleados, sino en una empresa real donde tres o cinco personas sostienen el edificio entero.

### 5.1. El concepto sin humo: una estructura es un medio, nunca un monumento

Diseñar la anatomía de TI consiste en responder con honestidad brutal tres preguntas que ningún software resuelve por ti: **quién decide**, **quién ejecuta** y **quién verifica**.

Para que esas tres funciones convivan sin estorbarse, el departamento necesita una cabeza integradora clara: el **Director de Sistemas o *Chief Information Officer* (*CIO*)**. Pocas figuras sufren tantos errores de puntería al momento de ser nombradas por la gerencia general. En la práctica, las empresas suelen tropezar con dos caricaturas opuestas:

1. **El supertécnico ascendido por antigüedad (y arruinado en el intento):** La directiva toma al mejor administrador de servidores o al programador más veterano y lo convierte en jefe sin darle formación ni autoridad presupuestaria. Como esa persona se siente cómoda con las máquinas e incómoda negociando contratos o poniendo límites políticos, sigue entrando por consola a reiniciar servicios al mediodía mientras el presupuesto, los proveedores y la planificación naufragan. La empresa pierde un ingeniero extraordinario y gana un director ausente.
2. **El gerente puramente político sin cicatrices técnicas:** El extremo contrario consiste en contratar a un perfil administrativo impecable haciendo presentaciones, pero incapaz de distinguir una base de datos transaccional de una planilla de cálculo. Como no entiende la física de lo que dirige, traga entero el humo de cualquier vendedor externo y acepta fechas imposibles que luego exprime a latigazos sobre su equipo.

El verdadero *CIO* —llámese director, gerente o jefe de tecnología según el tamaño de la firma— es un **director de orquesta con callos técnicos reales, pero con las manos fuera del teclado operativo diario**. Necesita haber vivido suficientes caídas, migraciones y auditorías para detectar una mentira técnica a diez metros de distancia, pero su trabajo cotidiano ya no es configurar cortafuegos: es garantizar que cada área de negocio tenga cobertura funcional, blindar los recursos de su gente, eliminar puntos únicos de fallo y **diseñar la estructura pensando en dónde estará la empresa dentro de los próximos tres años**, no en el incendio de esta tarde.

### 5.2. La teoría vs. la trinchera: de las 7 áreas clásicas a los 8 dominios modernos (y cómo caben en una PyME)

En 2022 describí las siete áreas clásicas en las que coincidían las grandes organizaciones para ordenar tecnología: Comunicaciones; Gestión, Planificación y Estrategia; Control de Riesgos; Negocio y Aplicaciones Empresariales; Centro de Atención al Usuario; Sistemas e Infraestructuras; y Desarrollo y Nuevas Tecnologías.

Cuatro años de incidentes reales de ciberseguridad, explosión regulatoria y madurez financiera obligan a dar un paso evolutivo indispensable en 2026: **pasar de siete áreas a ocho dominios explícitos**, separando de raíz la defensa técnica diaria de la auditoría y el control de riesgos:

1. **Ciberseguridad Operativa (*CISO / SecOps*):** Defensa activa, endurecimiento de sistemas (*hardening*), arquitectura de confianza cero (*Zero Trust*), gestión de vulnerabilidades y respuesta a incidentes en tiempo real (Capítulo 6).
2. **Riesgos, Cumplimiento, Privacidad y Auditoría (*GRC / Auditor TI / DPO*):** Evaluación independiente de riesgos, continuidad de negocio, cumplimiento normativo, protección de datos personales y auditoría interna sin tocar teclados productivos (Capítulo 7).
3. **Aplicaciones Empresariales (*BRM / ERP*) y *FinOps*:** Puente funcional con los procesos del negocio (*ERP, CRM, BI, HCM*, nómina) unido a la transparencia financiera de cada dólar invertido en licencias y nube (Capítulo 8).
4. ***Service Desk* y Gestión de Servicios (*ITIL 4* pragmático):** Puerta única de atención, catálogo de servicios vivo y acuerdos de nivel de servicio reales contra el *amiguismo* (Capítulo 9).
5. **Redes y Comunicaciones:** Conectividad interna y externa, segmentación, enlaces redundantes y gobierno de telecomunicaciones sin cargar con el formateo de computadoras (Capítulo 10).
6. **Sistemas e Infraestructura Híbrida:** Cómputo, virtualización local, almacenamiento, nube pública y repatriación sensata de cargas estables (Capítulo 11).
7. **Gestión de Proyectos y Estrategia de Servicios:** Coordinación transversal para que las iniciativas cierren en alcance, costo y fecha operativa real (Capítulo 12).
8. **Arquitectura de Software y Desarrollo:** Diseño evolutivo, integración limpia entre sistemas, estándares técnicos y gobierno del desarrollo propio (Capítulo 13).

En corporaciones enormes, cada uno de estos dominios se organiza internamente aplicando la célebre regla popularizada por Jeff Bezos en Amazon: los ***Two-Pizza Teams*** (equipos autónomos nunca más grandes de lo que puedan alimentar dos pizzas, es decir, entre seis y diez personas), complementados por consultores funcionales asignados a cada unidad del negocio y respaldados por lo que en la primera edición llamé una **bolsa de técnicos**: especialistas transversales capaces de cubrir vacaciones, bajas médicas o renuncias sin que ningún servicio quede huérfano.

*"Suena hermoso, Jesús, pero en mi empresa somos cuatro gatos en TI contando al pasante"*, estarás pensando con toda razón si trabajas en una PyME o empresa mediana hispanoamericana.

Aquí está la clave que casi ningún libro gerencial explica: **cuando tienes cuatro personas en nómina no tienes menos dominios que atender; tienes exactamente los mismos ocho dominios agrupados bajo menos sombreros**. Que no puedas pagar ocho jefes distintos jamás significa que puedas dejar la seguridad, los respaldos o la auditoría sin dueño. Significa que una misma persona portará dos o tres sombreros compatibles, respetando a rajatabla la frontera entre operar y controlar:

![Los 8 dominios modernos de TI y su segregación frente al control independiente](05-organigrama-8-dominios-y-pyme.png){ width=92% }

Compara cómo se traduce esa anatomía entre una corporación con presupuesto holgado y una empresa mediana o PyME bien gobernada:

| Principio estructural | Escala Corporativa / Gran Empresa | Adaptación sana en PyME / Mediana (3 a 10 personas) |
| :--- | :--- | :--- |
| **Cobertura de los 8 dominios** | Un líder dedicado con células *Two-Pizza* propias por cada especialidad. | Sombreros afines agrupados por escrito en pocas cabezas; ningún dominio queda huérfano. |
| **Separación Seguridad vs. Auditoría** | Dirección de *SecOps* separada del comité de *GRC* y Auditoría Interna. | Quien administra infraestructura/seguridad **nunca** se autoaudita: revisa un par cruzado o auditor externo trimestral. |
| **Continuidad humana (*Bolsa técnica*)** | Equipos completos con rotación de guardia y especialistas redundantes. | Parejas titular/suplente documentadas para que nadie sea indispensable al tomar vacaciones. |
| **Atención N1 vs. Ingeniería** | *Service Desk* dedicado que filtra el 75 % del ruido antes de escalar. | Turno rotativo de escudo diario (*pararrayos* con ticket) para que el resto avance sin interrupciones. |

### 5.3. Excentricidades y antipatrones: el héroe irreemplazable, el feudo secreto y la autoauditoría

Los peores desastres organizacionales dentro de TI rara vez provienen de la falta de dinero; provienen de vicios humanos tolerados durante años hasta que se vuelven parte del paisaje.

#### 1. El síndrome del "héroe irreemplazable" (*bus factor = 1*)

En jerga de ingeniería llamamos *bus factor* (*factor autobús*) al número mínimo de integrantes que tendrían que ser atropellados por un autobús —o, menos trágicamente, ganar la lotería o aceptar una oferta laboral de la competencia— para que el departamento quede completamente paralizado. En una cantidad escalofriante de empresas ese número es exactamente **uno**.

Todos hemos conocido a ese personaje. Lleva diez años en la compañía, conoce de memoria qué cable gris sin etiqueta alimenta la planta baja, guarda las contraseñas maestras en una base personal que solo él abre y resuelve emergencias en diez minutos tocando tres archivos oscuros que nadie más entiende. La gerencia lo aplaude porque *"siempre nos salva sobre la hora"*, y él alimenta en secreto ese caos —a veces por inseguridad laboral, creyendo que si documenta lo despedirán; otras por adicción al aplauso de bombero—.

Mira el precio real de ese falso heroísmo: es el pobre diablo al que llaman por teléfono en pleno cumpleaños de su hija, en la cama de una clínica o sentado en una playa en sus primeras vacaciones en tres años porque un servicio no levanta y nadie más sabe entrar. Y el día que finalmente se harta y renuncia, la empresa descubre en pánico que no tenía un departamento de sistemas: tenía la infraestructura entera alquilada dentro del cráneo de un solo individuo. **Un profesional senior de verdad no se mide por cuántos incendios solo él sabe apagar, sino por cuántos días seguidos puede apagar su teléfono sin que nadie note su ausencia.**

#### 2. El organigrama secreto y el jefe cuello de botella

Es la patología del microgerente inseguro que prohíbe a sus técnicos hablar directamente con otras áreas, oculta quién es responsable de cada plataforma y exige aprobar personalmente desde la compra de un ratón hasta la creación de una cuenta de correo. Cree que centralizar le da poder; en la práctica convierte a todo el departamento en una fila lenta frente a su escritorio y destruye cualquier iniciativa técnica de su equipo.

#### 3. La falsa horizontalidad donde "todos tocan todo"

En el extremo opuesto está la anarquía disfrazada de cultura moderna: *"Aquí no creemos en cargos ni parcelas; todos hacemos de todo"*. Cuando tres técnicos tienen permisos de superusuario sobre todos los equipos sin dueño nominal asignado, ocurre siempre lo mismo: la tarea aburrida pero vital —verificar copias de seguridad, renovar certificados digitales, revisar registros de seguridad— no la hace nadie porque cada uno asumió que la haría el otro, mientras en producción aparecen cambios misteriosos de los que nadie se hace cargo.

#### 4. El absurdo de auditar tu propia tarea

En 2022 todavía era común ver en empresas medianas que la misma persona encargada de configurar servidores, respaldos y cortafuegos fuera quien llenaba la planilla de control de riesgos certificando ante la dirección que *"todo cumple las normas al cien por ciento"*. Pedirle al cocinero que sea el inspector bromatológico de su propia cocina no produce seguridad: produce informes autocomplacientes donde los errores se esconden debajo de la alfombra por conflicto directo de interés.

#### Señales de alerta temprana

Tu estructura interna pide rediseño urgente si identificas cualquiera de estos focos rojos:

- Alguien del equipo acumula dos o más años sin poder tomar diez días hábiles seguidos de vacaciones reales sin computadora ni llamadas.
- Si hoy preguntas al gerente de ventas o de finanzas a quién debe acudir para un proyecto nuevo frente a una falla diaria, no sabe distinguir la diferencia.
- Existen credenciales administrativas críticas que conoce una sola persona en toda la nómina.
- Quien ejecuta las copias de seguridad y administra los permisos es la misma única persona que certifica su validez sin revisión independiente.
- Crecer en ventas o sucursales exige contratar gente a ciegas porque no existe ningún mapa proyectado para los próximos treinta y seis meses.

### 5.4. Marco de acción pragmático: evolución de 3 a 30+ personas, RACI pública y prueba de vacaciones

Ordenar la anatomía de tu departamento no requiere despedir a nadie ni inventar veinte gerencias rimbombantes. Requiere asignar dueños explícitos a las ocho funciones, blindar el conocimiento colectivo y planificar cómo se desdoblarán los sombreros a medida que la organización crezca.

#### Paso 1: Reparte los 8 dominios según tu tamaño real (con horizonte a 3 años)

Usa esta guía práctica para asignar sombreros hoy y proyectar qué rol deberás independizar primero cuando el negocio crezca en los próximos tres años:

| Escala de plantilla TI | Cómo agrupar los 8 dominios sin conflictos | Regla crítica de control e independencia |
| :--- | :--- | :--- |
| **PyME / Equipo compacto (3 personas)** | **Perfil A (Líder/CIO manos a la obra):** Aplicaciones (*BRM/ERP*), *FinOps* y Proyectos.<br/>**Perfil B:** Redes, Sistemas/Infraestructura y *SecOps* base.<br/>**Perfil C:** *Service Desk* (N1/N2) y Desarrollo/Automatización menor + suplencia cruzada B/C. | Ninguno se autoaudita: el rol de **GRC / Auditoría** se cubre con revisión cruzada mensual contra evidencias + auditoría externa semestral y asesoría legal *DPO*. |
| **Empresa mediana (8 a 12 personas)** | **CIO** dedicado + **4 células focalizadas:**<br/>1) Infraestructura y Redes.<br/>2) *SecOps* dedicado.<br/>3) *Service Desk* (2–3 técnicos).<br/>4) Aplicaciones/*ERP* + Arquitectura/Desarrollo. | **Auditor TI / GRC** reporta funcionalmente a Dirección General o Comité de Riesgos, separado jerárquicamente de quien opera servidores. |
| **Escala avanzada (30+ personas)** | Los **8 dominios completos** con líderes propios y células autónomas ***Two-Pizza Teams*** (6–8 personas) apoyadas por la **bolsa de técnicos** transversal. | Segregación total de funciones (*SoD*), catálogo interno formalizado y carrera técnica separada de la carrera gerencial. |

#### Paso 2: Publica una matriz RACI de una página para toda la empresa

Toma los ocho dominios (y tus diez procesos más frecuentes: alta de empleado, compra de software, paso a producción, incidente grave, restauración de respaldo) y define cuatro letras simples sin caer en parálisis burocrática:

- **R (*Responsible* / Ejecutor):** Quién mete las manos para hacer la tarea (pueden ser uno o dos: titular y suplente).
- **A (*Accountable* / Dueño final):** La **única** persona que responde ante el negocio por que eso funcione. Si hay dos letras *A* en la misma fila, en realidad no hay ningún responsable.
- **C (*Consulted* / Consultado):** A quién es obligatorio preguntar *antes* de decidir (por ejemplo, consultar a *SecOps* antes de abrir un servicio a internet).
- **I (*Informed* / Informado):** Quién recibe aviso automático *después* de ejecutado el cambio.

Publica esa tabla en la portada de tu intranet. La transparencia mata en una sola tarde la mitad de los roces políticos del departamento.

#### Paso 3: Institucionaliza la "bolsa de técnicos" y ejecuta la prueba de las vacaciones

Para erradicar el *bus factor = 1* sin discursos vacíos, implanta tres herramientas y un ritual obligatorio este mismo trimestre:

1. **Bóveda corporativa de secretos basada en roles:** Despliega **Vaultwarden** (implementación ligera compatible con clientes *Bitwarden*) o **Passbolt** autoalojado. Prohibido guardar una sola clave productiva en navegadores personales o archivos locales; cada credencial pertenece al rol y queda auditado quién la abrió y cuándo.
2. **Documentación viva como condición de cierre:** Levanta una wiki limpia y rápida con **BookStack** u **Outline**. Ningún ticket de cambio ni proyecto se da por terminado si su guía operativa de emergencia (*runbook* de dos páginas: qué hace el servicio, dónde corre, cómo se reinicia y cómo se restaura) no fue probada leyendo el documento por el compañero suplente.
3. **La prueba de fuego de las vacaciones desconectadas:** Al menos una vez al año, cada integrante clave —empezando por el líder más veterano— sale diez días hábiles con sus accesos suspendidos temporalmente y prohibición estricta de llamarlo. El suplente de la bolsa técnica asume la parcela. Todo tropiezo que ocurra esos diez días se anota sin culpas y se corrige al volver. Si supera la prueba, acabas de construir un departamento de ingeniería real en lugar de un castillo de naipes atado a una persona.

Con el mapa completo desplegado sobre la mesa, entremos de lleno en la primera y más urgente de las ocho trincheras especializadas de 2026: la **Ciberseguridad Operativa**, allí donde el discurso termina y empiezan los ataques reales.
