# Definición de la Base de Datos
## Definición del esquema de Base de Datos
### 1.1 Identificar Entidades y Atributos:
1. Usuarios:
- ID de Usuario (clave primaria)
- Nombre
- Apellido
- Correo electrónico
- Contraseña (hash)
- Rol (residente, miembro de la mesa directiva, vigilancia, etc.)
- Fecha de creación de la cuenta
- Última fecha de inicio de sesión

2. Invitados:
- ID de Invitado (clave primaria)
- ID de Usuario Anfitrión (clave foránea)
- Nombre
- Apellido
- Correo electrónico
- Teléfono
- Invitado Frecuente (booleano)
- Fecha de registro

3. Invitaciones:
- ID de Invitación (clave primaria)
- ID de Evento (clave foránea)
- ID de Invitado (clave foránea)
- Clave Única (opcional, generada para eventos específicos)
- Fecha de Creación de la Invitación
- Estado de la Invitación (pendiente, aceptada, rechazada, etc.)

4. Eventos:
- ID de Evento (clave primaria)
- Nombre del Evento
- Descripción del Evento
- Fecha y Hora del Evento
- ID de Usuario Anfitrión (clave foránea)
- Clave Única del Evento (opcional, generada automáticamente)
- Fecha de Creación del Evento

Con estas estructuras, se pueden generar invitaciones electrónicas para eventos específicos y asignar invitados a dichas invitaciones. 
Cada invitación puede tener una clave única asociada para acceso rápido, y puedes manejar el estado de cada invitación (pendiente, aceptada, rechazada, etc.). 
Además, hay una tabla separada para mantener información sobre los eventos, incluyendo quién es el anfitrión.
Si un invitado frecuente visita con regularidad, puedes marcarlo como tal en la tabla de Invitados y no será necesario generar una invitación nueva cada vez que visite.

5. Publicaciones:
- ID de Publicación (clave primaria)
- ID de Usuario que la publica (clave foránea)
- Contenido de la publicación
- Fecha de publicación
- Tipo de publicación (evento, anuncio, actualización, etc.)
- Nivel de Moderación (opcional, para definir si requiere aprobación)
- Estado de la Publicación (aprobada, pendiente, eliminada, etc.)

6. Comentarios:
- ID de Comentario (clave primaria)
- ID de Publicación a la que pertenece (clave foránea)
- ID de Usuario que hace el comentario (clave foránea)
- Contenido del comentario
- Fecha de comentario
- Nivel de Moderación (opcional, para definir si requiere aprobación)
- Estado del Comentario (aprobado, pendiente, eliminado, etc.)

Con estas estructuras será posible manejar el nivel de moderación y el estado de cada publicación y comentario. 
Esto permitirá definir si una publicación o comentario requiere aprobación antes de ser publicado en el Muro Social, y mantener un control sobre la calidad y la integridad de la comunicación en la comunidad.

7. Pagos:
- ID de Pago (clave primaria)
- ID de Usuario que realiza el pago (clave foránea)
- Monto del pago
- Fecha de pago
- Estado del pago (pendiente, completado, rechazado, etc.)
- Método de pago (tarjeta de crédito, transferencia bancaria, efectivo, etc.)

8. Encuestas:
- ID de Encuesta (clave primaria)
- Pregunta de la encuesta
- Fecha de creación de la encuesta
- Fecha de cierre de la encuesta
- Estado de la Encuesta (abierta, cerrada)
- Resultados de la Encuesta (opcional, almacenar resultados de votos)

9. Registro de Votos:
- ID de Voto (clave primaria)
- ID de Usuario que emite el voto (clave foránea)
- ID de Encuesta a la que se refiere el voto (clave foránea)
- ID de Opción seleccionada en la votación
- Fecha y hora del voto

Estructura que permite crear encuestas con preguntas y opciones de respuesta. Los usuarios pueden emitir sus votos una vez y ver el avance de la votación después de votar. Además, se envían notificaciones a los residentes cuando se crea una nueva encuesta y cuando se cierra.

10. Opciones de Respuesta:
- ID de Opción (clave primaria)
- ID de Encuesta asociada (clave foránea)
- Texto de la Opción

