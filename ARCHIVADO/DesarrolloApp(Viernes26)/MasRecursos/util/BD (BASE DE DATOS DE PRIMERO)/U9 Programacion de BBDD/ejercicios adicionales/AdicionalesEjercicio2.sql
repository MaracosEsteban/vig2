-- CREACION DE LA BASE DE DATOS ----------------------------------

CREATE DATABASE empresa;
USE empresa;
CREATE TABLE departamento (
id INT PRIMARY KEY AUTO_INCREMENT,
nombre VARCHAR(50),
suma_salarios DECIMAL(10,2)
);
CREATE TABLE puesto (
id INT PRIMARY KEY AUTO_INCREMENT,
nombre VARCHAR(50),
salario_base DECIMAL (10,2)
);
CREATE TABLE empleado (
dni CHAR(9) PRIMARY KEY,
nombre VARCHAR(50),
anyos_exp INT,
puesto INT REFERENCES puesto (id),
departamento INT REFERENCES departamento (id),
salario DECIMAL (10,2)
);
INSERT INTO puesto VALUES (1, 'Administrativo', 1300),
(2, 'Técnico', 1200);
INSERT INTO departamento VALUES (1, 'Administración', 0),
(2, 'Informática', 0);

############################################################################################################


-- a. Crea un trigger para que cada vez que se inserte un empleado se calcule automáticamente su salario según la 
-- formula indicada anteriormente: salario = salario base de su puesto + (anyos de experiencia * 50). El disparador 
-- también debe actualizar la suma total de salarios de la tabla departamento. Para evitar problemas utiliza un trigger
 BEFORE INSERT.
 
 
-- La columna salario de la tabla empleado también es un atributo derivado y se calcula de la siguiente forma: es el salario base 
-- asignado al puesto de trabajo que desempeña el empleado más un extra de 50€ por año de experiencia.
 
delimiter //

create trigger NuevoEmpleado before insert on empleado for each row
begin
-- ahor tengo que calcular el salario que se almacenará el lap propia tabla del triger (empleado)
declare s_base decimal (10,2);
-- hago un select en puesto para averiguar el salario base corrrespondiente a ese puesto
select salario_base into s_base from puesto where puesto.id = new.puesto;
set new.salario := s_base+50*new.anyos_exp;
-- hora tengo que actualizar suma salarios de la tabla departamento
update departamento set suma_salarios=suma_salarios+new.salario where departamento.id=new.departamento;

end//

delimiter ;


--                                  VARIOS

select * from empleado;
select * from departamento;
select * from puesto;
drop trigger NuevoEmpleado;



--                               PRUEBA

insert into empleado value('42252270R','Juan Prez',10,2,1,0);


-- b. Crea un trigger para que, al modificar los años de experiencia de un empleado, se recalcule su salario.
--  Deberá actualizarse también la suma total de salarios de la tabla departamento. Para evitar problemas utiliza un
 -- trigger BEFORE UPDATE.

delimiter //

create trigger ModificarEmpleado before update on empleado for each row
begin
-- ahor tengo que recalcular calcular el salario que se almacenará el lap propia tabla del triger (empleado)
declare s_base decimal (10,2);
-- hago un select en puesto para averiguar el salario base corrrespondiente a ese puesto
select salario_base into s_base from puesto where puesto.id = new.puesto;
set new.salario := s_base+50*new.anyos_exp;
-- hora tengo que actualizar suma salarios de la tabla departamento, para actulizarl tengo que restarle el salario anterior
-- y sumarle el nuevo
update departamento set suma_salarios=suma_salarios+new.salario-old.salario where departamento.id=new.departamento;

end//

delimiter ;


--                                  VARIOS

select * from empleado;
select * from departamento;
select * from puesto;
drop trigger ModificarEmpleado;


--                               PRUEBA

insert into empleado value('42252270R','Juan Prez',10,2,1,0);
update empleado set anyos_exp=0 where dni='42252270R';



-- c. Crea un trigger para que al borrar un empleado se actualice la suma total de la tabla departamento.

delimiter //

create trigger BorrarEmpleado before delete on empleado for each row
begin


update departamento set suma_salarios=suma_salarios-old.salario where departamento.id = old.departamento;

end//
delimiter ;


--                                  VARIOS

select * from empleado;
select * from departamento;
select * from puesto;
drop trigger BorrarEmpleado;
delete from empleado;
update departamento set suma_salarios=0;

--                               PRUEBA

insert into empleado value('42252270R','Juan Prez',10,2,1,0);
insert into empleado value('42252999R','Juan Prez',5,1,2,0);
update empleado set anyos_exp=0 where dni='42252270R';
delete from empleado where dni='42252270R';

-- d. Crea un trigger para que al modificar el salario base de un puesto de trabajo, se recalcule el sueldo de todos 
-- los empleados con ese puesto. También habrá que recalcular la suma total de la tabla departamento.


delimiter //

create trigger ModificarBase after update  on puesto for each row
begin
-- Recalculo los sueldos de todos los empleados en base al nuevo salario
update empleado  set salario = new.salario_base+50*anyos_exp where empleado.puesto = new.id;

update departamento set suma_salarios =(select sum(salario) from empleado where empleado.departamento=departamento.id);
end//

delimiter ;


--                                  VARIOS

select * from empleado;
select * from departamento;
select * from puesto;
drop trigger BorrarEmpleado;
drop trigger ModificarBase;
delete from empleado;
update departamento set suma_salarios=0;

--                               PRUEBA

insert into empleado value('42252270R','Juan Prez',10,2,1,0);
insert into empleado value('42252999R','Elisa Martins',5,1,2,0);
update empleado set anyos_exp=0 where dni='42252270R';
delete from empleado where dni='42252999R';
update puesto set salario_base= 1400 where id =1;




