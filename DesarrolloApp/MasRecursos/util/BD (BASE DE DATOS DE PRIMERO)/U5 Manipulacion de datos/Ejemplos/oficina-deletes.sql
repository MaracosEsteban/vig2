-- Borra todas las realizadas entre el 1 de octubre de 2019 y el 31 de octubre de 2019
DELETE FROM reserva WHERE fecha_inicio > '2019/10/01 00:00' AND fecha_fin < '2019/10/31 23:59';

-- Borra todas las reservas
DELETE FROM reserva;

-- Borrar aquellos empleados del departamento 2 con un sueldo
-- inferior a 1500 €.
DELETE FROM empleado WHERE salario < 1500 AND departamento = 2;