-- Cambiar los metros de la sala de reuniones SR01 a 30
UPDATE sala_reuniones SET metros = 30 WHERE codigo = 'SR01';
-- Incrementar el salario de los empleados con un id superior a 2 en un 15%
UPDATE empleado SET salario = salario * 1.15 WHERE id > 2;
-- Cambiar los metros de todas las salas de reuniones a 20
UPDATE sala_reuniones SET metros = 20;
-- Cambiar el nombre del departamento de Dibujo a Dibujo Técnico
UPDATE departamento SET nombre='Dibujo Técnico' WHERE id = 4;
-- Incrementar el sueldo de todos los empleados en 100 €.
UPDATE empleado SET salario = salario + 100;
-- Incrementar el sueldo en 100 € a aquellos empleados cuyo salario es 700.
UPDATE empleado SET salario = salario + 100 WHERE salario = 700;
-- Incrementar el sueldo en 100 € a los empleados del departamento 3.
UPDATE empleado SET salario = salario + 100 WHERE departamento = 3;
-- Incrementar el sueldo en 100€ solo si el nuevo sueldo es inferior a 1500€.
UPDATE empleado SET salario = salario + 100 WHERE salario <= 1400;
-- O también
UPDATE empleado SET salario = salario + 100 WHERE (salario + 100) < 1500;
-- Incrementar el sueldo de 100€ a aquellos empleados con un salario entre 500 y 1200€
UPDATE empleado SET salario = salario + 100 WHERE (salario >= 500) AND (salario <= 1200);
-- Cambiar el número de teléfono del despacho DP03 a 111111111 solo si es nulo.
UPDATE despacho SET telefono='111111111' WHERE telefono IS NULL AND codigo = 'DP03';
-- Bajar 200 euros a los empleados del departamento 2.
UPDATE empleado SET salario=salario-200 WHERE departamento = 2;
-- Cambiar al departamento 1 a aquellos empleados que tienen un sueldo entre 800 y 1300 €.
UPDATE empleado SET departamento=1 WHERE salario >= 800 AND salario <= 1300;
-- Incrementar en un 20% el salario de todos los empleados
UPDATE empleado SET salario = 1.2 * salario;