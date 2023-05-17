DROP DATABASE oficina;
CREATE DATABASE oficina;
use oficina;

CREATE TABLE departamento (
  id INT AUTO_INCREMENT,
  nombre VARCHAR(45) NULL,
  PRIMARY KEY (id));


CREATE TABLE despacho (
  codigo CHAR(4),
  telefono VARCHAR(10),
  PRIMARY KEY (codigo));


CREATE TABLE  empleado (
  id INT AUTO_INCREMENT,
  nombre VARCHAR(45) NOT NULL,
  despacho CHAR(4) UNIQUE,
  departamento INT NOT NULL,
  salario DECIMAL(10,2) DEFAULT 1200,
  PRIMARY KEY (id),
  CONSTRAINT empleado_despacho_fk
    FOREIGN KEY (despacho)
    REFERENCES despacho (codigo)
    ON DELETE CASCADE
    ON UPDATE SET NULL,
  CONSTRAINT empleado_departamento_fk
    FOREIGN KEY (departamento)
    REFERENCES departamento (id)
    ON DELETE RESTRICT
    ON UPDATE CASCADE);


CREATE TABLE sala_reuniones (
  codigo CHAR(4),
  metros DECIMAL(4,1),
  PRIMARY KEY (codigo)
);

CREATE TABLE IF NOT EXISTS reserva (
  id INT AUTO_INCREMENT,
  empleado INT NOT NULL,
  sala_reuniones CHAR(4) NOT NULL,
  fecha_inicio DATETIME,
  fecha_fin DATETIME,
  PRIMARY KEY (id),
  CONSTRAINT reserva_empleado_fk
    FOREIGN KEY (empleado)
    REFERENCES empleado (id)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  CONSTRAINT reserva_sala_reuniones_fk
    FOREIGN KEY (sala_reuniones)
    REFERENCES sala_reuniones (codigo)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  CONSTRAINT fecha_fin_ck
    CHECK (fecha_fin > fecha_inicio));