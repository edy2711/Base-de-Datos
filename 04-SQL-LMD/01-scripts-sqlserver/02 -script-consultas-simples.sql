--Lenguaje SQL - LMD
-- CONSULTAS SUMPLES
USE NORTHWND
go
--Seleccionar todos los clientes
SELECT * 
FROM Customers;

--seleccionar todos los clientes pero solamente mostrando,
--la clave, el nombre del cliente, la ciudad y el pais  (Proyeccion)
SELECT CustomerID, CompanyName, City, Country
FROM Customers;
--Alias de Clolumna
SELECT CustomerID AS NumeroCliente, CompanyName AS 'Nombre Cliente', City Ciudad, Country AS [Ciudad chida]
FROM Customers;

--Campos calculados
--Seleccionar las ordenes de compra mostrando los productos, la cantidad
-- vendida, precio de venta, descuento y total

SELECT  ProductID AS [Nombre Producto], UnitPrice AS [Precio], Quantity AS [Cantidad], Discount AS [Descuento],
(UnitPrice*Quantity) AS [Importe Sin Descuento],
(UnitPrice*Quantity * (1 - Discount)) AS [Importe]
FROM [Order Details]
--Seleccionar las ordenes de compra, mostrando el cliente al que se le vendio, el empleado que la realizo
-- la fecha de la orden, el transportista y la fecha de la orden dividida en anio, mes, dia, trimestre.
SELECT OrderID AS [Numero de Orden], OrderDate AS [Fecha de Orden], CustomerID AS [Cliente], EmployeeID As [Empleado], ShipVia AS [Transportista],
DATEPART(Year, OrderDate) AS [Anio de la Compra],
DATEPART(MM, OrderDate) as [Mes de la compra],
DATEPART(d, OrderDate) AS [Dia de compra],
DATEPART(qq,OrderDate) AS [Trimestre],
DATEPART(WEEK, OrderDate) AS [Semana],
DATEPART(WEEKDAY, OrderDate) AS [Dia de la semana],
DATENAME(WEEKDAY, OrderDate) AS [Nombre Dia]
FROM Orders
ORDER BY 9 ;

--ORDER BY _> orddenar acendente y decendente
--- seleccionar empleados ordenados por su pais
SELECT (TitleOfCourtesy + '' + FirstName + '' + LastName) AS [Nombre Completo],
Country AS [Pais], City AS [Ciudad]
FROM Employees;

SELECT CONCAT(TitleOfCourtesy , '' , FirstName , '' , LastName) AS [Nombre Completo],
Country AS [Pais], City AS [Ciudad]
FROM Employees
ORDER BY  Country;

SELECT CONCAT(TitleOfCourtesy , '' , FirstName , '' , LastName) AS [Nombre Completo],
Country AS [Pais], City AS [Ciudad]
FROM Employees
ORDER BY  Country DESC;

SELECT CONCAT(TitleOfCourtesy , '' , FirstName , '' , LastName) AS [Nombre Completo],
Country AS [Pais], City AS [Ciudad]
FROM Employees
ORDER BY  2 DESC;

SELECT CONCAT(TitleOfCourtesy , '' , FirstName , '' , LastName) AS [Nombre Completo],
Country AS [Pais], City AS [Ciudad]
FROM Employees
ORDER BY  2 DESC;

SELECT CONCAT(TitleOfCourtesy , '' , FirstName , '' , LastName) AS [Nombre Completo],
Country AS [Pais], City AS [Ciudad]
FROM Employees
ORDER BY  [Nombre Completo] DESC;

SELECT CONCAT(TitleOfCourtesy , '' , FirstName , '' , LastName) AS [Nombre Completo],
Country AS [Pais], City AS [Ciudad]
FROM Employees
ORDER BY  Country, City;


SELECT CONCAT(TitleOfCourtesy , '' , FirstName , '' , LastName) AS [Nombre Completo],
Country AS [Pais], City AS [Ciudad]
FROM Employees
ORDER BY  Country DESC, City DESC;


SELECT CONCAT(TitleOfCourtesy , '' , FirstName , '' , LastName) AS [Nombre Completo],
Country AS [Pais], City AS [Ciudad]
FROM Employees
ORDER BY  Country ASC, City DESC;


SELECT CONCAT(TitleOfCourtesy , '' , FirstName , '' , LastName) AS [Nombre Completo],
Country AS [Pais], City AS [Ciudad]
FROM Employees
ORDER BY  2 ASC, 3 DESC;


