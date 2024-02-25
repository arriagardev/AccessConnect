-- Crear la base de datos
CREATE DATABASE AccessConnect;
GO
-- Usar la base de datos recién creada
USE AccessConnect;
GO

-- Crear la tabla Usuarios
CREATE TABLE Usuarios (
    ID_de_Usuario INT PRIMARY KEY IDENTITY,
    Nombre VARCHAR(255),
    Apellido VARCHAR(255),
    Correo_electronico VARCHAR(255),
    Contrasena VARCHAR(255),
    Rol VARCHAR(255),
    Fecha_de_creacion DATETIME,
    Ultima_fecha_de_inicio_de_sesion DATETIME
);

-- Crear la tabla Invitados
CREATE TABLE Invitados (
    ID_de_Invitado INT PRIMARY KEY IDENTITY,
    ID_de_Usuario_Anfitrion INT,
    Nombre VARCHAR(255),
    Apellido VARCHAR(255),
    Correo_electronico VARCHAR(255),
    Telefono VARCHAR(20),
    Fecha_de_Ingreso_del_Invitado DATETIME,
    Fecha_de_Salida_del_Invitado DATETIME,
    Tipo_de_Invitacion VARCHAR(255),
    Descripcion_de_la_Invitacion TEXT,
    Placa_del_Vehiculo VARCHAR(20),
    Descripcion_del_Vehiculo TEXT,
    FOREIGN KEY (ID_de_Usuario_Anfitrion) REFERENCES Usuarios(ID_de_Usuario)
);

-- Crear la tabla Eventos
CREATE TABLE Eventos (
    ID_de_Evento INT PRIMARY KEY IDENTITY,
    Nombre_del_Evento VARCHAR(255),
    Descripcion_del_Evento TEXT,
    Fecha_y_Hora_del_Evento DATETIME,
    ID_de_Usuario_Anfitrion INT,
    Clave_Unica_del_Evento VARCHAR(255),
    Fecha_de_Creacion_del_Evento DATETIME,
    FOREIGN KEY (ID_de_Usuario_Anfitrion) REFERENCES Usuarios(ID_de_Usuario)
);

-- Crear la tabla Invitaciones
CREATE TABLE Invitaciones (
    ID_de_Invitacion INT PRIMARY KEY IDENTITY,
    ID_de_Evento INT,
    ID_de_Invitado INT,
    Clave_Unica VARCHAR(255),
    Fecha_de_Creacion_de_la_Invitacion DATETIME,
    Estado_de_la_Invitacion VARCHAR(255),
    FOREIGN KEY (ID_de_Evento) REFERENCES Eventos(ID_de_Evento),
    FOREIGN KEY (ID_de_Invitado) REFERENCES Invitados(ID_de_Invitado)
);

-- Crear la tabla Publicaciones
CREATE TABLE Publicaciones (
    ID_de_Publicacion INT PRIMARY KEY IDENTITY,
    ID_de_Usuario_que_la_publica INT,
    Contenido_de_la_publicacion TEXT,
    Fecha_de_publicacion DATETIME,
    Tipo_de_publicacion VARCHAR(255),
    Nivel_de_Moderacion VARCHAR(255),
    Estado_de_la_Publicacion VARCHAR(255),
    FOREIGN KEY (ID_de_Usuario_que_la_publica) REFERENCES Usuarios(ID_de_Usuario)
);

-- Crear la tabla Comentarios
CREATE TABLE Comentarios (
    ID_de_Comentario INT PRIMARY KEY IDENTITY,
    ID_de_Publicacion INT,
    ID_de_Usuario_que_hace_el_comentario INT,
    Contenido_del_comentario TEXT,
    Fecha_de_comentario DATETIME,
    Nivel_de_Moderacion VARCHAR(255),
    Estado_del_Comentario VARCHAR(255),
    FOREIGN KEY (ID_de_Publicacion) REFERENCES Publicaciones(ID_de_Publicacion),
    FOREIGN KEY (ID_de_Usuario_que_hace_el_comentario) REFERENCES Usuarios(ID_de_Usuario)
);

