DROP DATABASE IF EXISTS oficina;
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


INSERT INTO departamento VALUES (DEFAULT, 'Informática'),
								                (DEFAULT, 'RRHH'),
                                (DEFAULT, 'Dirección'),
                                (DEFAULT, 'Administración'),
                                (DEFAULT, 'Comercial');

INSERT INTO despacho VALUES ('DS01', '960456585'),
							('DS02', '964655575'),
							('DS03', '960258575'),
							('DS04', '960578501');

INSERT INTO sala_reuniones VALUES ('SR01', 10),
								                  ('SR02', 19.5),
								                  ('SR03', 17.5);

INSERT INTO empleado VALUES (DEFAULT, 'Juan', NULL, 2, DEFAULT),
							(DEFAULT, 'Sara', 'DS01', 3, 2700),
							(DEFAULT, 'Sergio', NULL, 1, DEFAULT),
							(DEFAULT, 'Marta', NULL, 1, 1400),
							(DEFAULT, 'Elena', 'DS02', 4, 1700),
							(DEFAULT, 'Sebastián', NULL, 4, 1600),
							(DEFAULT, 'Sara', NULL, 4, 1300),
							(DEFAULT, 'Martín', 'DS03', 1, 1300),
							(DEFAULT, 'Laura', NULL, 1, DEFAULT),
							(DEFAULT, 'Pedro', NULL, 2, DEFAULT),
							(DEFAULT, 'Leopoldo', 'DS04', 5, 1700);

INSERT INTO reserva VALUES (DEFAULT, 1, 'SR01', '2021/03/25 18:30','2021/03/25 19:30');
INSERT INTO reserva VALUES (DEFAULT, 2, 'SR01', '2021/07/23 09:00','2021/07/23 10:30');
INSERT INTO reserva VALUES (DEFAULT, 2, 'SR02', '2021/11/10 09:00','2021/11/10 10:00');
INSERT INTO reserva VALUES (DEFAULT, 3, 'SR03', '2021/05/07 12:00','2021/05/07 13:00');