-- Crear Base de Datos
CREATE DATABASE restriccionesbdg1;

-- Utilizar la base de datos
USE restriccionesbdg1;

-- Crear la tabla categoria
CREATE TABLE categoria(
categoriaid int,
nombre nvarchar(30)
);

insert into categoria
values(1,'Carnes Frias');

insert into categoria
values(1,'Vinos y Licores');

insert into categoria
values(null,'Ropa');

SELECT * FROM categoria;

drop table categoria;

create table categoria(
 categoriaid int not null,
 nombre nvarchar(30),
 constraint pk_categoria
 primary key (categoriaid)
);
insert into categoria
values(1,'Carnes Frias');

insert into categoria
values(2,'Vinos y Licores');

insert into categoria
values(3,'Ropa');

insert into categoria
values(4,'Ropa');


SELECT * FROM categoria;

drop table categoria;

create table categoria(
 categoriaid int not null,
 nombre nvarchar(30) not null,
 constraint pk_categoria
 primary key (categoriaid),
 constraint unique_nombre
 unique(nombre)
);

insert into categoria
values(1,'Carnes Frias');

insert into categoria
values(2,'Vinos y Licores');

drop table categoria;

create table categoria(
 categoriaid int not null,
 nombre nvarchar(30) not null,
 constraint pk_categoria
 primary key (categoriaid),
 constraint unique_nombre
 unique(nombre)
);
drop table producto;

create table producto(
productoid int not null,
nombreprod nvarchar (20) not null,
precio money not null,
existencia numeric(10,2) not null,
categoriaid int,
constraint pk_producto
primary key(productoid),
constraint unique_nombreprod
unique(nombreprod),
constraint chk_precio
check(precio>0 and precio<=4000),
constraint chk_existencia
check(existencia>=0),
constraint fk_producto_categoria
foreign key (categoriaid)
references categoria (categoriaid)
);

insert into categoria
values(1,'Carnes Frias');

insert into categoria
values(2,'Vinos y Licores');

INSERT INTO producto
values (1, 'Tonayan', 4000, 4, 2);

INSERT INTO producto
values (2, 'Tonayan2', 1250.6, 40, 2);

INSERT INTO producto
values (3, 'Bucanas', 200, 8, 2);

INSERT INTO producto
values (4, 'Clazon Chino', 6.3, 890, 8);

select * 
from producto as p
inner join categoria as c
ON c.categoriaid = p.productoid;