Con esta tabla, cada opción de respuesta está asociada a una encuesta específica. Cada opción tendrá un texto que represente la respuesta que los usuarios pueden seleccionar al participar en la encuesta.

11. Amenidades:
- ID de Amenidad (clave primaria)
- Nombre de la amenidad
- Descripción de la Amenidad
- Capacidad máxima de personas
- Disponibilidad (días y horarios disponibles)
- Estado de la Amenidad (disponible, reservada, en mantenimiento, etc.)

12. Reservas de Amenidades:
- ID de Reserva (clave primaria)
- ID de Usuario que realiza la reserva (clave foránea)
- ID de Amenidad reservada (clave foránea)
- Fecha y hora de la reserva
- Estado de la Reserva (pendiente, aprobada, rechazada)
- Fecha y hora de aprobación de la reserva (si aplica)
- Detalles adicionales de la reserva (número de personas, motivo, etc.)

Estructura que permite gestionar las amenidades disponibles, así como las reservas realizadas por los usuarios. 
La mesa directiva puede revisar y aprobar las reservas, y los usuarios reciben notificaciones sobre el estado de sus reservas.
Notificaciones de Nuevas Reservas: Se envía una notificación a la mesa directiva cuando se realiza una nueva reserva de amenidad.
Notificaciones de Aprobación de Reserva: Se envía una notificación al usuario cuando su reserva de amenidad ha sido aprobada por la mesa directiva.

13. Incidentes:
- ID de Incidente (clave primaria)
- ID de Usuario que reporta el incidente (clave foránea)
- Descripción del incidente
- Estado del incidente (abierto, en proceso, cerrado, etc.)
- Fecha de reporte del incidente
- Detalles de la Mejora Propuesta
- Fecha de Atención del Incidente
- ID de Usuario de la Mesa Directiva que atiende el incidente (clave foránea)

La entidad de Incidentes incluye campos para registrar detalles de la mejora propuesta y la fecha de atención del incidente, así como el registro del usuario de la mesa directiva que atiende el incidente.
Además, se puede implementar un sistema de notificaciones que envíe alertas a la mesa directiva cuando se reporte un nuevo incidente, y envíe notificaciones a los residentes cuando un incidente sea atendido o resuelto.
De esta manera se cubren todos los requisitos de la funcionalidad de Incidentes, permitiendo a los residentes informar sobre mejoras y dar seguimiento a las actividades pendientes de la comunidad de forma sencilla y práctica.

14. Reglamentos:
- ID de Documento (clave primaria)
- Título del Documento
- Descripción del Documento (opcional)
- Tipo de Documento (reglamento, minuta, documento importante, etc.)
- Archivo del Documento (almacenar el archivo PDF)
- Fecha y hora de carga del documento
- Estado del Documento (activo, archivado, eliminado, etc.)

Funcionalidades de la Aplicación:
Carga de Documentos: Los administradores pueden acceder a una interfaz en la aplicación o en la versión web para cargar nuevos documentos.
Pueden especificar el título, descripción, tipo y archivo del documento. También pueden programar la fecha y hora de carga del documento, si es necesario.
Visualización de Documentos: Los residentes pueden acceder a una sección en la aplicación donde encontrarán una lista de todos los documentos disponibles.
Podrán seleccionar un documento para ver su contenido o descargarlo en formato PDF.
Firma de Enterados: Para algunos documentos, como los reglamentos, los administradores pueden habilitar la función de firma de enterados.
Los residentes podrán indicar que están enterados de un documento específico mediante un botón de confirmación o una firma digital.

Con estas funcionalidades, proporcionamos una manera conveniente para que los administradores suban y gestionen los reglamentos, minutas y otros documentos importantes, y para que los residentes puedan acceder y firmar de enterados de estos documentos a través de la aplicación.

15. Mascotas:
- ID de Mascota (clave primaria)
- ID de Usuario propietario de la mascota (clave foránea)
- Nombre de la mascota
- Especie
- Raza
- Fecha de registro

16. Domicilios:
- ID de Domicilio (clave primaria)
- Calle
- Número
- Colonia
- Código postal
- Ciudad
- Estado
- País

17. Transacciones:
- ID de Transacción (clave primaria)
- ID de Usuario que realiza la transacción (clave foránea)
- Tipo de Transacción (pago, recargo, anticipo, etc.)
- Monto de la transacción
- Fecha de la transacción
- Descripción de la transacción
- Estado (completado, pendiente, cancelado, etc.)