-- Crear la tabla Pagos
CREATE TABLE Pagos (
    ID_de_Pago INT PRIMARY KEY IDENTITY,
    ID_de_Usuario_que_realiza_el_pago INT,
    Monto_del_pago DECIMAL(10,2),
    Fecha_de_pago DATETIME,
    Estado_del_pago VARCHAR(255),
    Metodo_de_pago VARCHAR(255),
    FOREIGN KEY (ID_de_Usuario_que_realiza_el_pago) REFERENCES Usuarios(ID_de_Usuario)
);

-- Crear la tabla Encuestas
CREATE TABLE Encuestas (
    ID_de_Encuesta INT PRIMARY KEY IDENTITY,
    Pregunta_de_la_encuesta TEXT,
    Fecha_de_creacion_de_la_encuesta DATETIME,
    Fecha_de_cierre_de_la_encuesta DATETIME,
    Estado_de_la_Encuesta VARCHAR(255),
    Resultados_de_la_Encuesta TEXT
);

-- Crear la tabla Opciones_de_Respuesta
CREATE TABLE Opciones_de_Respuesta (
    ID_de_Opcion INT PRIMARY KEY IDENTITY,
    ID_de_Encuesta_asociada INT,
    Texto_de_la_Opcion TEXT,
    FOREIGN KEY (ID_de_Encuesta_asociada) REFERENCES Encuestas(ID_de_Encuesta)
);

-- Crear la tabla Registro_de_Votos
CREATE TABLE Registro_de_Votos (
    ID_de_Voto INT PRIMARY KEY IDENTITY,
    ID_de_Usuario_que_emite_el_voto INT,
    ID_de_Encuesta_a_la_que_se_refiere_el_voto INT,
    ID_de_Opcion_seleccionada_en_la_votacion INT,
    Fecha_y_hora_del_voto DATETIME,
    FOREIGN KEY (ID_de_Usuario_que_emite_el_voto) REFERENCES Usuarios(ID_de_Usuario),
    FOREIGN KEY (ID_de_Encuesta_a_la_que_se_refiere_el_voto) REFERENCES Encuestas(ID_de_Encuesta),
    FOREIGN KEY (ID_de_Opcion_seleccionada_en_la_votacion) REFERENCES Opciones_de_Respuesta(ID_de_Opcion)
);

-- Crear la tabla Amenidades
CREATE TABLE Amenidades (
    ID_de_Amenidad INT PRIMARY KEY IDENTITY,
    Nombre_de_la_amenidad VARCHAR(255),
    Descripcion_de_la_Amenidad TEXT,
    Capacidad_maxima_de_personas INT,
    Disponibilidad VARCHAR(255),
    Estado_de_la_Amenidad VARCHAR(255)
);

-- Crear la tabla Reservas_de_Amenidades
CREATE TABLE Reservas_de_Amenidades (
    ID_de_Reserva INT PRIMARY KEY IDENTITY,
    ID_de_Usuario_que_realiza_la_reserva INT,
    ID_de_Amenidad_reservada INT,
    Fecha_y_hora_de_la_reserva DATETIME,
    Estado_de_la_Reserva VARCHAR(255),
    Fecha_y_hora_de_aprobacion_de_la_reserva DATETIME,
    Detalles_adicionales_de_la_reserva TEXT,
    FOREIGN KEY (ID_de_Usuario_que_realiza_la_reserva) REFERENCES Usuarios(ID_de_Usuario),
    FOREIGN KEY (ID_de_Amenidad_reservada) REFERENCES Amenidades(ID_de_Amenidad)
);

-- Crear la tabla Incidentes
CREATE TABLE Incidentes (
    ID_de_Incidente INT PRIMARY KEY IDENTITY,
    ID_de_Usuario_que_reporta_el_incidente INT,
    Descripcion_del_incidente TEXT,
    Estado_del_incidente VARCHAR(255),
    Fecha_de_reporte_del_incidente DATETIME,
    Detalles_de_la_Mejora_Propuesta TEXT,
    Fecha_de_Atencion_del_Incidente DATETIME,
    ID_de_Usuario_de_la_Mesa_Directiva_que_atiende_el_incidente INT,
    FOREIGN KEY (ID_de_Usuario_que_reporta_el_incidente) REFERENCES Usuarios(ID_de_Usuario),
    FOREIGN KEY (ID_de_Usuario_de_la_Mesa_Directiva_que_atiende_el_incidente) REFERENCES Usuarios(ID_de_Usuario)
);