SELECT CONCAT(TitleOfCourtesy , '' , FirstName , '' , LastName) AS [Nombre Completo],
Country AS [Pais], City AS [Ciudad]
FROM Employees
ORDER BY  1 ASC,Country DESC, 3 DESC;





--Seleccionar todos los productos cuyo precio sea mayor a 40.3
--(Mostrar el numero, nombre y precio unitario del producto)
SELECT ProductID AS [Numero de Producto],
ProductName AS [Nombre del Producto],
UnitPrice AS [Precio Unitario]
FROM Products

WHERE UnitPrice > 40.3;

SELECT ProductID AS [Numero de Producto],
ProductName AS [Nombre del Producto],
UnitPrice AS [Precio Unitario]
FROM Products

WHERE ProductName = 'Carnarvon Tigers';


SELECT ProductID AS [Numero de Producto],
ProductName AS [Nombre del Producto],
UnitPrice AS [Precio Unitario]
FROM Products

WHERE ProductName <> 'Carnarvon Tigers';



SELECT ProductID AS [Numero de Producto],
ProductName AS [Nombre del Producto],
UnitPrice AS [Precio Unitario]
FROM Products

WHERE ProductName <> 'Carnarvon Tigers';


SELECT ProductID AS [Numero de Producto],
ProductName AS [Nombre del Producto],
UnitPrice AS [Precio Unitario]
FROM Products

WHERE ProductName != 'Carnarvon Tigers';
--SELECCIONAR todas las ordenes que sean de brazil, Rio de Janeiro, mostrando
-- Solo el umero de orden, la fecha de orden, pais de envio, ciudad y transportista

SELECT OrderID AS [Numero de Orden],
OrderDate AS [Fecha de Orden],
ShipCountry AS [Pais de Envio],
ShipCity AS [Ciudad],
ShipVia AS [Transportista]

FROM Orders

WHERE ShipCountry = 'Brazil' and ShipCity = 'Rio de Janeiro';

-- INNER JOIN
SELECT o.OrderID AS [Numero de Orden],
o.OrderDate AS [Fecha de Orden],
o.ShipCountry AS [Pais de Envio],
o.ShipCity AS [Ciudad],
s.ShipperID AS [Numero Transportista],
s.CompanyName AS [Transportista]
FROM Orders AS o
INNER JOIN Shippers AS s
ON s.ShipperID = o.ShipVia

WHERE ShipCity = 'Rio de Janeiro';

-- Seleccionar todas las ordenes mostrando lo mismo que la consulta anterior
-- Todas aquellas que no tengan region de envio
SELECT o.OrderID AS [Numero de Orden],
o.OrderDate AS [Fecha de Orden],
o.ShipCountry AS [Pais de Envio],
o.ShipCity AS [Ciudad],
s.ShipperID AS [Numero Transportista],
s.CompanyName AS [Transportista],
o.ShipRegion AS [Region de envio]
FROM Orders AS o
INNER JOIN Shippers AS s
ON s.ShipperID = o.ShipVia

WHERE ShipRegion is not null;


-- SELECCIONAR todas las ordenes enviadas a brazil, alemania, y mexico que tengan region
--Ordenar de forma dsc por el shi country
SELECT o.OrderID AS [Numero de Orden],
o.OrderDate AS [Fecha de Orden],
o.ShipCountry AS [Pais de Envio],
o.ShipCity AS [Ciudad],
s.ShipperID AS [Numero Transportista],
s.CompanyName AS [Transportista],
o.ShipRegion AS [Region de envio]
FROM Orders AS o
INNER JOIN Shippers AS s
ON s.ShipperID = o.ShipVia

WHERE (ShipCountry = 'Brazil' or ShipCountry = 'Mexico' or ShipCountry = 'Germany')   and ShipRegion is not null
ORDER BY 3 desc ;

use BDEJEMPLO2;
go

--select cuantos puestos diferentes tienen los representantes
SELECT nombre, puesto
FROM Representantes
ORDER BY 2;

SELECT DISTINCT puesto
FROM Representantes
;

--Seleccionar todos los paises diferentes de mis clientes
SELECT DISTINCT country, city
FROM customers;

SELECT country, city, COMPANYNAME
FROM customers
ORDER BY 1 ;


SELECT country, city, COMPANYNAME
FROM customers
WHERE CITY = 'Buenos Aires';

