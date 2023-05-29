-- 1) creo la base de datos

CREATE DATABASE grupos_alumnos;
use grupos_alumnos;
CREATE TABLE grupo (
id INT PRIMARY KEY,
nombre VARCHAR(50),
num_alumnos INT
);
CREATE TABLE alumno (
dni CHAR(9),
nombre VARCHAR(50),
grupo INT REFERENCES grupo(id)
);
INSERT INTO grupo VALUES (1, "Pollitos", 0);
INSERT INTO grupo VALUES (2, "Tortuguitas", 0);







-- **********************************************************************************************************************
-- La idea es hacer un procedimiento que independientemente de los cambio que haga en la tabla alumno actualice la tabla grupo
-- despues desde cualquier triguer lo único que hago es llamar a ese procedimiento
-- esto basicamente me sierve para reacalcular datos derivados (pero que no sean de la misma tabla del triger activo)
-- ************************************************************************************************************************** 

delimiter //
create procedure ActualizarGrupo()
deterministic
begin
update grupo set grupo.num_alumnos=(select count(*) from alumno where alumno.grupo=grupo.id);
/*    esto está hecho con subconsultas      */

end//
delimiter ;







-- a. Se pide crear un trigger de forma que al insertar un alumno se actualice el número de alumnos en la tabla grupo.
delimiter //
use grupos_alumnos//


create trigger InsertarAlumno after insert on alumno for each row
begin
call ActualizarGrupo();
end//
delimiter ;
--               LO PRUEBO
insert into alumno value('42253370R','Ernesto Pogliani',1);
insert into alumno value('42277777R','Marco Polo',2);
insert into alumno value('42266666R','Federico Martin',1);
--              VARIOS
select * from alumno;
select * from grupo;










--b. Se pide crear un trigger de forma que al eliminar un alumno se actualice el número de alumnos en la tabla grupo.
delimiter //
use gurpos_alumnos//

create trigger EliminarAlumno after delete on alumno for each row
begin
call ActualizarGrupo();
end//

delimiter ;


--               LO PRUEBO
insert into alumno value('42252990R','Ernesto Pogliani',1);
delete from alumno where DNI='42252990R';
delete from alumno where DNI='42253370R';
--              VARIOS

drop trigger EliminarAlumno;
select * from alumno;
delete from alumno where dni='42253370R';
select * from grupo;

delete from alumno;
delete from grupo;

-- c. Se pide crear un trigger de forma que al modificar el grupo de un alumno se actualice
-- el número de alumnos en la tabla grupo.

delimiter //
use grupos_alumnos//
create trigger ModificarGrupo after update on alumno for each row
begin 
call ActualizarGrupo();
end//
delimiter ;


--               LO PRUEBO


--              VARIOS
use grupos_alumnos;
select * from alumno;
select * from grupo;
drop trigger ModificarGrupo;

drop trigger InsertarAlumno;
drop trigger ModificarGrupo;
drop trigger ModificaGrupo;
update alumno set grupo=2 where dni='42266666R';
show triggers;




--         borrar

update grupo set grupo.num_alumnos=(select count(*) from alumno where alumno.grupo=grupo.id);

select * from alumno;
select * from grupo;
delete from alumno where DNI='42253370R';
delete from alumno where DNI='42252990R';








