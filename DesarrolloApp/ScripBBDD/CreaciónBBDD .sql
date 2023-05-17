-- ------------------------------------------------------- CREACION DE TABLAS---------------------------------------------------------------------

create table usuarios(
	id int primary key AUTO_INCREMENT,
	nombre varchar(50) not null unique,  
	clave varchar(100) not null,
	email varchar(100) not null
);



CREATE TABLE `centros` (
	`ID` INT(10) NOT NULL AUTO_INCREMENT,
	`NOMBRE` VARCHAR(100) NULL DEFAULT NULL COLLATE 'utf8_unicode_ci',
	`EMAIL` VARCHAR(200) NULL DEFAULT '0' COLLATE 'utf8_unicode_ci',
	`PASS` VARCHAR(100) NULL DEFAULT NULL COLLATE 'utf8_unicode_ci',
	`CIF` VARCHAR(15) NULL DEFAULT NULL COLLATE 'utf8_unicode_ci',
	`PAIS` VARCHAR(60) NULL DEFAULT NULL COLLATE 'utf8_unicode_ci',
	`CIUDAD` VARCHAR(60) NULL DEFAULT NULL COLLATE 'utf8_unicode_ci',
	`DIRECCION` VARCHAR(120) NULL DEFAULT NULL COLLATE 'utf8_unicode_ci',
	`COD_POSTAL` VARCHAR(15) NULL DEFAULT NULL COLLATE 'utf8_unicode_ci',
	`TEL` VARCHAR(15) NULL DEFAULT NULL COLLATE 'utf8_unicode_ci',
	PRIMARY KEY (`ID`) USING BTREE,
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
	`CLIENTE_ID` INT(10) NULL DEFAULT NULL,
	`OP_ID` INT(10) NULL DEFAULT NULL,
	PRIMARY KEY (`ID`) USING BTREE,
	UNIQUE INDEX `CLIENTE_ID_FHLOCAL_OP_ID` (`CLIENTE_ID`, `FHLOCAL`, `OP_ID`) USING BTREE,
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

