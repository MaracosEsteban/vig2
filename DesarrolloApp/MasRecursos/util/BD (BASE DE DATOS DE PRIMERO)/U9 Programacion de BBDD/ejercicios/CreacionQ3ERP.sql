



-- ----------------------------------------------------------Creacion de la base de datos
create database Q3ERP;
use Q3ERP;

-- -------------------------------------------------------------Creación de las tablas 

CREATE TABLE `categorias` (
 `categoria_id` bigint(20) NOT NULL AUTO_INCREMENT,
 `categoria` varchar(32) CHARACTER SET utf8 DEFAULT NULL, 
  PRIMARY KEY (`categoria_id`) 
  ) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;
  
  
  
  CREATE TABLE `marcas` (
  `marca_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `marca` varchar(32) CHARACTER SET utf8 DEFAULT NULL, 
  PRIMARY KEY (`marca_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;



CREATE TABLE `productos` ( 
 `producto_id` bigint(20) NOT NULL AUTO_INCREMENT,
 `categoria_id` bigint(20) DEFAULT NULL, 
 `marca_id` bigint(20) DEFAULT NULL, 
 `codigo` int(11) DEFAULT NULL, 
 `producto` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
 `precio` decimal(10,2) DEFAULT NULL, 
 `calidad` tinyint(1) DEFAULT NULL, 
 `estrellas` char(5) DEFAULT NULL, 
 PRIMARY KEY (`producto_id`),
 KEY `fk_productos_categorias_idx` (`categoria_id`),
 KEY `fk_productos_marcas_idx` (`marca_id`),
 CONSTRAINT `fk_productos_categorias` 
 FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`categoria_id`) ON UPDATE CASCADE,
 CONSTRAINT `fk_productos_marcas` FOREIGN KEY (`marca_id`) REFERENCES `marcas` (`marca_id`) ON UPDATE CASCADE 
 ) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;
 
 CREATE TABLE `log` (
 `log_id` int(11) NOT NULL AUTO_INCREMENT,
 `fecha` datetime DEFAULT NULL, 
 `usuario` varchar(64) DEFAULT NULL,
 `descripcion` text, PRIMARY KEY (`log_id`) 
 ) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;
 
 
 

 
 
 
 -- -------------------------------Inserción de datos 
 
 
 INSERT INTO categorias (categoria) VALUES 
 -- (''), 
 ('Portátiles'),
 ('PCs escritorio'),
 ('Impresoras'), 
 
 ('Monitores'),
 ('Teclados'),
 ('Tarjetas vídeo'),
 ('Altavoces'),
 ('Micrófonos');
 
-- GO 
 
 
 
 INSERT INTO marcas (marca) VALUES
-- (''),
 ('Brother'),
 ('HP'), ('LG'),
 ('Logitech'), ('Lenovo'),
 ('Asus'), ('Dell'),
 ('Sansumg'),
 ('Gygabyte'),
 ('Epson'),
 ('Nvidia');
 
 -- Go


-- -------------------------------------------------------------------------------------


drop database Q3ERP;

-- -----------------------------------------------------------------------------------------
--                                 Consultas

show tables;
select * from marcas;
select * from categorias;
select * from productos;

select *  from productos p join marcas m on p.marca_id=m.marca_id join categorias c on p.categoria_id=c.categoria_id;

select avg(precio) from productos where marca_id=5;




-- ------------------------------------------------------------------------------------------------
--                                  Alta de productos

insert into productos (categoria_id,marca_id,codigo,producto,precio,calidad,estrellas) 
values (1,2,4565,'Televisor 70 pulgadoas',2300.25,8,'***');

insert into productos (categoria_id,marca_id,codigo,producto,precio,calidad,estrellas) 
values (1,5,4565,'Televisor 45 pulgadoas',1700.25,8,'***');

insert into productos (categoria_id,marca_id,codigo,producto,precio,calidad,estrellas) 
values (3,5,1000,'Portatil acer',805.25,7,'****');






delete from productos where producto_id=2;