Con esta entidad, podrás registrar todas las transacciones financieras realizadas por los residentes. 
Cada vez que se realice un pago, recargo o anticipo, se creará una nueva entrada en la tabla de Transacciones con la información correspondiente. 
Luego, podrás realizar consultas y cálculos basados en estas transacciones para llevar un registro preciso de los pagos, recargos y anticipos de cada residente.
También incluye una descripción para cada transacción, lo que proporciona información adicional sobre la naturaleza de la transacción, como el concepto del pago o el recargo.

18. Estado de Cuenta:
- ID de Estado de Cuenta (clave primaria)
- ID de Usuario (clave foránea)
- Saldo Actual
- Detalles de Pagos (historial de transacciones de pagos)
- Detalles de Recargos (historial de transacciones de recargos)
- Detalles de Anticipos (historial de transacciones de anticipos)
- Fecha de Generación del Estado de Cuenta

Esta entidad permite generar un resumen completo de las transacciones para cada usuario, incluyendo el saldo actual, el historial de pagos, recargos y anticipos. 
Puede ser utilizada por la mesa directiva para generar el estado de cuenta de la privada y hacerlo accesible para los residentes a través de la aplicación.
Con esto, se permitirá a los residentes estar informados sobre sus deudas y recibos, y a la mesa directiva tener un mejor control sobre los pagos, recargos y anticipos en la privada residencial.

19. Usuarios_Domicilios:
- ID de Relación (clave primaria)
- ID de Usuario (clave foránea)
- ID de Domicilio (clave foránea)
- Fecha de Asociación

Con esta  estructura, cada usuario puede estar asociado a uno o más domicilios a través de la tabla intermedia Usuarios_Domicilios. 
De esta manera, cumplimos con el requisito de permitir múltiples usuarios para un mismo domicilio. La fecha de asociación puede utilizarse para registrar cuándo se estableció la relación entre el usuario y el domicilio.

20. Comprobantes de Pago:
- ID de Comprobante (clave primaria)
- ID de Usuario que realiza el pago (clave foránea)
- Imagen del Comprobante (o ruta del archivo)
- Fecha de Envío del Comprobante
- Estado de Validación (pendiente, aprobado, rechazado, etc.)
- Fecha de Validación
- Detalles del Pago (monto, fecha de pago, método de pago, etc.)
- ID de Usuario de la Mesa Directiva que valida el pago (clave foránea)
- Observaciones (opcional)

Con esta entidad, los usuarios podrán tomar una foto a su comprobante de pago a través de la aplicación y enviarlo para su validación por parte de la mesa directiva. 
La mesa directiva recibirá notificaciones sobre los nuevos comprobantes de pago enviados y podrá validarlos o rechazarlos según corresponda. 
Una vez que un pago sea aprobado, el usuario recibirá una notificación de confirmación.
Además, la entidad incluye campos para registrar detalles del pago, como el monto y la fecha, así como información adicional como observaciones.
Con esta estructura, podemos llevar un seguimiento adecuado de los comprobantes de pago enviados, su validación por parte de la mesa directiva y proporcionar a los usuarios un estado de cuenta oportuno sobre sus pagos.

21. Recorridos de Seguridad:
- ID de Recorrido (clave primaria)
- ID de Guardia que realiza el recorrido (clave foránea)
- Fecha y hora de inicio del recorrido
- Fecha y hora de fin del recorrido
- Puntos de Control (ubicaciones registradas durante el recorrido)
- Distancia recorrida
- Duración del recorrido
- Estado del Recorrido (completado, en curso, cancelado, etc.)

Funcionalidades de la Aplicación para Guardias:
Registro de Recorridos: Los guardias pueden iniciar y detener un recorrido desde la aplicación.
Durante el recorrido, la aplicación registrará automáticamente la ubicación del guardia en intervalos regulares y la enviará a la base de datos.
Funcionalidades de Verificación para Administradores:
Verificación de Recorridos: Los administradores pueden acceder a una interfaz en la aplicación o en la versión web para verificar los recorridos registrados por los guardias.
Pueden ver la lista de recorridos realizados, así como los detalles de cada recorrido, incluyendo la fecha, hora, duración, distancia y ubicaciones visitadas.
También pueden verificar si se cumplió con la frecuencia deseada de los recorridos y tomar medidas si se detectan irregularidades.

