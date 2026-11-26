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

---

## Sesión 04 — Capítulo 4: De la fiebre Cloud/FAANG a la era de la IA y la infraestructura híbrida (`manuscrito/04-de-era-faang-cloud-a-ia-hibrida.md`)

- **Escena y excentricidad central (Bloque 4.3):**
  - El síndrome de *"creerse Netflix"* (*Cargo Cult FAANG*): desplegar orquestadores complejos y decenas de microservicios para una carga de apenas 80 usuarios concurrentes, o ejecutar un *Lift & Shift* ciego hacia la nube pública que triplica la factura mensual sin resolver ni un solo problema arquitectónico.
- **Postura estratégica sobre *Cloud* vs. Infraestructura Híbrida (Bloques 4.1 y 4.2):**
  - **Realismo híbrido sin dogmas religiosos:** La nube pública es el centro de datos de un tercero alquilado por minuto; conviene para elasticidad real, picos impredecibles o servicios globales puntuales, mientras que para cargas base estables 24/7 suele resultar mucho más eficiente y predecible operar sobre hierro propio, *colocation* o servidores virtuales/dedicados de tarifa plana.
- **Tesis sobre el ciclo de la IA generativa corporativa (Bloques 4.2 y 4.3):**
  - La fiebre de la IA en 2026 repite exactamente el patrón histórico de modas previas (*Big Data*, *Blockchain*, *Cloud-First*): amplifica el valor donde ya existen datos limpios, permisos ordenados y procesos claros, pero multiplica el caos, los costos y las fugas cuando se enchufa sobre datos sucios y procesos rotos.
- **Herramientas y reglas del Marco de Acción Pragmático (Bloque 4.4):**
  - Doctrina de la **Tecnología Aburrida** (**PostgreSQL**, **Linux LTS**, contenedores simples **Docker/Podman** y monolitos modulares bien diseñados), regla estricta de **1 a 2 Fichas de Innovación al año** reservadas al diferencial real del negocio, y matriz objetiva de ubicación de cargas.

---

## Sesión 05 — Capítulo 5: Anatomía real de un Departamento de TI: 8 dominios, CIO y Two-Pizza Teams (`manuscrito/05-anatomia-departamento-ti-y-equipos.md`)

- **Escena y excentricidad central (Bloque 5.3):**
  - El síndrome del **"héroe irreemplazable" (*bus factor = 1*)**: el técnico o jefe que concentra claves y arquitectura en su cabeza sin documentar nada, no puede desconectarse ni en vacaciones o enfermedad y deja huérfana a toda la operación si falta un solo día.
- **Postura autoral sobre el perfil del CIO / Director de TI (Bloques 5.1 y 5.2):**
  - Un director de orquesta con cicatrices técnicas reales (para que ningún proveedor ni subordinado le venda humo), pero **con las manos fuera del teclado operativo diario**: enfocado en alinear el negocio, asegurar cobertura funcional de todas las áreas, defender presupuesto y planificar con **horizonte a 3 años**.
- **Adaptación de los 8 dominios y *Two-Pizza Teams* en PyMEs y empresas medianas (Bloques 5.2 y 5.3):**
  - Las **8 funciones existen siempre** aunque la plantilla total sea de 3 a 5 personas: se agrupan sombreros operativos afines en pocas cabezas con rotación de respaldo cruzado (*bolsa de técnicos*), prohibiendo terminantemente mezclar ejecución técnica con autoauditoría (GRC/Auditoría debe mantenerse independiente).
- **Herramientas y reglas del Marco de Acción Pragmático (Bloque 5.4):**
  - Tabla evolutiva de asignación de dominios según escala (**3**, **10** y **30+ personas**) a 3 años, matriz **RACI** pública, bóveda compartida de credenciales por rol (**Vaultwarden / Bitwarden** o **Passbolt**), documentación viva (**BookStack** u **Outline**) y la **prueba obligatoria de vacaciones desconectadas**.

