--crear bd empresa patito
CREATE DATABASE empresapatito;
Go
--Usar la base de datos
USE empresapatito;
go

--Crear una tabla empleados
CREATE TABLE empleados(
Idempleado INT not null,
nombre varchar(100) not null,
puesto varchar(50),
fechaIngreso DATE,
salario decimal(10,2),
CONSTRAINT pk_empleados
PRIMARY KEY(Idempleado)

);
Go

--Agregar una columna en la tabla empleados
ALTER TABLE empleados
ADD CorreoElectronico VARCHAR(100);
GO

--Modificar el tipo de dato de un campo
ALTER TABLE empleados
ALTER COLUMN Salario money not null;

--Renombrar el campo
EXEC sp_rename 'empleados.CorreoElectronico',
		       'Email', 'COLUMN';
go

--Crear tabla departamentos
CREATE TABLE departamentos(
IdDepartament int not null identity(1,1) primary key,
NombreDepto varchar(100),

);
go
--Agregar un campo a la tabla empleados,
--Para que sea una Foreign key
ALTER TABLE empleados
ADD IdDepartament int not null;

--Agregar llave foranea
ALTER TABLE empleados
ADD CONSTRAINT fk_empleados_departamento
FOREIGN KEY (IdDepartament)
REFERENCES departamentos(IdDepartament);
GO
--Eliminar clave primaria empleados
ALTER TABLE empleados
DROP pk_empleados;
Go
--ELiminar la foreign key de la tabla empleados

ALTER TABLE empleados
DROP CONSTRAINT fk_empleados_departamento;
--Eliminar Primary Key de departamento

ALTER TABLE departamentos
DROP CONSTRAINT [PK__departam__3ABB940F2918DDF4];

--Constraint nuevo de verificacion en salario
ALTER TABLE empleados
ADD CONSTRAINT chk_salario
CHECK (Salario>0.0);
GO
--ELiminar

CREATE TABLE Categoria(
Id INT not null primary key DEFAULT -1,
Nombre varchar(20),
estatus char(1) DEFAULT 'A'

);
go



INSERT INTO Categoria
VALUES(DEFAULT, 'Carnes', default);


--Eliminar la columna email
ALTER TABLE empleados
DROP COLUMN email;

--REGRESAR CONSTRAINT
ALTER TABLE empleados
ADD CONSTRAINT pk_empleados
PRIMARY KEY (Idempleado);
GO

ALTER TABLE departamentos
ADD CONSTRAINT pk_departament
PRIMARY KEY (IdDepartament);
GO
--Eliminar tabla
DROP TABLE empleados;
go
DROP TABLE departamentos;
go
DROP TABLE Categoria;
go

use master
go
--Eliminar la base de datos
DROP DATABASE empresapatito;
go
