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

---

## Sesión 02 — Capítulo 2: Deuda técnica, obsolescencia y el síndrome del último artilugio (`manuscrito/02-deuda-tecnica-obsolescencia-modas.md`)

- **Escena y excentricidad central (Bloque 2.3):**
  - El **"fósil intocable"** que sostiene la facturación: el servidor o sistema con sistema operativo muerto hace años que nadie en la empresa se atreve siquiera a reiniciar por pánico a que no vuelva a arrancar, conviviendo bajo el mismo techo con compras ejecutivas del último juguete tecnológico de moda.
- **Postura autoral sobre deuda técnica y obsolescencia (Bloques 2.1 y 2.2):**
  - **Doble criterio estricto:** Separar el préstamo técnico calculado (con plan y fecha de amortización) de la simple chapuza perpetua acumulada por desidia; y distinguir la **obsolescencia real de riesgo** (fin de parches de seguridad y repuestos) frente a la **obsolescencia programada comercial** con la que los proveedores fuerzan cambios de versión o suscripción sin aportar valor operativo.
- **Regla de arquitectura frente a *vendor lock-in* y *Resume-Driven Development* (Bloque 2.3):**
  - Exigir siempre **formatos/protocolos abiertos y plan de salida documentado** antes de contratar un proveedor o adoptar una herramienta, vetando tecnologías exóticas elegidas para engordar currículums que dependan de un único "iluminado" en el equipo.
- **Herramientas y métricas del Marco de Acción Pragmático (Bloque 2.4):**
  - Semáforo vivo de ciclo de vida (*EOL/EOS*) apoyado en **Snipe-IT**, **NetBox** o **GLPI** cruzado con `endoflife.date` (más aislamiento inmediato de lo vencido), cuota fija protegida del **15 %–20 %** de capacidad para pagar deuda existente y **filtro anti-humo de 5 preguntas** antes de aprobar cualquier moda comercial.

---

## Sesión 03 — Capítulo 3: Del BYOD improvisado al trabajo híbrido y remoto seguro (`manuscrito/03-trabajo-hibrido-byod-frontera-diluida.md`)

- **Escena y excentricidad central (Bloque 3.3):**
  - La computadora portátil familiar compartida —con juegos pirateados, antivirus desactivado y sin parches— conectada mediante una VPN plana directamente a la red interna de servidores, mientras el usuario reclama además que TI le repare el Wi-Fi o la impresora de su casa.
- **Postura autoral sobre privacidad, propiedad del equipo y *bossware* (Bloques 3.1 y 3.3):**
  - Rescate y desarrollo de la nota original sobre la *"definición utópica de privacidad"*: **control total del dispositivo exige equipo pagado por la empresa**. Si existe *BYOD*, TI únicamente aísla y gobierna la sesión o contenedor de trabajo (cero *bossware* espía sobre la vida privada del empleado y cero soporte técnico al hardware o red doméstica).
- **Regla frente a VPN planas y WhatsApp personal (Bloques 3.2 y 3.3):**
  - Mano dura en ambos frentes: jubilación definitiva de la VPN plana abierta a toda la LAN (vector directo de propagación lateral de *ransomware*) y prohibición de gestionar carteras de clientes o documentación sensible desde cuentas personales de WhatsApp.
- **Herramientas y estándares del Marco de Acción Pragmático (Bloque 3.4):**
  - Identidad centralizada con **Keycloak** o **Authentik** + MFA fuerte (**FIDO2 / WebAuthn / *Passkeys*** o *TOTP*, sin SMS); reemplazo de VPN plana por malla segmentada sobre **WireGuard** (**NetBird** o **Headscale/Tailscale**); aislamiento sin datos locales en *BYOD* vía **Apache Guacamole** o **Kasm Workspaces**; canales propios con **Chatwoot** / **Mattermost**; y política *BYOD* firmable de 1 página.