-- Crear la tabla Reglamentos
CREATE TABLE Reglamentos (
    ID_de_Documento INT PRIMARY KEY IDENTITY,
    Titulo_del_Documento VARCHAR(255),
    Descripcion_del_Documento TEXT,
    Tipo_de_Documento VARCHAR(255),
    Archivo_del_Documento VARBINARY(MAX),
    Fecha_y_hora_de_carga_del_documento DATETIME,
    Estado_del_Documento VARCHAR(255)
);

-- Crear la tabla Mascotas
CREATE TABLE Mascotas (
    ID_de_Mascota INT PRIMARY KEY IDENTITY,
    ID_de_Usuario_propietario_de_la_mascota INT,
    Nombre_de_la_mascota VARCHAR(255),
    Especie VARCHAR(255),
    Raza VARCHAR(255),
    Fecha_de_registro DATETIME,
    FOREIGN KEY (ID_de_Usuario_propietario_de_la_mascota) REFERENCES Usuarios(ID_de_Usuario)
);

-- Crear la tabla Domicilios
CREATE TABLE Domicilios (
    ID_de_Domicilio INT PRIMARY KEY IDENTITY,
    Calle VARCHAR(255),
    Numero VARCHAR(10),
    Colonia VARCHAR(255),
    Codigo_postal VARCHAR(10),
    Ciudad VARCHAR(255),
    Estado VARCHAR(255),
    Pais VARCHAR(255)
);

-- Crear la tabla Transacciones
CREATE TABLE Transacciones (
    ID_de_Transaccion INT PRIMARY KEY IDENTITY,
    ID_de_Usuario_que_realiza_la_transaccion INT,
    Tipo_de_Transaccion VARCHAR(255),
    Monto_de_la_transaccion DECIMAL(10,2),
    Fecha_de_la_transaccion DATETIME,
    Descripcion_de_la_transaccion TEXT,
    Estado VARCHAR(255),
    FOREIGN KEY (ID_de_Usuario_que_realiza_la_transaccion) REFERENCES Usuarios(ID_de_Usuario)
);

-- Crear la tabla Estado_de_Cuenta
CREATE TABLE Estado_de_Cuenta (
    ID_de_Estado_de_Cuenta INT PRIMARY KEY IDENTITY,
    ID_de_Usuario INT,
    Saldo_Actual DECIMAL(10,2),
    Detalles_de_Pagos TEXT,
    Detalles_de_Recargos TEXT,
    Detalles_de_Anticipos TEXT,
    Fecha_de_Generacion_del_Estado_de_Cuenta DATETIME,
    FOREIGN KEY (ID_de_Usuario) REFERENCES Usuarios(ID_de_Usuario)
);

-- Crear la tabla Usuarios_Domicilios
CREATE TABLE Usuarios_Domicilios (
    ID_de_Relacion INT PRIMARY KEY IDENTITY,
    ID_de_Usuario INT,
    ID_de_Domicilio INT,
    Fecha_de_Asociacion DATETIME,
    FOREIGN KEY (ID_de_Usuario) REFERENCES Usuarios(ID_de_Usuario),
    FOREIGN KEY (ID_de_Domicilio) REFERENCES Domicilios(ID_de_Domicilio)
);

-- Crear la tabla Comprobantes_de_Pago
CREATE TABLE Comprobantes_de_Pago (
    ID_de_Comprobante INT PRIMARY KEY IDENTITY,
    ID_de_Usuario_que_realiza_el_pago INT,
    Imagen_del_Comprobante VARBINARY(MAX),
    Fecha_de_Envio_del_Comprobante DATETIME,
    Estado_de_Validacion VARCHAR(255),
    Fecha_de_Validacion DATETIME,
    Detalles_del_Pago TEXT,
    ID_de_Usuario_de_la_Mesa_Directiva_que_valida_el_pago INT,
    Observaciones TEXT,
    FOREIGN KEY (ID_de_Usuario_que_realiza_el_pago) REFERENCES Usuarios(ID_de_Usuario),
    FOREIGN KEY (ID_de_Usuario_de_la_Mesa_Directiva_que_valida_el_pago) REFERENCES Usuarios(ID_de_Usuario)
);

