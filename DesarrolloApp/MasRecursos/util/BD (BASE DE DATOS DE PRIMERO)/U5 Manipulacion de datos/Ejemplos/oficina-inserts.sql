-- Ejemplos de INSERT

INSERT INTO sala_reuniones VALUES ('SR01', 20.5);
INSERT INTO departamento VALUES (DEFAULT, 'Matemáticas');

INSERT INTO departamento VALUES (DEFAULT, 'Inglés'),
								(DEFAULT, 'Informática');
                                
INSERT INTO departamento (nombre, id) VALUES ('Dibujo', DEFAULT),
											 ('Filosofía', DEFAULT);

INSERT INTO empleado (nombre, despacho, departamento) VALUES('Juan', NULL, 3);

INSERT INTO empleado (id, nombre, despacho, departamento) VALUES(DEFAULT, 'Sonia', NULL, 5);
                        
INSERT INTO empleado (id, nombre, despacho, departamento) VALUES(DEFAULT, 'Martín', NULL, 2);

INSERT INTO empleado VALUES (DEFAULT, 'Boris', NULL,2, 2500);

INSERT INTO empleado (nombre, departamento) VALUES ('Laura', 1);
            						
INSERT INTO despacho (telefono, codigo) VALUES ('960856563', 'DP01');
INSERT INTO despacho (telefono, codigo) VALUES ('960856564', 'DP02');
INSERT INTO despacho (telefono, codigo) VALUES ('960856565', 'DP03');
INSERT INTO empleado (nombre, despacho, departamento) VALUES ('Pedro', 'DP01', 2),
					   										 ('Sonia', 'DP02', 2),
					  										 ('Lucía', 'DP03', 1);
INSERT INTO reserva VALUES (DEFAULT, 1, 'SR01', '2020/10/10 16:00', '2020/10/10 17:00'),
						   (DEFAULT, 1, 'SR01', '2020/10/15 10:00', '2020/10/15 11:00');

INSERT INTO sala_reuniones VALUES ('SR02', 30),
								  ('SR03', 20),
                                  ('SR04', 25);