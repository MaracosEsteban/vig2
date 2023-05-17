-- ---------------------------------- Borrar base de dataos
-- drop database if exists campingarea;

-- ---------------------------------Creacion de la base de deatos-----------------------
create database campingarea;
use campingarea;

-- ---------------------------------Definir usuarios y permisos   -----------------------------------
CREATE USER 'camping123'@'localhost' IDENTIFIED BY 'password123';
GRANT SELECT,INSERT,UPDATE,DELETE,CREATE,DROP,EXECUTE ON campingarea.* TO 'camping123'@'localhost';

-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------
-- -------------------------------- Creación de la tabla usuarios---------------------------------------------------------------------------------------------------
-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------
create table usuarios(
id_usuario integer auto_increment not null,
nom_usuario varchar(50) not null unique,
clave_acceso varchar(100),  
administrador boolean,
usuario_activo boolean default true,
primary key(id_usuario));

ALTER TABLE usuarios ADD COLUMN usuario_activo boolean default true;



-- -------Varios para esta tabla
insert into usuarios(nom_usuario) value("alexa");
use campingarea;
drop table usuarios;
delete from usuarios where nom_usuario="alexa";
insert into usuarios value(default,"Jose","3ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4",true,true);
insert into usuarios value(default,"Adrián","3ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4",false,true);
select * from usuarios;
select nom_usuario,clave_acceso from usuarios where nom_usuario="Jose";
update usuarios set clave_acceso="3ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4" where nom_usuario="Adrian";
update usuarios set clave_acceso="3ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4" where nom_usuario="Adrian";

-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------
-- -------------------------------- Creación de la tabla clientes/viajeros ----------------------------------------------------------------------------------------
-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE clientes (
id_clientes integer auto_increment not null,
codigo_MRZ  varchar(200),
num_doc varchar(30) NOT NULL,
tipo_doc varchar(30) NOT NULL,   
fecha_exp_doc date,
prim_apellido varchar(30) NOT NULL,
segu_apellido varchar(30),
nombre varchar(30),
sexo boolean,                       
Fecha_nacimiento date,                  
PaisNacionalidad varchar(30),   
matricula varchar(30),
telefono varchar(30),
imagen_firma longblob,   
e_mail varchar(50),
codigo_postal char(10) DEFAULT NULL,   
comentario text, 
constraint clientes_clave_alternativa  unique(num_doc,tipo_doc),
constraint cliente_clave_primaria primary key(id_clientes)
); 

-- -------Varios para esta tabla
drop table if exists clientes;
insert into clientes(id_clientes,codigo_MRZ,num_doc,tipo_doc,fecha_exp_doc,prim_apellido,segu_apellido,nombre,sexo,fecha_nacimiento,PaisNacionalidad,matricula,telefono,e_mail,comentario) 
values(default,"<<<<jkj<<<<<<","42253370R","DNI","2022-07-13","Culzoni","Cuadrado","Marcos",true,"2022-07-13","Argentina","XZA7501","03492-2515666","MCULZONI@HOTMAIL.COM","Blablabla");

insert into clientes(id_clientes,codigo_MRZ,num_doc,tipo_doc,fecha_exp_doc,prim_apellido,segu_apellido,nombre,sexo,fecha_nacimiento,PaisNacionalidad,matricula,telefono,e_mail,comentario) 
values(default,"<<<<jkj<<<<<<","42253371R","DNI","2022-07-12","Cuadroado","Ochoa","Esteban",true,"2022-07-13","Francia","XZA7501","03492-2515666","MCULZONI@HOTMAIL.COM","Blablabla");



 use campingarea;
 insert into clientes(id_clientes,codigo_MRZ,num_doc,tipo_doc,prim_apellido,fecha_exp_doc ) values(default,"<<<<jkj<<<<<<","42253381R","Licencia conducir","perez","2022-07-13");
 select * from clientes;
 delete from clientes;

-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- -------------------------------- Creación de la tabla parcelas----------------------------------------------------------------------------------------------------
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE parcelas (
id_parcela integer auto_increment not null,
num_parcela integer not null unique,
tipoParcela varchar(30) default "Clásica", 
comentario_cliente varchar(300) default null, 
comentario_interno varchar(300)default null, 
en_servicio boolean default true,             
electricidad  boolean default false,        
potenciaAmpers double default 6,               
id_medidor_electricidad integer default null,  
superficie_m2 integer default null,             
PRIMARY KEY (id_parcela));

-- -------Varios para esta tabla
drop table parcelas;
delete from parcelas;
delete from parcelas where id_parcela > 20;
insert into parcelas value(default,24,default,"pierde agua","llave no funciona",true,true,6,122,25);
use campingarea;
select * from parcelas;
select * from parcelas order by num_parcela;



