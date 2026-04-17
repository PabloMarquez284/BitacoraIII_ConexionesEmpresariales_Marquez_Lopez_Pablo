# FUNDAMENTOS DE SEGURIDAD Y AUDITORÍA

Una **auditoría de seguridad** es una inspección profunda de los sistemas, redes y procesos de IT para determinar cómo tienen implementado su ciberseguridad. Es una actividad continua que incluye la evaluación del hardware,  software, políticas o procedimientos aplicados para poder cumplir con las normativas, evaluando la eficiencia del marco de ciberseguridad de una organización.


## RETO DE INVESTIGACIÓN 1

### DEFINICIÓN DE SYSLOG Y SUS CARACTERÍSTICAS
El **syslog** es el archivo de bitácora central del sistema en distribuciones como Ubuntu donde se almacenan cronológicamente los eventos, mensajes de error y estados de ejecución de diversos componentes del sistema operativo.

Este se encuentra siempre dentro del directorio **/var/log/syslog**. Allí se registra la información técnica sobre cualquier fallo de la red o un programa. Para acceder a él, los comandos más utilizados son cat, tail o grep (especificando con un filtro).

Para clasificar el syslog, hablamos de facility y priority.   
\- **Facility** es un código numérico que indica que parte del sistema que generó el mensaje. Un ejemplo sería mail para correo y user para mensajes de usuarios.  
\- **Priority** indica la gravedad del evento registrado, por ello, se divide en niveles que van de más críticos a menos relevantes: emerg (sistema inutilizable), alert (acción inmediata), crit (condiciones críticas), err (mensajes de error), warning (advertencias), notice (normal pero significativo), info (información común), debug (mensajes de depuración).

### VULNERABILIDAD DE AUTH.LOG
El acceso de usuarios comunes a **auth.log** es negligente porque expone información crítica como nombres de usuario válidos y hábitos de conexión. El riesgo más grave es la fuga de contraseñas, ya que si un usuario la escribe por error en el campo de "username", esta queda registrada en texto plano y disponible para cualquier atacante interno.
 

### DIFERENCIA ENTRE FALLOS REMOTOS Y LOCALES
La diferencia principal radica en la presencia de una dirección IP y el proceso involucrado: un ataque **SSH** registra siempre la IP de origen y depende del demonio sshd, mientras que un fallo local muestra una terminal física (tty) y procesos de inicio de sesión internos. Además, los intentos remotos suelen usar nombres genéricos, mientras que los locales suelen estar ligados a usuarios reales del sistema.


## RETO DE INVESTIGACIÓN 2

### CUMPLIMIENTO Y LOG MANAGEMENT
Centralizar registros en un servidor externo garantiza la integridad de las pruebas, impidiendo que un atacante borre sus huellas tras vulnerar una máquina. Esta práctica es fundamental para cumplir con el **RGPD** al asegurar una auditoría inalterable de los accesos a datos personales y permite detectar ataques coordinados que pasarían desapercibidos al analizar cada servidor de forma aislada.


## Referencias

\[1\] ¿Qué es una auditoría de seguridad? Importancia y mejores prácticas :[https://www.sentinelone.com/es/cybersecurity-101/cloud-security/security-audit/](https://www.sentinelone.com/es/cybersecurity-101/cloud-security/security-audit/)  
\[2\] ¿Qué es Syslog? Una introducción al protocolo de registro del sistema: [https://blog.invgate.com/es/que-es-syslog](https://blog.invgate.com/es/que-es-syslog)  
Nota: He utilizado el *Notebook* dado por el docente para buscar más información acorde con la investigación.
