
USE bdjoins
go

SELECT * FROM Categoria;
--Inner join
Select * from Categoria AS c
inner join Producto as p
on c.idCategoria = p.categoria;

--Left join o outer 
Select * from Categoria AS c
left outer join Producto as p
on c.idCategoria = p.categoria;

--Mosrar categoruas sin productos asignados
Select c.idCategoria,c.nombre from Categoria AS c
left outer join Producto as p
on c.idCategoria = p.categoria
WHERE p.categoria is null;

--Rigth join Toma todos los datos de la tabla derecga y los que coinciden con la tabla izquierda
--y los que no los pone en null
Select * from Categoria AS c
Right outer join Producto as p
on c.idCategoria = p.categoria;

--Selecciona todos aquellos productos que no tienen categoria asignada
Select p.nombre AS [Nombre Producto],
p.precio AS [Precio]
from Categoria AS c
Right outer join Producto as p
on c.idCategoria = p.categoria
WHERE Categoria is null;


/*  
FULL JOIN 
Obtiene los datos de la tabla izquierda y derecha y las coincidencias entre ambas
*/
Select * from Categoria AS c
FULL join Producto as p
on c.idCategoria = p.categoria;

Select * from Categoria AS c
CROSS JOIN Producto as p;

Select * from Categoria AS c,
 Producto as p;


 Select * from Categoria AS c,
 Producto as p
WHERE c.idCategoria = p.categoria;

/*GREGACIONNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNN

COUNT(*), cuenta las filas
COUNT(CAMPO), cuenta las filas pero no cuenta los null
MIN((), obtiene el valor minimo de un campoo
MAX(), obtiene el valor maximo de un campo
avg(), obtiene la media arimetica o promedio
sum(), obtiene el total o la sumatoria

*/

use NORTHWND;

--Cuantos clientes hay

SELECT count(*) AS [Numero de Clientes]
from Customers;


--Cuantas ventas se han realizado
SELECT count(*) AS [Ventas]
FROM Orders;

--Cuantas ventas se realizaron en 1996
Select count(*)
from Orders
WHERE DATEPART(YEAR, OrderDate) = 1996;

-- Selecciona la venta de la fecha mas antigua que se hizo
select MIN(OrderDate) AS [Primera venta] from Orders;


--Seleccionar el total que se ha vendido
SELECT sum(UnitPrice*Quantity) AS [Total de Ventas]
FROM [Order Details]

--Seleccionar el total de ventas entre 1996 y 1997
SELECT sum(UnitPrice*Quantity) AS [Total de Ventas]
FROM [Order Details] AS od
INNER JOIN Orders AS o
ON o.OrderID = od.OrderID
WHERE DATEPART(yy,o.OrderDate) between 1996 and 1997
AND o.CustomerID = 'AROUT'

--Seleccionar las ventas totales hechas a cada uno de nuestros clientes 
select c.CompanyName as [Cliente], Sum(UnitPrice * Quantity) as [Total de Ventas]
from [Order Details] as od inner join Orders as o
on o.OrderID = od.OrderID inner join Customers as c
on c.CustomerID = o.CustomerID
where datepart(year, o.OrderDate) between 1996 and 1997
GROUP BY c.CompanyName;