---

## Sesión 06 — Capítulo 6: Ciberseguridad Operativa (CISO y SecOps) (`manuscrito/06-ciberseguridad-operativa-secops-ciso.md`)

- **Escena y excentricidad central (Bloque 6.3):**
  - El combo mortal en empresas reales: repetir *"somos demasiado chicos para que nos ataquen"*, comprar una caja costosa con luces que nadie revisa y mantener el almacenamiento de copias de seguridad conectado permanentemente por red con las mismas credenciales del dominio, logrando que el *ransomware* cifre producción y respaldos en el mismo minuto.
- **Postura autoral sobre autoridad del CISO y prioridades de defensa (Bloques 6.1 y 6.2):**
  - Un **CISO sin derecho de veto** ante despliegues inseguros (salvo asunción escrita del riesgo económico firmada por Gerencia General) es un chivo expiatorio decorativo. En PyMEs y empresas medianas, la higiene implacable (*MFA*, retiro de administrador local, parches por explotación real y **backups inmutables 3-2-1-1-0**) detiene más ataques que cualquier suite millonaria desatendida.
- **Estándares y herramientas del Marco de Acción Pragmático (Bloque 6.4):**
  - Priorización con **CIS Controls v8 (IG1)** + catálogo **CISA KEV**; visibilidad y defensa abierta con **Wazuh**, **CrowdSec / Fail2ban** y **Trivy / OpenVAS**; respaldos inmutables con **Proxmox Backup Server / Restic / Borg**; y ***playbook* de primera hora ante incidente impreso en papel** fuera de la red.

---

## Sesión 07 — Capítulo 7: Riesgos, Cumplimiento, Privacidad y Auditoría (GRC, Auditor TI y DPO) (`manuscrito/07-gobierno-riesgos-cumplimiento-auditoria.md`)

- **Escena y excentricidad central (Bloque 7.3):**
  - El **"cumplimiento de papel"**: carpetas repletas de políticas genéricas descargadas de internet y firmadas la noche anterior a la visita del auditor externo, mientras en la realidad nadie ha probado jamás el plan de recuperación ante desastres (*DRP*) ni existe inventario real de dónde circulan los datos personales.
- **Postura autoral sobre segregación, Auditor TI y DPO (Bloques 7.1 y 7.2):**
  - **Cero autoauditoría** (quien opera infraestructura o *SecOps* jamás audita su propio trabajo); un **Auditor TI de campo** que valida evidencia viva y propone mejoras pragmáticas en lugar de tildar casillas burocráticas; y un **DPO** regido por la minimización estricta (*el dato personal que no guardas de más es el único que jamás pueden robarte ni multarte por filtrar*).
- **Estándares, herramientas y rituales del Marco de Acción Pragmático (Bloque 7.4):**
  - Marcos **NIST CSF 2.0** e **ISO/IEC 27001** aterrizados sobre plataformas abiertas de GRC (**CISO Assistant** o **Eramba**), acompañados de tres pruebas semestrales obligatorias: **(1)** simulacro cronometrado real de *DRP*, **(2)** cruce de bajas de RR. HH. contra cuentas activas, y **(3)** auditoría de cláusulas de salida y devolución de datos en proveedores críticos.

---

## Sesión 08 — Capítulo 8: Aplicaciones Empresariales (BRM/ERP) y FinOps (`manuscrito/08-aplicaciones-empresariales-brm-finops.md`)

- **Escena y excentricidad central (Bloque 8.3):**
  - La **factura sorpresa anual en la nube y SaaS**: descubrir en el cierre del ejercicio que la empresa pagó miles de dólares en licencias y asientos inactivos de exempleados, suscripciones duplicadas contratadas con tarjetas corporativas y entornos *Cloud* olvidados sin dueño nominal.
