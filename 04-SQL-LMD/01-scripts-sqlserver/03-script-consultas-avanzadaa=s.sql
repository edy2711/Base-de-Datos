-- Consultas avanzadas

--Hallar todos los representantes que o bien: 
--a) trabajan en daimiel, Navarra, o castrellon; o bien 
--b) No tiene jefe y estan contratados desde junio de 1988; o11,,22,,12
--c) Superan su cuota pero tienen ventas de 600k o menos
SELECT r.Num_Empl AS [Numero Empleado], r.Nombre AS [Nombre Empleado], r.Fecha_Contrato AS [Fecha Contrato],
r.Cuota AS [Cuota de ventas], r.Ventas AS [Ventas Totales], o.Ciudad AS [Ciudad de la Oficina], r.Jefe AS [Numero de Jefe]
FROM Representantes AS r
INNER JOIN Oficinas AS o
ON o.Oficina = r.Oficina_Rep
WHERE O.Ciudad IN ('Daimiel','Navarra','Castellon') 
OR (Jefe is null and Fecha_Contrato>='1988-06-01') OR ((r.Ventas>=r.Cuota) and r.Ventas<=600000);

--Listar todos los pedidos, mostrando el numero de pedido,
--su importe y el nombre y limite de credito del cliente.

SELECT p.Num_Pedido AS [Numero de Pedido], p.Producto, p.Importe, c.Empresa AS [Nombre de Cliente], c.Limite_Credito AS [Limite de Credito]
FROM Pedidos AS p
INNER JOIN Clientes AS c
ON c.Num_Cli = p.Cliente;

--listar las oficinas con un objetivo superior a 600000 mostrando el nombre de la ciudad, el nombre del representante y el puesto
use BDEJEMPLO2;
go
SELECT o.Ciudad AS [Oficina],
r.Nombre AS [Representante],
r.Puesto[Puesto], o.Objetivo AS [Objetivo de ventas]
FROM Oficinas AS o
INNER JOIN Representantes AS r
ON o.Jef = r.Num_Empl
WHERE o.Objetivo > 600000;
;

--lIstar todos los pedidos, mostrando el numero de pedido
--importe, nombre y limite de credito del cliente

SELECT pe.Num_Pedido AS [Numero de Pedido], pe.Importe AS [Importe],
c.Empresa AS [Cliente], c.Limite_Credito AS [Limite de Credito]
FROM Pedidos AS pe
JOIN Clientes AS c ON pe.Cliente = c.Num_Cli;


SELECT *
FROM Pedidos AS pe
JOIN Clientes AS c ON pe.Cliente = c.Num_Cli;

---Listar cada representante ostrando su nombre, la ciuadad, y la region en que trabajan\
SELECT r.Nombre AS [Nombre Representante], o.Ciudad AS [Ciudad], o.Region AS [Region]
FROM Representantes AS r
INNER JOIN Oficinas AS o
ON r.Oficina_Rep = o.Oficina
;

--Listar las oficinas, nombres y puestos de sus jefes
SELECT o.Ciudad AS [Oficina],
r.Nombre AS [Representante],
r.Puesto[Puesto], o.Objetivo AS [Objetivo de ventas]
FROM Oficinas AS o
INNER JOIN Representantes AS r
ON o.Jef = r.Num_Empl
;

SELECT r.Nombre AS [Nombre Representante], o.Ciudad AS [Ciudad], o.Region AS [Region]
FROM Representantes AS r
INNER JOIN Oficinas AS o
ON o.Jef = r.Num_Empl
;


--Listar todos los pedidos mostrando el numero de pedido, el importe y la cantidad de cada producto
SELECT pe.Num_Pedido as [Numero de Pedido], pe.Importe AS [Importe], pr.Stock as [Cantidad]
FROM Pedidos AS pe
INNER JOIN Productos AS pr
ON pr.Id_fab=pe.Fab and pr.Id_producto=pe.Producto;

--Nombre de empleados y jefes


SELECT emp.Nombre AS [Empleado], jef.Nombre AS [Jefe]
FROM Representantes AS jef
Inner join Representantes AS emp
ON jef.Num_Empl = emp.Jefe;

SELECT * FROM
Representantes

--Listar llos pedidos con un importe superior a 25000 incluyendo el nombre del representante
-- numero de pedido, importe, nombre del representante que tomo nota del pedido y  el nombre del cliente

SELECT p.Producto AS [Pedido], p.Importe AS [Importe], rep.Nombre AS [Nombre de Representante], p.Num_Pedido [Numero de Pedido], c.Empresa AS [Cliente]
FROM Pedidos AS p
INNER JOIN Representantes AS rep
ON rep.Num_Empl = p.Rep
Inner Join Clientes AS c
ON c.Num_Cli=p.Cliente
WHERE p.Importe>25000;


--Listar pedidos superores a 25 k mostrando el numero de pedido, nombre del cliente que lo encargo
-- y el nombre del representante asignado al cliente y el importe

SELECT p.Importe AS [Importe], rep.Nombre AS [Nombre de Representante], p.Num_Pedido [Numero de Pedido], c.Empresa AS [Cliente]
FROM Pedidos AS p
INNER JOIN Representantes AS rep
ON rep.Num_Empl = p.Rep
Inner Join Clientes AS c
ON c.Rep_Cli=rep.Num_Empl
WHERE p.Importe>25000;