Con estas funcionalidades, proporcionamos a los guardias una manera de registrar sus recorridos de seguridad de forma fácil y eficiente a través de la aplicación, y a los administradores la capacidad de monitorear y verificar la realización adecuada de estos recorridos.

22. Comunicados:
- ID de Comunicado (clave primaria)
- ID de Administrador que genera el comunicado (clave foránea)
- Fecha y hora de creación del comunicado
- Título del comunicado
- Contenido del comunicado
- Tipo de comunicado (reunión, aviso de mantenimiento, información importante, etc.)
- Estado del comunicado (activo, archivado, eliminado, etc.)

Funcionalidades de la Aplicación para Administradores:
Generación de Comunicados: Los administradores pueden acceder a una interfaz en la aplicación o en la versión web para redactar y enviar comunicados.
Pueden especificar el título, contenido y tipo de comunicado, así como seleccionar la audiencia (todos los residentes, residentes específicos, etc.).
También pueden programar la fecha y hora de envío del comunicado, si es necesario.
Funcionalidades de la Aplicación para Residentes:
Recepción de Comunicados: Los residentes recibirán notificaciones en sus dispositivos móviles cuando se envíen nuevos comunicados.
Podrán acceder a una sección en la aplicación donde encontrarán una lista de todos los comunicados recibidos, con la opción de ver el contenido completo de cada uno.

Con estas funcionalidades, se proporciona una manera eficiente para que los administradores puedan mantener informados a todos los residentes sobre eventos importantes, avisos de mantenimiento, cambios en las amenidades, y cualquier otra información relevante para la comunidad.

23 .Servicios Programados:
- ID de Servicio (clave primaria)
- Tipo de Servicio (recolección de basura, mantenimiento de jardín, limpieza de áreas comunes, etc.)
- Descripción del Servicio (opcional)
- Fecha y hora programadas para el servicio
- Estado del Servicio (programado, en curso, completado, cancelado, etc.)
- ID de Residente asociado (clave foránea, si se necesita asignar el servicio a un residente específico)

Funcionalidades de la Aplicación:
Configuración de Servicios: Los residentes pueden acceder a una sección en la aplicación para configurar los servicios que desean recibir notificaciones.
Pueden seleccionar el tipo de servicio (recolección de basura u otros), proporcionar una descripción adicional si es necesario, y especificar la fecha y hora en que desean recibir la notificación.
Recepción de Notificaciones: Cuando se acerque la fecha y hora programadas para un servicio, los residentes recibirán una notificación en sus dispositivos móviles.
La notificación les recordará el tipo de servicio programado y les dará tiempo para prepararse.

Con estas funcionalidades, proporcionamos a los residentes una manera conveniente de programar y recibir notificaciones sobre servicios programados, como la recolección de basura municipal u otros servicios de mantenimiento. Esto les permite estar mejor preparados y organizados para gestionar estos servicios en su comunidad.

24. Mensajes de Emergencia:
- ID del Mensaje (clave primaria)
- ID de Residente que envía el mensaje (clave foránea)
- Contenido del Mensaje (mensaje de pánico)
- Ubicación precisa del Residente al enviar el mensaje (coordenadas GPS)
- Fecha y hora de envío del mensaje
- Estado del Mensaje (enviado, recibido, leído, etc.)

Funcionalidades de la Aplicación para Residentes:
Botón de Pánico: Los residentes tendrán acceso a un botón de pánico en la aplicación que les permitirá enviar un mensaje de emergencia a otros residentes.
Al presionar el botón de pánico, se enviará automáticamente un mensaje de pánico con la ubicación precisa del residente a través de la aplicación.
Recepción de Mensajes de Pánico: Los demás residentes recibirán notificaciones en sus dispositivos móviles cuando se reciba un mensaje de pánico.
Podrán acceder al mensaje para ver el contenido y la ubicación precisa del residente que lo envió.

Con estas funcionalidades, proporcionamos a los residentes una herramienta de seguridad adicional en caso de emergencia, permitiéndoles enviar mensajes de pánico con su ubicación precisa a otros residentes a través de la aplicación.

