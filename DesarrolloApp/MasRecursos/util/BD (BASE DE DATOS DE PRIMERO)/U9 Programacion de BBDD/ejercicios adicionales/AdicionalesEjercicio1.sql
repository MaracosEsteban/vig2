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

--  a. Se pide crear un trigger de forma que al insertar un alumno se actualice el número de alumnos en la tabla grupo.--

delimiter //
use grupos_alumnos//

create trigger InsertarAlumno after insert on alumno for each row
begin
update grupo set num_alumnos=num_alumnos+1 where grupo.id=new.grupo;
end//
delimiter ;
--               LO PRUEBO
insert into alumno value('42252990R','Ernesto Pogliani',1);
insert into alumno value('42252991R','Marco Polo',2);
insert into alumno value('42252992R','Federico Martin',1);
--              VARIOS
select * from alumno;
select * from grupo;
###############################################################################################################################################
-- b. Se pide crear un trigger de forma que al eliminar un alumno se actualice el número de alumnos en la tabla grupo.

delimiter //
use gurpos_alumnos//

create trigger EliminarAlumno after delete on alumno for each row
begin
update grupo set num_alumnos=num_alumnos-1 where grupo.id=old.grupo;
end//

delimiter ;


--               LO PRUEBO
insert into alumno value('42252990R','Ernesto Pogliani',1);
delete from alumno where DNI='42252990R';
delete from alumno where DNI='42252990R';
--              VARIOS
select * from alumno;
select * from grupo;

delete from alumno;
delete from grupo;

-- c. Se pide crear un trigger de forma que al modificar el grupo de un alumno se actualice el número de alumnos en la tabla grupo.


delimiter //
use gurpos_alumnos//
create trigger ModificaGrupo after update on alumno for each row
begin


-- restarlo uno al viejo grupo
update grupo set num_alumnos= num_alumnos-1 where id=old.grupo;
-- sumarle uno al nuevo grupo
update grupo set num_alumnos= num_alumnos+1 where id=new.grupo;

end//
delimiter ;

--                       AHORA LO PRUEBO
update alumno set grupo=1 where dni= '42252991R';


--                      VARIOS
select * from alumno;
select * from grupo;


-- **********************************************************************************************************************
-- La idea es hacer un procedimiento que independientemente de los cambio que haga en la tabla alumno actualice la tabla grupo
-- ************************************************************************************************************************** 

delimiter //
create procedure ActualizarGrupo()
deterministic
begin
update grupo set grupo.num_alumnos=(select count(*) from alumno where alumno.grupo=grupo.id);


end//
delimiter ;


--                        varios

show triggers;
drop trigger insertarAlumno;
drop trigger ModificarGrupo;
drop trigger EliminrAlumno;


