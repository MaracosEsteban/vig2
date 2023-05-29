CREATE DATABASE parte2;
USE parte2;

DROP TABLE IF EXISTS matricula;
DROP TABLE IF EXISTS estudiante;
DROP TABLE IF EXISTS asignatura;

CREATE TABLE asignatura (
	codigo INT PRIMARY KEY,
	nombre VARCHAR (50)
);

CREATE TABLE estudiante (
	dni CHAR(9) PRIMARY KEY,
	nombre VARCHAR(50),
	edad INT CHECK (edad >=18),
	ciudad VARCHAR(50) DEFAULT 'Alicante'
);

CREATE TABLE matricula (
	asignatura INT,
	estudiante CHAR(9),
	nota DECIMAL (3,1),
	CONSTRAINT PRIMARY KEY (asignatura, estudiante),
	CONSTRAINT FOREIGN KEY (asignatura) REFERENCES asignatura(codigo),
	CONSTRAINT FOREIGN KEY (estudiante) REFERENCES estudiante(dni),
	CONSTRAINT CHECK (nota >= 0 AND nota <=10)
);