-- Una estancai puede ser en una o varias parcela => Actualizar diseño de las BBDD para que lo permita


-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- ------------------------------- Creacion de la tabla cliente_parcela( asocia el cliente con la parcela y la fecha y hora de checkin)-------------------
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE cliente_parcela (
id_cliente_parcela integer auto_increment not null,
cliente integer not null,
parcela integer not null,
fecha_hora_checkin datetime not null,
fecha_hora_checkout datetime,
chekout boolean default false,       -- con valor true significa que el check out esta hecho el cliente a dejado la parcela
importe_total decimal(6,2),
-- importe_pagado decimal(6,2),         -- Esto no me termina de convencer  probablemente halla que hacer otra tabla con todos los pagos a cuenta
pagado boolean default false,         -- por ahora  no le doy opción a pogos parciales o pago todo o no 

comentario_cliente text,                        -- cualquier nota aclaracion a cerca de este check in para el cliente
comentario_interno text,                        -- culquier comentario sobre el cliente que estimemos conveniente como alguna necesidad especial

foreign key (cliente) references clientes(id_clientes) on delete restrict on update cascade,
foreign key(parcela) references parcelas(id_num_parcela) on delete restrict on update cascade,
unique(cliente,parcela,fecha_hora_checkin),
PRIMARY KEY (id_cliente_parcela)); -- la clave principal está formada por la parcela elcliente que la ocupa y la  hora del checkin, lo cual hace imposible que se repita


-- En relacion con esta tabla

-- Documentos que se generan cuando se hace un check in
-- 1) Se Genera el "Parte" con los datos del cliente firmado ya sea electrónicamente  o en papel
-- 2) Se Imprime un plano que se le entrega al cliente donde constan la huvicación de las salidas de emergencia, asi como informacion local de interés 
--    a esta información se le sumarán la de los códigos Wi-Fi , puértas de entrada , la parcela que corresponde al cliente que acaba de contratar el 
--    también prodría incluirse en esta hoja la fechay hora de entrada, fecha y hora de salida y la matícula del vehículo
--    También se puede imprimir alguna informacón espesífic sobre la parcela elegida

-- 3) Se genera la factura o ticket  si la pesona paga al momento si no se genera al momento de la salida que pagara la estadía.

-- -------Varios para esta tabla
 drop table if exists cliente_parcela;
 
 
 
 -- ------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- ------------------------------- Creacion de la tabla  cliente_parcela_otros
-- -------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- en esta tabla quiero reflejar todas las persona que viajan con  un "cliente_parcela" al momento de hacer el check-in




CREATE TABLE cliente_parcela_otros(
cliente_parcela integer,
cliente integer,
foreign key (cliente_parcela) references cliente_parcela(id_cliente_parcela) on delete restrict on update cascade,
foreign key (cliente) references clientes(id_clientes) on delete restrict on update cascade,
PRIMARY KEY (cliente_parcela,cliente)); -- la clave principal está formada por la parcela elcliente que la ocupa y la  hora del checkin, lo cual hace imposible que se repita




-- -------Varios para esta tabla
 drop table if exists cliente_parcela_otros;
 
 
 
 
-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------
-- ------------------------------- Creacion de la tabla cliente_parcela_servicios-----------------------------------------------------------------------------------
-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Esta tabla realaciona el (cliente,parcela contratada,período de tiempo) con los (servicios y contidades contratadosa)

create table cliente_parcela_servicios(
cliente_parcela integer auto_increment not null,
servicio integer not null ,
cantidad decimal(6,2),
precio_contratacion decimal(6,2), -- Guardo el precio al que fué contratado el servicio para que no cambie aunque actualice el precio del servicio
foreign key(cliente_parcela) references cliente_parcela(id_cliente_parcela) on delete restrict on update cascade, 
foreign key(servicio) references servicios(id_servicios) on delete restrict on update cascade,
primary key(cliente_parcela));

-




-- -------Varios para esta tabla
 drop table if exists cliente_parcela_servicios;
 
 

-- -------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- -------------------------------- Creación de la tabla servicios_productos -----------------------------------------------------------------------------------------------------
-- -------------------------------------------------------------------------------------------------------------------------------------------------------------------
create table  serv_prod (
id_serv_prod integer auto_increment not null,
descripcion  varchar(50),
unidad  varchar(15),
precio decimal(8,2),
cuenta_num varchar(12),
actualizacion date,
iva_incluido_porcent decimal(5,2),
serv_prod boolean default true,
PRIMARY KEY (id_serv_prod));


