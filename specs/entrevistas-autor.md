# Registro de Micro-Entrevistas y Anécdotas del Autor (Fase 3)

**Obra:** *Fundamentos de TI: Un recorrido por las excentricidades de un entorno de TI* (2.ª Edición, 2026)  
**Autor:** Jesús A. Palencia S.

> Registro trazable de decisiones editoriales, posturas técnicas y vivencias reales capturadas mediante entrevistas interactivas (`/grill-me`) antes de redactar cada archivo en `manuscrito/`.

---

## Decisiones Editoriales Globales (Cerradas el 2026-11-25)

1. **Flujo de trabajo Fase 3:** Avanzar estrictamente un archivo a la vez (micro-entrevista -> borrador en `manuscrito/` -> compilación ODT en contenedor Docker y revisión del autor antes de pasar al siguiente capítulo).
2. **Portada e imágenes en preliminares:** Portadilla tipográfica limpia para la 2.ª Edición (2026) + insignia `licencia.png` en la página de Créditos (dejando la ilustración de portada gráfica definitiva para el cierre del manuscrito).
3. **Integración de diagramas técnicos (`diagramas/*.mmd`):** Mantener el código fuente editable en `diagramas/*.mmd` y renderizarlo automáticamente en contenedor Docker a imágenes PNG de alta resolución incrustadas en el `.odt`.
4. **Registro lingüístico y terminología:** Español técnico panhispánico neutro con tuteo directo (`tú` / `nosotros`), conservando los anglicismos universales de la industria en *cursiva* con su explicación clara en español en la primera mención.

---

## Sesión 00 — Preliminares y Prefacio a la 2.ª Edición (`manuscrito/00-preliminares.md`)

- **Créditos, licencia y contacto:**
  - Incluir historial editorial explícito: Primera edición (2022) y Segunda edición revisada y expandida (2026).
  - Licencia abierta Creative Commons Atribución-CompartirIgual 4.0 Internacional (`CC BY-SA 4.0`) acompañada del sello `licencia.png`.
  - Repositorio público *Books as Code*: `https://github.com/sinfallas/libro-ti`.
  - Contacto y donaciones por PayPal: `sinfallas@gmail.com`.
- **Dedicatoria y destinatarios del Prefacio:**
  - Conservar la dedicatoria original a todas las personas que viven dentro de un departamento de TI y quieren comprender mejor las excentricidades del entorno.
  - Incorporar al final del Prefacio una brújula de lectura para tres perfiles: (a) técnicos e ingenieros en la trinchera, (b) líderes/coordinadores de TI y seguridad atrapados entre la operación y el negocio, y (c) gerentes o auditores no técnicos que necesitan entender qué ocurre dentro del área.
- **Detonante real 2022 -> 2026:**
  - El choque con la realidad operativa tras 2022: el fin de la luna de miel financiera con el *Cloud*, la explosión del humo comercial de *"ponerle IA mágica a todo"* sobre datos y procesos rotos, y la consolidación de brechas de seguridad que ya no perdonan la improvisación.
- **Escena / experiencia real de apertura en el Prefacio:**
  - El contraste recurrente vivido en salas de juntas: la gerencia niega o regatea presupuesto para respaldos probados, renovación de *switches* o soporte básico, y en esa misma reunión pregunta entusiasmada cuánto cuesta comprar la moda tecnológica de turno (*"migrar todo a la nube"* ayer, *"meterle inteligencia artificial"* hoy).

---

## Sesión 01 — Capítulo 1: El choque de idiomas entre Negocio y TI (`manuscrito/01-choque-idiomas-negocio-ti.md`)

- **Escena y excentricidad central (Bloque 1.3):**
  - El síndrome de *"tiene enchufe, llámenle a Sistemas"*: asignar tareas completamente ajenas al perfil técnico de cada especialista y recortar plantilla asumiendo erróneamente que todas las personas dentro de TI son intercambiables y hacen lo mismo.
- **Postura autoral sobre la raíz del divorcio Negocio vs. TI (Bloques 1.1 y 1.2):**
  - **Responsabilidad compartida (50/50):** Ni victimismo gremial ni indulgencia con la gerencia. La dirección fracasa cuando trata a TI como un gasto opaco de taller mecánico, y el propio técnico alimenta esa irrelevancia cuando se esconde detrás de acrónimos en lugar de entender y hablar sobre cómo factura, pierde dinero o asume riesgos la empresa.
- **Regla operativa frente a peticiones por pasillo / WhatsApp y proyectos zombis (Bloques 1.2 y 1.3):**
  - **Política de tolerancia cero absoluta:** Si no existe un ticket previo con el formulario completo, nadie en TI mueve un dedo, aunque quien lo pida sea un gerente o director. Las "excepciones blandas" perpetúan el *amiguismo*, vuelven invisible la carga real de trabajo, rompen la trazabilidad de auditoría y condenan los proyectos formales a convertirse en proyectos zombis.
- **Herramientas y métricas del Marco de Acción Pragmático (Bloque 1.4):**
  - Tabla traductora directa (*Jerga TI -> Impacto en negocio/riesgo*), cuantificación del coste por hora de inactividad (*RTO/RPO* en moneda dura), despliegue de herramientas libres probadas en trinchera (**GLPI**, **Zammad**, **osTicket**) y publicación interna de un catálogo transparente de roles y servicios.