- **Postura autoral sobre personalización de *ERP* y *FinOps* (Bloques 8.1 y 8.2):**
  - **Regla 80/20 estricta (*clean core*):** Primero se ordena el proceso humano y se adopta el estándar del *ERP* en un 80–90 %, reservando desarrollos externos acoplados por API únicamente donde exista ventaja competitiva real. En **FinOps**, cada licencia y recurso exige dueño y centro de costo nominal, midiendo el costo tecnológico unitario por operación de negocio.
- **Herramientas y estándares del Marco de Acción Pragmático (Bloque 8.4):**
  - Alternativas abiertas gobernadas bajo núcleo limpio (**ERPNext / Odoo**) + fuente única de analítica (**Metabase / Apache Superset**); estándar abierto **FOCUS** (*FinOps Foundation*) + **OpenCost**, etiquetado obligatorio (`owner`, `cost_center`, `env`, `ttl`), alertas duras al 50/80/100 % y **purga mensual automática de asientos *SaaS* sin actividad > 30 días**.

---

## Sesión 09 — Capítulo 9: Service Desk e ITIL 4 pragmático (`manuscrito/09-service-desk-itil4-pragmatico.md`)

- **Escena y excentricidad central (Bloque 9.3):**
  - El doble vicio de las mesas de ayuda mal gobernadas: el **amiguismo de cafetería** (atender primero a quien cae bien o grita más fuerte) combinado con el **maquillaje de SLAs o *efecto sandía*** (cerrar casos sin resolver los viernes para mostrar tableros verdes por fuera mientras el usuario sigue rojo de indignación por dentro).
- **Postura autoral sobre adopción de ITIL 4 (Bloques 9.1 y 9.2):**
  - Descartar el academicismo burocrático de implantar 34 prácticas de golpe y dominar **solo 5 prácticas esenciales bien hechas**: Catálogo de Servicios humano, Incidentes (*algo roto*), Solicitudes (*algo estándar*), Problemas (*eliminar cada mes la causa raíz de los 5 casos más repetidos*) y Cambios graduados (*estándar automático vs. revisión solo para alto riesgo*).
- **Mecanismos y métricas del Marco de Acción Pragmático (Bloque 9.4):**
  - El usuario jamás define su propia prioridad: se calcula objetivamente mediante **Impacto × Urgencia** (sin carril VIP arbitrario); *SLAs* externos respaldados por *OLAs* internos entre equipos técnicos; auditoría estricta de **tasa de reapertura** y experiencia real (*XLA*); y autoservicio de contraseñas + base de conocimiento viva.

---

## Sesión 10 — Capítulo 10: Redes y Comunicaciones (`manuscrito/10-redes-comunicaciones-conectividad.md`)

- **Escena y excentricidad central (Bloque 10.3):**
  - La **falsa redundancia por el mismo ducto** (contratar dos proveedores de fibra que entran por el mismo poste o canalización en la acera hasta que una excavadora corta ambos al mismo tiempo), sumada al bastidor "espagueti" sin etiquetar y al mini-*switch* doméstico escondido bajo un escritorio que provoca un bucle de tormenta en todo el piso.
- **Postura arquitectónica de red (Bloques 10.1 y 10.2):**
  - Liberar a Redes de formatear PCs (*Service Desk*) y de cargar en solitario con seguridad (*SecOps*). Exigir **muerte definitiva de la red plana** (segmentación estricta en VLANs/zonas: Servidores, Usuarios, Gestión OOB, Voz/IoT-Cámaras e Invitados) y **redundancia real por medios físicos distintos** (fibras por acometidas opuestas + enlace inalámbrico 5G empresarial o satelital LEO).
- **Herramientas y defensas del Marco de Acción Pragmático (Bloque 10.4):**
  - Fuente única de verdad IPAM y bastidores con **NetBox / phpIPAM**, respaldo automático versionado en Git con **Oxidized**, borde con **OPNsense / pfSense / VyOS**, Wi-Fi corporativo **WPA3-Enterprise (802.1X)**, protecciones **BPDU Guard + DHCP Snooping** en acceso y monitoreo con **LibreNMS / Zabbix**.

