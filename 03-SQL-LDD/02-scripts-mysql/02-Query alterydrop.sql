#crear bd empresa patito
CREATE DATABASE empresapatito;

#Usar la base de datos
USE empresapatito;


#Crear una tabla empleados
CREATE TABLE empleados(
Idempleado INT not null,
nombre varchar(100) not null,
puesto varchar(50),
fechaIngreso DATE,
salario decimal(10,2),
CONSTRAINT pk_empleados
PRIMARY KEY(Idempleado)

);


#Agregar una columna en la tabla empleados
ALTER TABLE empleados
ADD COLUMN 
CorreoElectronico VARCHAR(100);


#Modificar el tipo de dato de un campo
ALTER TABLE empleados
MODIFY COLUMN Salario DECIMAL(12,2) not null;

#Renombrar el campo
ALTER TABLE empleados
RENAME COLUMN CorreoElectronico TO Email;


#Crear tabla departamentos
CREATE TABLE departamentos(
IdDepartament int not null auto_increment primary key,
NombreDepto varchar(100)

);

#Agregar un campo a la tabla empleados,
#Para que sea una Foreign key
ALTER TABLE empleados
ADD COLUMN IdDepartament int not null;

#Agregar llave foranea
ALTER TABLE empleados
ADD CONSTRAINT fk_empleados_departamento
FOREIGN KEY (IdDepartament)
REFERENCES departamentos(IdDepartament);

#Eliminar clave primaria empleados
ALTER TABLE empleados
DROP primary key;



#ELiminar la foreign key de la tabla empleados

ALTER TABLE empleados
DROP foreign key fk_empleados_departamento;

#Eliminar el autoincrement
ALTER TABLE departamentos
MODIFY COLUMN IdDepartament INT NOT NULL;

#Eliminar Primary Key de departamento

ALTER TABLE departamentos
DROP primary key;

#Constraint nuevo de verificacion en salario
ALTER TABLE empleados
ADD CONSTRAINT chk_salario
CHECK (Salario>0.0);

#ELiminar

CREATE TABLE Categoria(
Id INT not null primary key DEFAULT -1,
Nombre varchar(20),
estatus char(1) DEFAULT 'A'

);




INSERT INTO Categoria
VALUES(DEFAULT, 'Carnes', default);

INSERT INTO Categoria
VALUES(1, 'Carnes', 'D');

SELECT * FROM Categoria

#Eliminar la columna email
ALTER TABLE empleados
DROP COLUMN email;

#REGRESAR CONSTRAINT
ALTER TABLE empleados
ADD CONSTRAINT pk_empleados
PRIMARY KEY (Idempleado);


ALTER TABLE departamentos
ADD CONSTRAINT pk_departament
PRIMARY KEY (IdDepartament);

#Eliminar tabla
DROP TABLE empleados;

DROP TABLE departamentos;

DROP TABLE Categoria;



#Eliminar la base de datos
DROP DATABASE empresapatito;

