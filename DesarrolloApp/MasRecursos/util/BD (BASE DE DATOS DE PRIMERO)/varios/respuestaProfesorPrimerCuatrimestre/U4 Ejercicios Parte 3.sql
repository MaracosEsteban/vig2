DROP DATABASE parte3;
CREATE DATABASE parte3;
USE parte3;

-- Creación de las tablas
CREATE TABLE mecenas (
	codigo INT,
    nombre VARCHAR(50),
    ciudad VARCHAR(20),
    pais VARCHAR(20)
);

CREATE TABLE autor (
	id INT,
    nombre VARCHAR(50),
    pais VARCHAR(20),
    fecha_nacimiento DATE,
    fecha_defuncion DATE 
);

CREATE TABLE patrocina (
	mecenas INT,
    autor INT,
    fecha_inicio DATE,
    fecha_fin DATE
);

CREATE TABLE maestro (
	maestro INT,
    aprendiz INT
);

CREATE TABLE obra (
	codigo INT,
    autor INT,
    titulo VARCHAR(50)
);

CREATE TABLE galeria(
	codigo INT,
    nombre VARCHAR(50),
    direccion VARCHAR(100),
    poblacion VARCHAR(50),
    provincia VARCHAR(50)
);

CREATE TABLE expone (
	galeria INT,
	obra INT
);

-- EJERCICIO 1

-- Claves primarias

ALTER TABLE mecenas ADD CONSTRAINT mecenas_codigo_pk
					PRIMARY KEY (codigo);

ALTER TABLE patrocina ADD CONSTRAINT patrocina_mecenas_autor_pk
					  PRIMARY KEY (mecenas, autor);

ALTER TABLE autor ADD PRIMARY KEY (id);

ALTER TABLE maestro ADD CONSTRAINT
					PRIMARY KEY (maestro, aprendiz);
                    
ALTER TABLE obra ADD PRIMARY KEY (codigo);

ALTER TABLE expone ADD CONSTRAINT expone_obra_pk
				   PRIMARY KEY (obra);
                        
ALTER TABLE galeria ADD CONSTRAINT galeria_codigo_pk
					PRIMARY KEY (codigo);

-- Claves ajenas
ALTER TABLE patrocina ADD CONSTRAINT FOREIGN KEY (mecenas)
					  REFERENCES mecenas(codigo);

ALTER TABLE patrocina ADD FOREIGN KEY (autor)
					  REFERENCES autor(id);
                      
ALTER TABLE maestro ADD CONSTRAINT maestro_maestro_fk
					FOREIGN KEY (maestro)
                    REFERENCES autor (id);

ALTER TABLE maestro ADD CONSTRAINT maestro_aprendiz_fk
					FOREIGN KEY (aprendiz)
					REFERENCES autor(id);
                    
ALTER TABLE obra ADD CONSTRAINT obra_autor_fk
				 FOREIGN KEY (autor)
                 REFERENCES autor(id);
                 
ALTER TABLE obra CHANGE COLUMN autor autor INT NOT NULL;
-- También se puede hacer con MODIFY
-- ALTER TABLE obra MODIFY autor INT NOT NULL;

ALTER TABLE expone ADD FOREIGN KEY (obra) 
				   REFERENCES obra (codigo)
                   ON DELETE CASCADE ON UPDATE CASCADE;
                   
ALTER TABLE expone ADD FOREIGN KEY (galeria)
				   REFERENCES galeria (codigo)
                   ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE expone MODIFY galeria INT NOT NULL;

-- EJERCIO 2

-- Modifica el nombre de la tabla autor para que pase a ser artista.
ALTER TABLE autor RENAME artista;

-- Añade una columna en la tabla expone para poder guardar el número de la sala. 
-- Su valor no puede ser nulo.

ALTER TABLE expone ADD COLUMN numero_sala INT NOT NULL;

-- Añade una restricción para que el nombre del mecenas no puede estar vacío.
ALTER TABLE mecenas MODIFY nombre VARCHAR(50) NOT NULL;
-- También con CHANGE COLUMN
-- ALTER TABLE mecenas CHANGE COLUMN nombre nombre VARCHAR(50) NOT NULL;

-- Añade una restricción para que la fecha de fin de un patrocinio sea
-- posterior a la fecha de inicio
ALTER TABLE patrocina ADD CONSTRAINT CHECK (fecha_fin > fecha_inicio);

-- Añade una restricción para que la fecha de nacimiento de un autor sea obligatoria
ALTER TABLE artista MODIFY fecha_nacimiento DATE NOT NULL;

-- Añade una restricción para que la fecha de defunción de un artista sea posterior
-- a la fecha de nacimiento.
ALTER TABLE artista ADD CHECK (fecha_defuncion > fecha_nacimiento);

-- Modifica la tabla artista para que el país por defecto sea España
ALTER TABLE artista MODIFY pais VARCHAR(20) DEFAULT 'España';
-- Otra opción
-- ALTER TABLE artista ALTER COLUMN pais SET DEFAULT 'España';

-- Elimina las columnas población y provincia de la tabla Galería

ALTER TABLE galeria DROP COLUMN poblacion,
					DROP COLUMN provincia;