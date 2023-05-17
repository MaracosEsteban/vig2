DROP DATABASE parte2;
CREATE DATABASE parte2;
use parte2;


CREATE TABLE mecenas (
	codigo INT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    ciudad VARCHAR(20),
    pais VARCHAR(20)
);

CREATE TABLE autor (
	id INT PRIMARY KEY,
    nombre VARCHAR(50),
    pais VARCHAR(20) DEFAULT 'España',
    fecha_nacimiento DATE NOT NULL,
    fecha_defuncion DATE ,
    CONSTRAINT autor_fecha_defuncion_ck CHECK (fecha_defuncion > fecha_nacimiento)
);

CREATE TABLE patrocina (
	mecenas INT,
    autor INT,
    fecha_inicio DATE,
    fecha_fin DATE,
    CONSTRAINT patrocina_mecenas_autor_pk PRIMARY KEY (mecenas, autor),
    CONSTRAINT patrocina_mecenas_fk FOREIGN KEY (mecenas) REFERENCES mecenas (codigo),
    CONSTRAINT patrocina_autor_fk FOREIGN KEY (autor) REFERENCES autor (id),
    CONSTRAINT patrocina_fecha_fin_ck CHECK (fecha_fin > fecha_inicio)
);

CREATE TABLE maestro (
	maestro INT,
    aprendiz INT,
    PRIMARY KEY (maestro,aprendiz),
    CONSTRAINT maestro_maestro_fk FOREIGN KEY (maestro) REFERENCES autor (id),
    CONSTRAINT maestro_aprendiz_fk FOREIGN KEY (aprendiz) REFERENCES autor (id)
);

CREATE TABLE obra (
	codigo INT PRIMARY KEY,
    autor INT NOT NULL,
    titulo VARCHAR(50),
    CONSTRAINT obra_autor_fk FOREIGN KEY (autor) REFERENCES autor(id)
);

CREATE TABLE galeria(
	codigo INT PRIMARY KEY,
    nombre VARCHAR(50),
    direccion VARCHAR(100),
    poblacion VARCHAR(50),
    provincia VARCHAR(50)
);

CREATE TABLE expone (
	galeria INT NOT NULL,
	obra INT,
	PRIMARY KEY (obra),
	CONSTRAINT expone_galeria_fk FOREIGN KEY (galeria) REFERENCES galeria (codigo) 
	ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT expone_obra_fk FOREIGN KEY (obra) REFERENCES obra(codigo)
    ON DELETE CASCADE ON UPDATE CASCADE
);