SELECT DISTINCT CategoryID
FROM products;
--Puestos diferentes d e los reoresentantes
--funciones de agregado, solamente regresan un solo registro,, no se puede utilizar una 
SELECT COUNT(DISTINCT Puesto) AS [Numero de Puestos]
FROM Representantes;
--Seleccionar el precio minimo de los productos

SELECT *
FROM Productos
order by precio asc;

SELECT min(Precio) AS [Precio minimo]
FROM Productos;

--Listar las oficinas cuyas ventas estan por debajo del 80 porciento de sus  objetivos
--Ciudad ventas y objetivo
USE BDEJEMPLO2;
go

SELECT Ciudad, Ventas, Objetivo, (.8*Objetivo) AS [80% del Objetivo]
FROM OFICINAS
WHERE Ventas<(.8*Objetivo);

--Seleccionar los primeros 5 registros de mis pedidos
-- numero, fecha, producto, cantidad e importe
SELECT TOP 5 Num_Pedido AS[Numero de Pedido], Fecha_Pedido, Producto, Cantidad, Importe
FROM Pedidos
ORDER BY 5 DESC;

--TEST DE RANGO O BETWEEN
--Hallar los pedidos del ultimo trimestre 
SELECT Num_Pedido, Fecha_Pedido, FAB, PRODUCTO, Importe
FROM Pedidos
WHERE Fecha_Pedido BETWEEN '1989-10-01' AND '1989-12-31'
ORDER BY Fecha_Pedido DESC;

SELECT Num_Pedido, Fecha_Pedido, FAB, PRODUCTO, Importe
FROM Pedidos
WHERE DATEPART(quarter,Fecha_Pedido) = 4
ORDER BY Fecha_Pedido DESC;

--Hallar los pedidos que tienen un importe entre 30k y 39,999.99
SELECT Num_Pedido, Fecha_Pedido, FAB, PRODUCTO, Importe
FROM Pedidos
WHERE Importe BETWEEN 30000 AND 39999.99
ORDER BY Importe DESC;

--Listar los representantes cuyas ventas no se encuentran entre el 80 y 120 porciento de su cuota
SELECT Nombre, Ventas, Cuota
FROM Representantes
WHERE Ventas not BETWEEN (.8*Cuota) and (1.2*Cuota);

SELECT Nombre, Ventas, Cuota
FROM Representantes
WHERE NOT(Ventas >= (.8*Cuota) and  Ventas <=(1.2*Cuota));
--Test de Pertenencia a conjuntos (In)
--Hallar los pedidos de cuatto animales en contretro[kjdjbeugf8eyom,h


SELECT Num_Pedido, Fecha_Pedido, IMPORTE, REP
FROM Pedidos
WHERE REP IN (107,109,101,103);


SELECT Num_Pedido, Fecha_Pedido, IMPORTE, REP
FROM Pedidos
WHERE REP = 107 OR
REP = 109 OR
REP = 101 OR
REP = 103;

SELECT Num_Pedido, Fecha_Pedido, IMPORTE, REP
FROM Pedidos
WHERE REP NOT IN (107,109,101,103);



SELECT Num_Pedido, Fecha_Pedido, IMPORTE, REP
FROM Pedidos
WHERE NOT (REP = 107 OR
REP = 109 OR
REP = 101 OR
REP = 103);

--Test de encaje de patrones  (Like)

SELECT *
FROM CLIENTES
WHERE Empresa LIKE 'A%';


SELECT *
FROM CLIENTES
WHERE Empresa LIKE '&L';


SELECT *
FROM CLIENTES
WHERE Empresa LIKE '%er%';


SELECT * FROM Clientes
WHERE Empresa like '[A-D]%';

SELECT *
from Clientes
WHERE Empresa LIKE '[^ADf]%';


SELECT * FROM Clientes
WHERE Empresa like '_ilas';

SELECT * FROM Clientes
WHERE Empresa like '____';

--Hallar todos los representantes que o bien: 
--a) trabajan en daimiel, Navarra, o castrellon; o bien 
--b) No tiene jefe y estan contratados desde junio de 1988; o11,,22,,12
--c) Superan su cuota pero tienen ventas de 600k o menos
SELECT * FROM Oficinas;
SELECT * FROM Representantes;


SELECT Nombre, Fecha_Contrato, Puesto
FROM Representantes
WHERE Oficina_Rep IN (11,22,12) 
OR (Jefe is null and Fecha_Contrato>='1988-06-01') OR ((Ventas>=Cuota) and Ventas<=600000);

