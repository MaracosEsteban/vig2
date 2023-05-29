CREATE DATABASE parte1;
USE parte1;

CREATE TABLE acontecimiento_historico (
	id INT,
    fecha DATE,
    descripcion VARCHAR(200)
    );

CREATE TABLE cliente (
	dni CHAR (9),
	nombre VARCHAR (50),
	apellidos VARCHAR (50)
    );


 CREATE TABLE alumno (
	dni CHAR(9),
	nombre VARCHAR(50),
	telefono CHAR(9)
    );


CREATE TABLE articulo(
	id INTEGER,
    nombre VARCHAR(30),
    precio DECIMAL(10,2) DEFAULT 20.95
    );

CREATE TABLE libro(
	isbn  VARCHAR(20),
	titulo VARCHAR(130),
	genero VARCHAR(130) DEFAULT 'Narrativa',
	anyoPublicacion YEAR DEFAULT 2020,
	numeroPaginas INT
    );