---

## Sesión 11 — Capítulo 11: Sistemas e Infraestructura (`manuscrito/11-sistemas-infraestructura-nube-repatriacion.md`)

- **Escena y excentricidad central (Bloque 11.3):**
  - La falsa creencia mortal de *"no hace falta backup porque el servidor tiene RAID"* (hasta que un borrado accidental, corrupción lógica o descarga eléctrica destruye todos los discos del arreglo en el mismo instante), unida a los servidores *"mascota"* bautizados con nombres de dioses mitológicos y parchados artesanalmente durante años que nadie sabe clonar ni reconstruir desde cero.
- **Postura autoral sobre virtualización abierta y repatriación (Bloques 11.1 y 11.2):**
  - Frente al abuso de incrementos por núcleo en hipervisores comerciales propietarios, adoptar virtualización abierta madura (**Proxmox VE / KVM / XCP-ng**) sin pagar peaje por el propio silicio; y ejecutar **repatriación pragmática** de cargas estables 24/7 hacia *colocation*, *bare-metal* o hierro propio bien diseñado cuando la inversión se amortiza en menos de **18 meses**.
- **Herramientas y criterios del Marco de Acción Pragmático (Bloque 11.4):**
  - **Proxmox VE / KVM** sobre **ZFS** (con advertencia estricta de no montar **Ceph** sin mínimo 3 nodos y red dedicada de 10/25 GbE), paso de mascotas a ganado reproducible con **cloud-init + Ansible / OpenTofu**, y calculadora honesta de **TCO a 36 meses** sin costos ocultos.

---

## Sesión 12 — Capítulo 12: Gestión de Proyectos y Estrategia de Servicios (`manuscrito/12-gestion-proyectos-estrategia-servicios.md`)

- **Escena y excentricidad central (Bloque 12.3):**
  - **Arrancar por el final:** cuando la gerencia compra el software, firma el contrato o anuncia públicamente en prensa la fecha de lanzamiento comercial *antes* de haber levantado requerimientos, validado arquitectura o consultado siquiera a TI y Seguridad.
- **Postura metodológica sobre proyectos en TI (Bloques 12.1 y 12.2):**
  - Enfoque **híbrido pragmático** libre de dogmas: planificación secuencial dura para dependencias físicas inflexibles (compras, aduanas, fibra óptica, ventanas de corte) combinada con flujo **Kanban con límite estricto de trabajo en curso (*WIP*)** para erradicar la falacia de partir a un mismo ingeniero en cinco proyectos simultáneos.
- **Controles y herramientas del Marco de Acción Pragmático (Bloque 12.4):**
  - Candado previo obligatorio en Compras/Dirección, reemplazo del viejo análisis *D.A.F.O.* de 2022 por un **Pre-Mortem técnico de riesgos** antes de iniciar cada proyecto, tablero único con regla *"uno entra, uno sale"* (**OpenProject / Plane / Taiga**) y **Definición de Terminado y Operable** antes de traspasar nada a Soporte y Operaciones.

---

## Sesión 13 — Capítulo 13: Arquitectura de Software y Desarrollo (`manuscrito/13-arquitectura-software-desarrollo.md`)

- **Escena y excentricidad central (Bloque 13.3):**
  - El **zoológico de 7 lenguajes huérfanos**: cada desarrollador programó en su lenguaje y *framework* favorito sin estándares comunes, dejando al irse un mosaico inmantenible donde nadie puede sostener ni corregir el código del compañero.
- **Postura sobre estandarización, integraciones e IA en desarrollo (Bloques 13.1 y 13.2):**
  - Estandarizar al equipo en **máximo 1 o 2 stacks oficiales**, prohibir terminantemente acoplar sistemas tocando directo la base de datos ajena (toda integración pasa por contratos de *API* limpios), mantener claras las parcelas entre Arquitecto, Infraestructura y *SRE*, y exigir **responsabilidad humana total** sobre cualquier línea asistida por IA (prohibido fusionar código que el autor no sepa explicar ni probar sin el asistente).