25. Mensajes del Chat con Caseta:
- ID del Mensaje (clave primaria)
- ID de Residente que envía el mensaje (clave foránea)
- ID de Vigilancia que recibe el mensaje (clave foránea)
- Contenido del Mensaje
- Fecha y hora de envío del mensaje
- Estado del Mensaje (enviado, recibido, leído, etc.)

Funcionalidades de la Aplicación para Residentes:
Chat con Caseta: Los residentes tendrán acceso a una función de chat en la aplicación que les permitirá comunicarse con la vigilancia.
Podrán enviar mensajes de manera ágil y segura directamente a la caseta de vigilancia.
Recepción de Mensajes: La caseta de vigilancia recibirá los mensajes enviados por los residentes a través del chat.
Los mensajes serán mostrados en tiempo real en la interfaz de la caseta de vigilancia para que puedan responder de manera oportuna.

Con estas funcionalidades, proporcionamos a los residentes una forma conveniente de comunicarse con la caseta de vigilancia directamente desde la aplicación, lo que permite una respuesta rápida y eficiente a cualquier consulta o solicitud de los residentes.

## 2. Creación del Esquema de la Base de Datos en SQL Server:
2.1 Crear Tablas:
Utiliza SQL Server Management Studio (SSMS) u otra herramienta de administración de bases de datos para crear las tablas necesarias en la base de datos.
Define las columnas de cada tabla junto con sus tipos de datos, restricciones, claves primarias y claves foráneas según el diseño del esquema de la base de datos.
2.2 Establecer Relaciones:
Utiliza sentencias SQL ALTER TABLE para establecer relaciones entre las tablas utilizando claves foráneas.
Asegúrate de que las relaciones estén correctamente configuradas para mantener la integridad referencial en la base de datos.
2.3 Crear Índices:
Crea índices en las columnas relevantes para mejorar el rendimiento de las consultas y búsquedas en la base de datos.
Considera la creación de índices agrupados y no agrupados según las necesidades de tu aplicación.
3. Definición de Procedimientos Almacenados, Disparadores y Restricciones:
3.1 Procedimientos Almacenados:
Define procedimientos almacenados en la base de datos para encapsular la lógica de negocio compleja y mejorar la modularidad y el rendimiento.
Utiliza procedimientos almacenados para realizar operaciones CRUD (Crear, Leer, Actualizar, Eliminar) en los datos de la base de datos de manera segura y eficiente.
3.2 Disparadores (Triggers):
Define disparadores en la base de datos para ejecutar automáticamente acciones específicas en respuesta a eventos como la inserción, actualización o eliminación de datos.
Utiliza disparadores para mantener la integridad de los datos y aplicar reglas de negocio específicas en la base de datos.
3.3 Restricciones de Integridad:
Define restricciones de integridad en la base de datos para garantizar la consistencia y la integridad de los datos.
Utiliza restricciones como NOT NULL, UNIQUE, CHECK y FOREIGN KEY para aplicar reglas de negocio y asegurar la validez de los datos almacenados.
4. Optimización y Mantenimiento de la Base de Datos:
4.1 Optimización de Consultas:
Optimiza las consultas SQL utilizando técnicas como la selección de índices adecuados, la reescritura de consultas complejas y la eliminación de cuellos de botella de rendimiento.
Utiliza herramientas de análisis de rendimiento como el Plan de Ejecución de Consultas (Query Execution Plan) para identificar y resolver problemas de rendimiento en la base de datos.
4.2 Respaldo y Recuperación:
Implementa un plan de respaldo y recuperación para garantizar la seguridad y la disponibilidad de los datos en caso de fallo del sistema o pérdida de datos.
Realiza copias de seguridad regulares de la base de datos y prueba los procedimientos de recuperación para asegurarte de que puedas restaurar los datos en caso de emergencia.
4.3 Monitoreo y Mantenimiento Continuo:
Monitorea el rendimiento y la salud de la base de datos utilizando herramientas de monitoreo y alerta.
Realiza tareas de mantenimiento regularmente, como la optimización de índices, la eliminación de datos obsoletos y la gestión del crecimiento de la base de datos, para garantizar un funcionamiento óptimo de la base de datos a largo plazo.
