```SQL
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

```SQL