-- -------Varios para esta tabla
use campingarea;
drop table serv_prod;
delete from serv_prod;
select * from serv_prod;
delete from serv_prod where id_serv_prod =1;

-- -------Carga de datos de prueba
insert into serv_prod(descripcion,unidad,precio,cuenta_num,actualizacion,iva_incluido_porcent,serv_prod) values("Dos adultos + autocaravana < 8 metors","dia",14.00,"1.1.1.0025","2022-07-13",10.00,false);


insert into serv_prod(descripcion,unidad,precio,cuenta_num,actualizacion,iva_incluido_porcent,serv_prod) values('Dos adultos + autocaravana < 8 metors','dia',14.00,'1.1.1.0025','2022-07-13',10.00,false);




insert into serv_prod value(default,"Dos adultos + autocaravana < 8 metors","dia",14.00,"1.1.1.0025","2022-07-13",10.00,false);
insert into serv_prod value(default,"Dos adultos + autocaravana > 8 metors","dia",17.00,"1.1.1.0025","2022-07-13",10.00, default);
insert into serv_prod value(default,"Electricidad 6 amperios/h","dia",17.00,"1.1.1.0025","2022-07-13",15.00,default);
insert into serv_prod  value(default,"Persona extra","dia",3.00,"1.1.1.0025","2022-07-13",10.00,default);
insert into serv_prod value(default,"Carga-Descarga aguas","unidad",5.00,"1.1.1.0025","2022-07-13",10.00,default);

insert into serv_prod value(default,"Menor extra","unidad",3.00,"1.1.1.0025","2022-07-13",20.00, default);

-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------
-- -------------------------------- Creación de la tabla configuracion(por ahora registro unico con las distintas configuraciones ) -------------------------------
-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------



-- Ya que guardo la configuracion en una tabla de una base de datos podría cada vez que se hace una modificadion crear un nuevo registro, asi tengo la configuracion anterior 
-- guardada en la base de datos, el programa al iniciarse leeria la ultima fila (la fila mas reciente)

-- ://es.stackoverflow.com/questions/21316/c%C3%B3mo-guardar-imagen-en-mysql

create table configuracion (
nombre_empresa_facturacion varchar(50),
codigo_i_fiscal varchar(9),
direccion_empresa varchar(50),
telefono_empresa varchar(20),
numero_proxima_ticket integer,  
grupo_tickets varchar(10),
numero_proximo_ticket_rectificativo integer,
grupo_ticket_rectificativos varchar(8),
cobro_x_24_horas boolean,
horario_checkout time,
codigo_puerta varchar(20),
codigo_wi_fi  varchar(20),
horarios_de_oficina varchar (100),
imagen_plano_area longblob, 
cantidad_parcelas_activas integer,            
firma_digitalizada boolean, 
usuario_creador_configuracion     integer,   
fecha_hora_creacion_config timestamp,
foreign key(usuario_creador_configuracion) references usuarios(id_usuario) on delete restrict on update cascade,
primary key(fecha_hora_creacion_config)
);
-- ---------------------------------Varios para esta tabla
use campingarea;
drop table configuracion;
select * from configuracion;
delete from configuracion where imagen_plano_area is null;

insert into configuracion values("Paradise SA","cif","dirc.empresa","telef.empresa",55,"grupotick",2,"grupoREc",true,"23:25:12","456","123","horario oficina",null,null,null,null,current_timestamp());
select current_timestamp();

-- ------------------------------Listar todas las tablas existentes
show tables;


-- ----------------------------- Comandos que voy a usar en el programa----------------------------------------------------------------------------------------------

-- varios
select * from usuarios;






-- ------------------------------------------------------------ PRUEBAS VARIAS

create table tiempo_imagen(
id_tiempo_imagen integer auto_increment not null,
horario_chekout time,
foto longblob,
primary key(id_tiempo_imagen)
);



-- Varios tabla tiempo
drop table tiempo_imagen;
use campingarea;
delete from tiempo_imagne ;
insert into tiempo_imagen values(default,"23:45:00",null);
insert into tiempo_imagen values(default,"22:00:00",null);
select localtimestamp();

delete from tiempo_imagen where id_tiempo_imagen=8;
select * from tiempo_imagen;
select * from tiempo_imagen order by id_tiempo asc limit 1;

insert into tiempo_imagen(horario_chekout,foto) values("05:00:00",null);


 

SELECT COUNT(*) FROM mysql.time_zone_name;


-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- ¿Crear un scrip para que ademas de crear las tablas cargue un minimimo de datos en las tablas?







-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------