- **Herramientas y prácticas del Marco de Acción Pragmático (Bloque 13.4):**
  - ***Architecture Decision Records* (*ADRs*)** de 1 página versionados en Git, diagramación simple con **modelo C4**, contratos **OpenAPI** sobre **monolito modular** y disciplina obligatoria de revisión por pares + pruebas automatizadas en **GitLab / Gitea / Forgejo**.

---

## Sesión 14 — Capítulo 14: DevOps y Platform Engineering (`manuscrito/14-devops-platform-engineering.md`)

- **Escena y excentricidad central (Bloque 14.3):**
  - El aviso clasificado absurdo buscando contratar a **"un chico DevOps" solitario** (que domine quince tecnologías incompatibles por un sueldo junior) esperando que resuelva él solo años de guerra civil entre Desarrollo y Operaciones editando archivos YAML en *Jenkins*.
- **Postura sobre aprovisionamiento y Platform Engineering en empresas reales (Bloques 14.1 y 14.2):**
  - Coherencia estricta con el principio de parcelas claras y tickets obligatorios: **todo aprovisionamiento de infraestructura se mantiene centralizado mediante tickets formales hacia el área de Infraestructura**, sin abrir autoservicio libre que dispare recursos huérfanos o costos ocultos; es el propio equipo de Infraestructura quien ejecuta esos tickets de manera reproducible mediante *IaC* versionado en Git (cero toques manuales por SSH).
- **Herramientas y métricas del Marco de Acción Pragmático (Bloque 14.4):**
  - Git como única fuente de verdad para recetas de Infraestructura (**OpenTofu / Terraform + Ansible**) y *pipelines* limpios de aplicación (`< 10 min` en **GitLab CI / Woodpecker / GitHub Actions**), gobernados por las **4 métricas DORA** priorizando estabilidad (baja tasa de fallos por cambio) y recuperación rápida (*MTTR*) por encima de velocidad ciega.

---

## Sesión 15 — Capítulo 15: DevSecOps en la práctica (`manuscrito/15-devsecops-en-la-practica.md`)

- **Escena y excentricidad central (Bloque 15.3):**
  - La credencial maestra de producción subida por accidente al repositorio Git (creyendo ingenuamente que borrarla en el *commit* siguiente limpia el historial) combinada con un escáner sin afinar corrido un viernes a las 5 p. m. que escupe 4.000 falsos positivos y entrena a todo el equipo a ignorar las alertas reales.
- **Postura sobre compuertas de seguridad e infraestructura inmutable (Bloques 15.1 y 15.2):**
  - Compuertas graduadas que bloquean el *pipeline* únicamente ante hallazgos críticos reales (secretos, ejecución como `root`, vulnerabilidades explotables), junto a **infraestructura inmutable estricta**: contenedores sin `root`, sistemas de archivos `read_only`, `cap_drop: ALL` e imágenes base fijadas por *digest* SHA-256 (cero parches manuales dentro de contenedores vivos).
- **Herramientas y prácticas del Marco de Acción Pragmático (Bloque 15.4):**
  - Detección y gobierno de secretos (**Gitleaks / TruffleHog** + **OpenBao / Infisical** o **SOPS + age**), verificación automatizada con **Semgrep** (*SAST*), **Trivy** (*SCA*, contenedores, *IaC* y **SBOM CycloneDX**), **OWASP ZAP** (*DAST*) y firma criptográfica **Cosign (Sigstore)**, escalado humanamente mediante **Security Champions** apoyados en **OWASP ASVS**.

---

## Sesión 16 — Capítulo 16: De MLOps a LLMOps e IA Agéntica (`manuscrito/16-mlops-llmops-ia-agentica.md`)

