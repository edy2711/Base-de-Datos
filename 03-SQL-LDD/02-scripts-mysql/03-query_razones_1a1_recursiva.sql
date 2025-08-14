CREATE DATABASE ejercicio1999;

USE ejercicio1999;

CREATE TABLE Empleado(
empleadoid int not null auto_increment,
Nombre nvarchar(15) Not null,
Apellido1 nvarchar(15) not null,
Apellido2 nvarchar(15),
Direccion nvarchar(50) not null,
salario decimal(10,2) not null,
Jef int,
departamento int not null,
CONSTRAINT pk_empleado
PRIMARY KEY (empleadoid),
CONSTRAINT chk_salario
CHECK (salario between 200 and 50000),
CONSTRAINT fk_empleado_jefe
FOREIGN KEY (Jef)
REFERENCES Empleado(empleadoid)
ON DELETE NO ACTION
ON UPDATE NO ACTION
);


CREATE TABLE Departamento(
DepartamentoId int not null auto_increment,
NompreDepto nvarchar(15) not null,
estatus char(2) not null,
administrador int not null,
CONSTRAINT pk_departamento
PRIMARY KEY (DepartamentoId),
CONSTRAINT unique_nombredepto
UNIQUE(NompreDepto),
CONSTRAINT chk_estatus
CHECK ( estatus in ('SI','NO')),
CONSTRAINT fk_empleado_depto
FOREIGN KEY(administrador)
REFERENCES Empleado(empleadoid)
);


ALTER TABLE Empleado
ADD CONSTRAINT fk_empleado_depto1
FOREIGN KEY (departamento)
REFERENCES Departamento(DepartamentoId);


CREATE TABLE Ubicacion(
UbicacionId int not null auto_increment,
Ubicacion nvarchar(20) not null,
DeptoId int not null,
CONSTRAINT pk_ubicacion
PRIMARY KEY (UbicacionId),
CONSTRAINT unique_deptoid
UNIQUE(DeptoId),
CONSTRAINT fk_ubicacion_depto
FOREIGN KEY(DeptoId)
REFERENCES Departamento(DepartamentoId)


);