-- Crear la tabla Recorridos_de_Seguridad
CREATE TABLE Recorridos_de_Seguridad (
    ID_de_Recorrido INT PRIMARY KEY IDENTITY,
    ID_de_Guardia_que_realiza_el_recorrido INT,
    Fecha_y_hora_de_inicio_del_recorrido DATETIME,
    Fecha_y_hora_de_fin_del_recorrido DATETIME,
    Puntos_de_Control TEXT,
    Distancia_recorrida DECIMAL(10,2),
    Duracion_del_recorrido TIME,
    Estado_del_Recorrido VARCHAR(255),
    FOREIGN KEY (ID_de_Guardia_que_realiza_el_recorrido) REFERENCES Usuarios(ID_de_Usuario)
);

-- Crear la tabla Comunicados
CREATE TABLE Comunicados (
    ID_de_Comunicado INT PRIMARY KEY IDENTITY,
    ID_de_Administrador_que_genera_el_comunicado INT,
    Fecha_y_hora_de_creacion_del_comunicado DATETIME,
    Titulo_del_comunicado VARCHAR(255),
    Contenido_del_comunicado TEXT,
    Tipo_de_comunicado VARCHAR(255),
    Estado_del_comunicado VARCHAR(255),
    FOREIGN KEY (ID_de_Administrador_que_genera_el_comunicado) REFERENCES Usuarios(ID_de_Usuario)
);

-- Crear la tabla Servicios_Programados
CREATE TABLE Servicios_Programados (
    ID_de_Servicio INT PRIMARY KEY IDENTITY,
    Tipo_de_Servicio VARCHAR(255),
    Descripcion_del_Servicio TEXT,
    Fecha_y_hora_programadas_para_el_servicio DATETIME,
    Estado_del_Servicio VARCHAR(255),
    ID_de_Residente_asociado INT,
    FOREIGN KEY (ID_de_Residente_asociado) REFERENCES Usuarios(ID_de_Usuario)
);

-- Crear la tabla Mensajes_de_Emergencia
CREATE TABLE Mensajes_de_Emergencia (
    ID_del_Mensaje INT PRIMARY KEY IDENTITY,
    ID_de_Residente_que_envia_el_mensaje INT,
    Contenido_del_Mensaje TEXT,
    Ubicacion_precisa_del_Residente_al_enviar_el_mensaje VARCHAR(255),
    Fecha_y_hora_de_envio_del_mensaje DATETIME,
    Estado_del_Mensaje VARCHAR(255),
    FOREIGN KEY (ID_de_Residente_que_envia_el_mensaje) REFERENCES Usuarios(ID_de_Usuario)
);

-- Crear la tabla Mensajes_del_Chat_con_Caseta
CREATE TABLE Mensajes_del_Chat_con_Caseta (
    ID_del_Mensaje INT PRIMARY KEY IDENTITY,
    ID_de_Residente_que_envia_el_mensaje INT,
    ID_de_Vigilancia_que_recibe_el_mensaje INT,
    Contenido_del_Mensaje TEXT,
    Fecha_y_hora_de_envio_del_mensaje DATETIME,
    Estado_del_Mensaje VARCHAR(255),
    FOREIGN KEY (ID_de_Residente_que_envia_el_mensaje) REFERENCES Usuarios(ID_de_Usuario),
    FOREIGN KEY (ID_de_Vigilancia_que_recibe_el_mensaje) REFERENCES Usuarios(ID_de_Usuario)
);

-- Crear la tabla Lista_Negra_de_Vehiculos
CREATE TABLE Lista_Negra_de_Vehiculos (
    ID_del_Vehiculo INT PRIMARY KEY IDENTITY,
    Placa_del_Vehiculo VARCHAR(20),
    Descripcion_del_Vehiculo TEXT,
    Estado_del_Vehiculo VARCHAR(255)
);

-- Crear la tabla Mantenimientos
CREATE TABLE Mantenimientos (
    ID_de_Mantenimiento INT PRIMARY KEY IDENTITY,
    Tipo_de_Mantenimiento VARCHAR(255),
    Descripcion_del_Mantenimiento TEXT,
    Fecha_y_Hora_Programadas_del_Mantenimiento DATETIME,
    Estado_del_Mantenimiento VARCHAR(255),
    Fecha_y_Hora_de_Realizacion_del_Mantenimiento DATETIME,
    Descripcion_de_las_Acciones_Realizadas TEXT,
    ID_de_Residente_asociado INT,
    FOREIGN KEY (ID_de_Residente_asociado) REFERENCES Usuarios(ID_de_Usuario)
);
