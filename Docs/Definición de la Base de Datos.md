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

3. Publicaciones:
- ID de Publicación (clave primaria)
- ID de Usuario que la publica (clave foránea)
- Contenido de la publicación
- Fecha de publicación
- Tipo de publicación (evento, anuncio, actualización, etc.)
- Nivel de Moderación (opcional, para definir si requiere aprobación)
- Estado de la Publicación (aprobada, pendiente, eliminada, etc.)

4. Comentarios:
- ID de Comentario (clave primaria)
- ID de Publicación a la que pertenece (clave foránea)
- ID de Usuario que hace el comentario (clave foránea)
- Contenido del comentario
- Fecha de comentario
- Nivel de Moderación (opcional, para definir si requiere aprobación)
- Estado del Comentario (aprobado, pendiente, eliminado, etc.)

5. Pagos:
- ID de Pago (clave primaria)
- ID de Usuario que realiza el pago (clave foránea)
- Monto del pago
- Fecha de pago
- Estado del pago (pendiente, completado, rechazado, etc.)
- Método de pago (tarjeta de crédito, transferencia bancaria, efectivo, etc.)

6. Encuestas:
- ID de Encuesta (clave primaria)
- ID de Usuario que crea la encuesta (clave foránea)
- Pregunta de la encuesta
- Opciones de respuesta
- Fecha de creación de la encuesta
- Fecha de finalización de la encuesta

7. Amenidades:
- ID de Amenidad (clave primaria)
- Nombre de la amenidad
- Descripción
- Horario de disponibilidad
- Estado de reserva (disponible, reservado, en mantenimiento, etc.)

8. Incidentes:
- ID de Incidente (clave primaria)
- ID de Usuario que reporta el incidente (clave foránea)
- Descripción del incidente
- Estado del incidente (abierto, en proceso, cerrado, etc.)
- Fecha de reporte del incidente

9. Reglamentos:
- ID de Reglamento (clave primaria)
- Título del reglamento
- Descripción del reglamento
- Fecha de publicación del reglamento

10. Mascotas:
- ID de Mascota (clave primaria)
- ID de Usuario propietario de la mascota (clave foránea)
- Nombre de la mascota
- Especie
- Raza
- Fecha de registro

11. Domicilios:
- ID de Domicilio (clave primaria)
- Calle
- Número
- Colonia
- Código postal
- Ciudad
- Estado
- País

Para llevar un control detallado de los pagos, recargos y anticipos en el sistema de finanzas, se utilizará la entidad Transacciones. 

12. Transacciones:
- ID de Transacción (clave primaria)
- Tipo de Transacción (pago, recargo, anticipo, etc.)
- ID de Usuario asociado (clave foránea)
- Monto de la transacción
- Fecha de la transacción
- Descripción (opcional)
- Estado (completado, pendiente, cancelado, etc.)

Con esta entidad, podrás registrar todas las transacciones financieras realizadas por los residentes. 
Cada vez que se realice un pago, recargo o anticipo, se creará una nueva entrada en la tabla de Transacciones con la información correspondiente. 
Luego, podrás realizar consultas y cálculos basados en estas transacciones para llevar un registro preciso de los pagos, recargos y anticipos de cada residente.

13. Usuarios_Domicilios:
- ID de Relación (clave primaria)
- ID de Usuario (clave foránea)
- ID de Domicilio (clave foránea)
- Fecha de Asociación

Con esta  estructura, cada usuario puede estar asociado a uno o más domicilios a través de la tabla intermedia Usuarios_Domicilios. 
De esta manera, cumplimos con el requisito de permitir múltiples usuarios para un mismo domicilio. La fecha de asociación puede utilizarse para registrar cuándo se estableció la relación entre el usuario y el domicilio.

14. Invitaciones:
- ID de Invitación (clave primaria)
- ID de Evento (clave foránea)
- ID de Invitado (clave foránea)
- Clave Única (opcional, generada para eventos específicos)
- Fecha de Creación de la Invitación
- Estado de la Invitación (pendiente, aceptada, rechazada, etc.)

15. Eventos:
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

16. Comprobantes de Pago:
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