- **Escena y excentricidad central (Bloque 16.3):**
  - El delirio ejecutivo o de consultoría de **"entrenar nuestro propio LLM desde cero"** quemando decenas de miles de dólares en alquiler de GPUs para resolver un problema de consulta documental interna que se solucionaba de forma rápida, económica y actualizable con un **RAG limpio** sobre documentos bien gobernados.
- **Postura arquitectónica sobre inferencia local vs. nube e IA agéntica (Bloques 16.1 y 16.2):**
  - Esquema **híbrido inteligente**: modelos abiertos ejecutados en privado/local para datos altamente confidenciales o cargas constantes, y APIs empresariales con contrato de cero retención/entrenamiento para el resto. En **RAG**, filtrado estricto por permisos de rol del usuario consultante; en **agentes autónomos**, confirmación humana obligatoria (*Human-in-the-Loop*) antes de cualquier acción destructiva o irreversible.
- **Herramientas y estándares del Marco de Acción Pragmático (Bloque 16.4):**
  - Puerta única **LiteLLM** (*AI Gateway* con cuotas y trazabilidad) + **Open WebUI** interno contra el *Shadow AI*, **PostgreSQL + `pgvector`** para búsqueda *RAG* sin exotismos, **vLLM / llama.cpp / Ollama** para inferencia privada y evaluación continua automatizada con **Promptfoo** bajo el estándar **OWASP Top 10 for LLM Applications**.

---

## Sesión 17 — Capítulo 17: SRE y Observabilidad Moderna (`manuscrito/17-sre-observabilidad-moderna.md`)

- **Escena y excentricidad central (Bloque 17.3):**
  - Cambiarles el cargo en el correo a los administradores de sistemas de siempre para rebautizarlos como *"Ingenieros SRE"* dejándolos atrapados al 95 % en trabajo manual repetitivo (*toil*) sin margen para automatizar, sumado a tableros llenos de semáforos verdes de CPU y memoria mientras los clientes llevan media hora sin poder concretar pagos.
- **Postura sobre *Error Budget*, *toil* y salud de guardias (Bloques 17.1 y 17.2):**
  - El **100 % de disponibilidad es un mito financieramente ruinoso**; el **presupuesto de error** actúa como árbitro matemático objetivo entre desplegar funciones nuevas o frenar a estabilizar; el trabajo manual repetitivo (*toil*) tiene techo estricto `< 50 %`; y en guardias nocturnas (*on-call*) queda prohibido despertar a un ser humano salvo que un viaje crítico del usuario ya esté sufriendo y exista acción inmediata aplicable.
- **Herramientas y estándares del Marco de Acción Pragmático (Bloque 17.4):**
  - Instrumentación abierta unificada con **OpenTelemetry (*OTel*)**, almacenamiento y visualización libres con **Prometheus / VictoriaMetrics + Grafana Loki + Grafana Tempo + Grafana / Alertmanager**, sonda externa independiente fuera de la propia red (**Uptime Kuma**) y arranque enfocado en **3 primeros SLOs** de negocio midiendo las **4 señales doradas**.

---

## Sesión 18 — Capítulo 18: Crónicas de trinchera y cultura de post-mortems sin culpa (`manuscrito/18-cronicas-trinchera-postmortems.md`)

- **Casos de estudio reales anonimizados seleccionados (Bloque 18.2):**
  1. **La terminal equivocada a las 3:00 a. m.:** Comando destructivo ejecutado en producción durante una ventana nocturna porque las consolas de prueba y producción eran visualmente idénticas y compartían acceso directo.
  2. **El certificado / dominio huérfano en día de cobro:** Vencimiento silencioso de un activo crítico registrado años atrás a nombre del correo de un exempleado, paralizando ventas en hora pico.
  3. **La mentira eléctrica de la UPS:** Corte de suministro donde el respaldo de baterías sin pruebas periódicas murió a los cuarenta segundos tumbando de golpe todo el cuarto de servidores.
