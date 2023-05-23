-- ---------------------------------- BORRAR BBDD ---------------------------------------------------------------------------
-- drop database if exists vigapp;

-- ---------------------------------- CREACION DE LA BBDD -------------------------------------------------------------------
create database vigapp;
use prueba;

-- ---------------------------------- DEFINIR USUARIOS Y PERMISOS  ----------------------------------------------------------
CREATE USER 'vig123'@'localhost' IDENTIFIED BY 'password123';
GRANT SELECT,INSERT,UPDATE,DELETE,CREATE,DROP,EXECUTE ON campingarea.* TO 'vig123'@'localhost';


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
	`ID` BIGINT(15) NOT NULL AUTO_INCREMENT,
	`FHLOCAL` DATETIME NULL DEFAULT NULL,
	`LATITUD` VARCHAR(20) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`LONGITUD` VARCHAR(20) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`USUARIO_ID` INT(10),
	`CENTRO_ID` INT(10) ,	
	
   FOREIGN KEY (`USUARIO_ID`) REFERENCES `usuarios`(`ID`) ON DELETE restrict ON UPDATE CASCADE,
	FOREIGN KEY (`CENTRO_ID`) REFERENCES `centros`(`ID`) ON DELETE restrict ON UPDATE CASCADE,
	--	 FOREIGN KEY (`CENTRO_ID`) REFERENCES `centros`(`ID`) ,
   
	
	PRIMARY KEY (`ID`) USING BTREE,
	UNIQUE INDEX `USUARIO_ID_CENTRO_ID_FHLOCAL` (`USUARIO_ID`, `CENTRO_ID`, `FHLOCAL`) USING BTREE,
	INDEX `FHLOCAL` (`FHLOCAL`) USING BTREE
	
)
COLLATE='utf8_unicode_ci'
ENGINE=InnoDB
AUTO_INCREMENT=628
;

-- ------------------------------------------------------- CARGA DE DATOS ------------------------------------------------------------------------


INSERT INTO usuarios (id,nombre,clave,email) VALUES 
(DEFAULT,"Melchor","Melchor","Melchor2000@hotmail.com"),
(DEFAULT,"Gaspar","Gaspar","Gaspar2000@hotmail.com"),
(DEFAULT,"Baltasar","Baltasar","Baltasar2000@hotmail.com");

