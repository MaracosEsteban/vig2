-- ---------------------------------- BORRAR BBDD ---------------------------------------------------------------------------
-- drop database if exists vigapp_database;



-- ---------------------------------- CREACION DE LA BBDD -------------------------------------------------------------------
-- create database vigapp_database;
-- use vigapp_database;

   -- create database prueba;
   -- use prueba;


-- ---------------------------------- DEFINIR USUARIOS Y PERMISOS  ----------------------------------------------------------
-- CREATE USER 'vigapp'@'localhost' IDENTIFIED BY '1234';
-- GRANT SELECT,INSERT,UPDATE,DELETE,CREATE,DROP,EXECUTE ON campingarea.* TO 'vigapp'@'localhost';


-- ---------------------------------- CREACION DE TABLAS---------------------------------------------------------------------



CREATE TABLE `usuarios` (
	`ID` INT(10) PRIMARY KEY AUTO_INCREMENT,
	`NOMBRE` VARCHAR(50) NOT NULL UNIQUE,  
    `CLAVE` VARCHAR(100) NOT NULL,
	`EMAIL` VARCHAR(100) NOT NULL
);


CREATE TABLE `centros` (
	`ID` INT(10)  PRIMARY KEY AUTO_INCREMENT,
	`NOMBRE` VARCHAR(100) NULL DEFAULT NULL COLLATE 'utf8_unicode_ci',
	`EMAIL` VARCHAR(200) NULL DEFAULT '0' COLLATE 'utf8_unicode_ci',
	`PASS` VARCHAR(100) NULL DEFAULT NULL COLLATE 'utf8_unicode_ci',
	`CIF` VARCHAR(15) NULL DEFAULT NULL COLLATE 'utf8_unicode_ci',
	`PAIS` VARCHAR(60) NULL DEFAULT NULL COLLATE 'utf8_unicode_ci',
	`CIUDAD` VARCHAR(60) NULL DEFAULT NULL COLLATE 'utf8_unicode_ci',
	`DIRECCION` VARCHAR(120) NULL DEFAULT NULL COLLATE 'utf8_unicode_ci',
	`COD_POSTAL` VARCHAR(15) NULL DEFAULT NULL COLLATE 'utf8_unicode_ci',
	`TEL` VARCHAR(15) NULL DEFAULT NULL COLLATE 'utf8_unicode_ci',
	-- PRIMARY KEY (`ID`) USING BTREE,
	UNIQUE INDEX `EMAIL` (`EMAIL`) USING BTREE,
	INDEX `CIF` (`CIF`) USING BTREE
)
COLLATE='utf8_unicode_ci'
ENGINE=MyISAM
AUTO_INCREMENT=628
;



CREATE TABLE `lecturas` (
	`ID` bigint(15)  PRIMARY KEY AUTO_INCREMENT,
	`FHLOCAL` DATETIME NULL DEFAULT NULL,
	`LATITUD` VARCHAR(20) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`LONGITUD` VARCHAR(20) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`USUARIO_ID` INT(10),
	`CENTRO_ID` INT(10) ,
    FOREIGN KEY(USUARIO_ID) REFERENCEs usuarios(ID)  ON DELETE restrict ON UPDATE CASCADE,
    foreign key(CENTRO_ID) references centros(ID)  ON DELETE restrict ON UPDATE CASCADE,
    -- PRIMARY KEY (`ID`) USING BTREE,
	UNIQUE INDEX `USUARIO_ID_CENTRO_ID_FHLOCAL` (`USUARIO_ID`, `CENTRO_ID`, `FHLOCAL`) USING BTREE,
	INDEX `FHLOCAL` (`FHLOCAL`) USING BTREE
)
COLLATE='utf8_unicode_ci'
ENGINE=MyISAM
AUTO_INCREMENT=628
;











-- ------------------------------------------------------- CARGA DE DATOS ------------------------------------------------------------------------


INSERT INTO usuarios (id,nombre,clave,email) VALUES 
(DEFAULT,"Melchor","1111","Melchor2000@hotmail.com"),
(DEFAULT,"Gaspar","2222","Gaspar2000@hotmail.com"),
(DEFAULT,"Baltasar","3333","Baltasar2000@hotmail.com");



INSERT INTO centros (ID,NOMBRE,EMAIL,PASS,CIF,PAIS,CIUDAD,DIRECCION,COD_POSTAL,TEL) VALUES 
(DEFAULT,"Krunchy-Krunchy","Krunchy@hotmail.com","SecretPass","B-76345879","España","Barcelona","Av de Mayo 55","35100",603272055),
(DEFAULT,"LifeStyle Dogs","LifeStyleDogs@hotmail.com","SecretPass","B-76000000","España","Madrid","Av  Costa Blanca 20","32123",928123456),
(DEFAULT,"Versace","Versace@hotmail.com","SecretPass","B-76111111","España","Valencia","Calle de la Reconquista 1","312345",920234566),
(DEFAULT,"Supra System","SupraSystem@hotmail.com","SecretPass","B-76222222","España","Alicante","Av Primero de mayo","32345",601275098);




INSERT INTO lecturas (ID,FHLOCAL,LATITUD,LONGITUD,USUARIO_ID,CENTRO_ID) VALUES 
(DEFAULT,"2223-05-20 23:00:15","19° 25′ 42″ N","99° 7′ 39″ O",1,629),
(DEFAULT,"2223-05-21 07:00:00","19° 25′ 42″ N","99° 7′ 39″ O",1,629),
(DEFAULT,"2223-05-15 08:05:00","20° 25′ 42″ N","60° 7′ 39″ O",2,630),
(DEFAULT,"2223-05-16 17:01:15","20° 25′ 42″ N","60° 7′ 39″ O",2,630);






















-- ------------------------------------------------------- CONSULTAS USADAS EN LA APP -------------------------------------------------------------- 

-- para hacer el login =>
select * from usuarios where nombre="nombre ingresado";


-- para listar los centros =>

select * from centros;


-- para insertar una lectura


-- INSERT INTO lecturas (ID,FHLOCAL,LATITUD,LONGITUD,USUARIO_ID,CENTRO_ID) VALUES (DEFAULT,now(),"19° 25′ 42″ N","99° 7′ 39″ O",1,629);







-- ------------------------------------------------------- CONSULTAS VARIAS ------------------------------------------------------------------------ 

select * FROM  usuarios;

select * from centros;

select * from lecturas


-- ------------------------------------------------------ Conceptos ---------------------------------------------------------------------------------

-- Fuente: https://www.ejemplos.co/longitud-y-latitud/#ixzz82GhJVBs5
-- por convención se anotan entre paréntesis, primero la latitud y después la longitud