- **Postura sobre *Post-Mortem* sin culpa vs. responsabilidad (Bloques 18.1 y 18.3):**
  - **Cultura Justa (*Just Culture*):** Protección total al error involuntario de buena fe (corrigiendo las barandillas del sistema que permitieron el accidente), pero tolerancia cero frente a ocultar incidentes, adulterar evidencias o saltar deliberadamente controles acordados.
- **Reglas y plantilla del Marco de Acción Pragmático (Bloque 18.4):**
  - Prohibición absoluta de cerrar informes con *"error humano / tener más cuidado"*, método de los **5 Porqués sistémicos**, y plantilla operativa lista para copiar atada a **máximo 3 acciones preventivas** con ticket abierto, responsable nominal y plazo menor a **30 días**.

---

## Sesión 19 — Capítulo 19: Cómo defender presupuestos de infraestructura y ciberseguridad (`manuscrito/19-defender-presupuestos-ti-ciberseguridad.md`)

- **Escena y excentricidad central (Bloque 19.3):**
  - La **paradoja del bombero invisible**: cuando Infraestructura y Seguridad hacen bien su trabajo silencioso, la directiva pregunta *"¿para qué gastar si hace años que no pasa nada?"*, negando una inversión preventiva modesta para terminar firmando en pánico un cheque en blanco al triple de precio la noche posterior al desastre.
- **Estrategia de negociación ante gerencias escépticas (Bloques 19.1 y 19.2):**
  - Presentar siempre **3 opciones cerradas cuantificadas en dinero** (*Óptima*, *Pragmática recomendada* y *No invertir hoy asumiendo pérdida diaria calculada*), exigiendo firma explícita en acta de aceptación de riesgo si eligen la tercera; y **autofinanciar victorias tempranas** usando los ahorros obtenidos con *FinOps* (purga de licencias y nube ociosa).
- **Herramientas financieras del Marco de Acción Pragmático (Bloque 19.4):**
  - Calculadora directa del **Costo por Hora de Inactividad**, alineación contable estratégica con el *CFO* estructurando la inversión como **CAPEX** (proteger *EBITDA* amortizando activo) u **OPEX** (proteger flujo de caja deduciendo gasto mensual) según convenga fiscalmente ese ejercicio, y plantilla copiable de **Caso de Negocio Ejecutivo de 1 Página**.

---

## Sesión 20 — Capítulo 20 y Anexo Glosario (`manuscrito/20-diagnostico-rapido-checklists-epilogo.md` y `manuscrito/21-anexo-glosario-comentado.md`)

- **Escena y excentricidad central (Bloque 20.3):**
  - El síndrome del **"sheriff recién llegado"** que viola la regla de la valla de Chesterton: entra el primer lunes burlándose de todo lo construido por la gestión anterior, apaga un script o servidor "horrible" sin averiguar qué dependencia oculta resolvía y deja sin facturar a media empresa el miércoles.
- **Mapa de rescate de los primeros 90 días (Bloques 20.1 y 20.2):**
  - **Días 1–30:** Asegurar oxígeno, bóveda de accesos, verificación real de respaldos y vencimientos críticos sin romper lo que aún no se comprende.
  - **Días 31–60:** Encender puerta única de tickets con tolerancia cero, semáforo *EOL* y primeras victorias autofinanciadas *FinOps*.
  - **Días 61–90:** Presentar diagnóstico en moneda dura y pactar hoja de ruta a 3 años con dirección.
- **Cierre editorial (Epílogo 20.5 y Anexo 21):**
  - Epílogo en primera persona evolucionando las *Conclusiones* de 2022 (*las siglas cambian cada cinco años, las excentricidades humanas permanecen; ninguna estructura debe copiarse como dogma*) + Glosario Técnico Comentado de ~50 términos con doble nivel (*Definición técnica* + *Traducción de trinchera sin humo*).
