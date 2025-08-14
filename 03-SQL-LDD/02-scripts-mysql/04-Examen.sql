#Creacion de la ase de datos
CREATE DATABASE Recursos_Humanos;


Use Recursos_Humanos;

CREATE TABLE Departamentos(
idDepartamento int auto_increment,
Nombre varchar(100) not null,
CONSTRAINT pk_departamento
PRIMARY KEY (idDepartamento),
CONSTRAINT unique_nombredepto
UNIQUE (Nombre)
);

CREATE TABLE Puestos(
IdPuestos int auto_increment,
Nombre varchar(100) not null,
SueldoBase decimal(10,2),
CONSTRAINT pk_puestos
PRIMARY KEY (IdPuestos),
CONSTRAINT unique_nombrepuestos
UNIQUE (Nombre),
CONSTRAINT chk_SueldoBase
CHECK(SueldoBase>0.0)
);

CREATE TABLE Asistencias(
IdAsistencia int auto_increment,
IdEmpleado int not null,
Fecha date not null,
HoraEntrada time(6) not null,
HoraSalida time(6),
CONSTRAINT pk_Asistencias
PRIMARY KEY(IdAsistencia),
CONSTRAINT chk_fecha
CHECK(Fecha>250723),
CONSTRAINT chk_HoraSalida
CHECK(HoraSalida>HoraEntrada)


);


CREATE TABLE Incidencias(
IdIncidencias int auto_increment,
IdEmpleado int not null,
Fecha date not null,
TipoIncidencia varchar(50) not null,
Descripcion varchar(255),
CONSTRAINT pk_Incidencias
PRIMARY KEY(IdIncidencias),
CONSTRAINT chk_Tipoincidencia
CHECK(TipoIncidencia="Falta")
);

CREATE TABLE Usuarios(
IdUsuarios int auto_increment,
IdEmpleado int not null,
Usuario varchar(50) not null,
ContrasenaHash varchar(255) not null,
Rol varchar(20),
CONSTRAINT pk_Usuarios
PRIMARY KEY(IdUsuarios),
CONSTRAINT unique_Usuario
UNIQUE(Usuario)

);

CREATE TABLE Empleados(
IdEmpleado int auto_increment,
Nombre varchar(100) not null,
ApellidoPaterno varchar(100) not null,
ApellidoMaterno varchar(100) not null,
CURP char(18) not null,
FechaNacimiento date not null,
FechaIngreso date not null,
IdDepartamento int not null,
IdPuesto int not null,
Genero char(1),
EstadoEmpleado varchar(20),
CONSTRAINT pk_IdEmpleado
PRIMARY KEY (IdEmpleado)
);

