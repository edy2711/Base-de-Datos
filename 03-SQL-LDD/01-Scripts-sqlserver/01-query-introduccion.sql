-- Lenguaje SQL- LDD
--Crear la bd empresa

CREATE DATABASE empresa;
Go

-- utilizar la base de datos creasa
USE empresa;
Go

-- Crear la tabla empleados
CREATE TABLE Empleados(
IdEmpleado int not null,
Nombre varchar(100) not null,
puesto varchar(50) not null,
FechaIngreso date,
Salario money not null,
CONSTRAINT pk_empleados
PRIMARY KEY (IdEmpleado)

);
Go
CREATE TABLE productos(
ProductoId int primary key,
NombreProducto  nvarchar(50) not null,
Existencia int not null,
PrecioUnitario money not null,

);
Go

CREATE TABLE productos2(
ProductoId int not null identity(1,1),
NombreProducto nvarchar(50) not null,
Existencia int not null,
Precio money not null,
CONSTRAINT pk_productos2
PRIMARY KEY(ProductoId),
CONSTRAINT unique_nombreproducto
UNIQUE(NombreProducto),
CONSTRAINT chk_exixtencia
CHECK (Existencia>0 AND Existencia<=1000),
CONSTRAINT chk_precio
CHECK(Precio>0.0)

);
Go
--Insertar un producto en productos sin identity
INSERT INTO productos (ProductoId, NombreProducto,  Existencia, PrecioUnitario)
VALUES(1,'Burritos de frijoles', 65, 20.99);
Go
INSERT INTO productos (ProductoId, NombreProducto,  Existencia, PrecioUnitario)
VALUES(2,'Burritos de frijoles', 65, 20.99);
Go

SELECT * FROM Productos;
GO

--Insertar en prodductos 2
INSERT INTO productos2 (NombreProducto,  Existencia, Precio)
VALUES('Burritos de Chorizo Verde', 100, 21.00);
Go
INSERT INTO productos2 (NombreProducto,  Existencia, Precio)
VALUES('Burritos de Chorizo Grueso', 450, 49.00);
Go
INSERT INTO productos2 (NombreProducto,  Existencia, Precio)
VALUES('Burritos de Chorizo Grueso2', 450, 49.00);
Go
INSERT INTO productos2 (NombreProducto,  Existencia, Precio)
VALUES('Burritos de frijol', 999, 60);
Go
SELECT * FROM productos2
Go
--Crear dos tablas con razon de cardinalidad 1 a n ccon participacion total
-- La fk es not null

CREATE TABLE categoria(
CategoriaId int not null identity(1,1),
NombreCategoria nvarchar(20) not null,
CONSTRAINT pk_categoria
PRIMARY KEY(CategoriaId),
CONSTRAINT unique_nombrecategoria
UNIQUE(NombreCategoria)
);
Go

CREATE TABLE productos3
(
productoId int not null identity(1,1),
NombreProducto nvarchar(20) not null,
existencia int not null,
PrecioUnitario money not null,
CategoriaId int not null,
CONSTRAINT pk_productos3
PRIMARY KEY (productoId),
CONSTRAINT chk_existencia3
CHECK(existencia>0 and existencia <=1000),
CONSTRAINT chk_preciounitario
CHECK(PrecioUnitario>0.0),
CONSTRAINT unique_nombreproducto3
UNIQUE(NombreProducto),
CONSTRAINT fk_productos3_categoria
FOREIGN KEY(CategoriaId)
REFERENCES categoria(CategoriaId)
);



CREATE TABLE categoria2(
Id int not null identity(1,1),
NombreCategoria nvarchar(20) not null,
CONSTRAINT pk_categoria2
PRIMARY KEY(Id),
CONSTRAINT unique_nombrecategoria2
UNIQUE(NombreCategoria)
);
Go

CREATE TABLE productos4
(
productoId int not null identity(1,1),
NombreProducto nvarchar(20) not null,
existencia int not null,
PrecioUnitario money not null,
CategoriaId int not null,
CONSTRAINT pk_productos4
PRIMARY KEY (productoId),
CONSTRAINT chk_existencia4
CHECK(existencia>0 and existencia <=1000),
CONSTRAINT chk_preciounitario4
CHECK(PrecioUnitario>0.0),
CONSTRAINT unique_nombreproducto4
UNIQUE(NombreProducto),
CONSTRAINT fk_productos4_categoria
FOREIGN KEY(CategoriaId)
REFERENCES categoria2(Id)
);

--Ejercicio tabla 1 tabla 2







-- El ejercicio pero bn hecho
Create table tabla1(
tabla1Id int not null identity(1,1),
tabla1Id2 int not null,
nombretabla1 NVARCHAR(20) not null,
CONSTRAINT pk_tabla1
primary key(tabla1Id, Tabla1Id2)

);
Go

CREATE TABLE tabla2(
idtabla2 int not null identity(1,1),
nombre nvarchar(20),
tabla1id int,
tabla1id2 int,
CONSTRAINT pk_tabla2
PRIMARY KEY(idtabla2),
CONSTRAINT fk_tabla2_tabla1
FOREIGN KEY(tabla1id, tabla1id2)
REFERENCES tabla1(tabla1Id,tabla1Id2)
);
--Crear tablas con razon de cardinlida 1 a 1
CREATE TABLE employee(
id int not null identity(1,1),
nombre nvarchar(20) not null,
ap1 nvarchar(20) not null,
ap2 nvarchar(20) not null,
sexo char(1) not null,
salario money not null,
CONSTRAINT pk_employee
PRIMARY KEY(id)

);

CREATE TABLE Department(
id int not null identity(1,1),
Nombre nvarchar(20) not null,
ubicacion nvarchar(30) not null,
employeeid int not null,
CONSTRAINT pk_department
PRIMARY KEY (id),
CONSTRAINT fk_department_employee
FOREIGN KEY (employeeid)
REFERENCES employee(id),
CONSTRAINT unique_employeeid
UNIQUE(employeeid)
);