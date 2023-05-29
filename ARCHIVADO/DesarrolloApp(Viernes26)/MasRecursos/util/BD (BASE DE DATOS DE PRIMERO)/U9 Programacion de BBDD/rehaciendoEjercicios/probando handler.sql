-- lo único que funciona de todo esto es el procedimiento probar


-- este procedimiento crea el handler

delimiter $$
use alumnos$$
create procedure CrearHandler()
begin

-- declare exit handler FOR SQLSTATE '42S02'
declare exit handler for 1051
begin
insert into manejos values (now());

end;

end$$
delimiter ;



 -- este procedimiento intenta hace una insercion en una talbla que no existe (padres)
 
 
delimiter $$
use alumnos$$
create procedure probar()

-- intentaré ingresar un registro en una tabal que no existe
begin


declare exit handler FOR SQLSTATE '42S02'
-- declare exit handler for 1051
begin
insert into manejos values (now());
end;

-- insert into padres values ('Pepito', 'Jose');
-- insert into registro values (now());

end$$
delimiter ;



delimiter //
create procedure InsertarMal()
deterministic
begin
insert into padres values ('Pepito', 'Jose');

end//
delimiter ;





-- -------------------------------------------------------------------------------------------
-- -------------------------------------------------------------------------------------------

drop procedure CrearHandler;
drop procedure Probar;



call CrearHandler;
call probar;

show triggers;
create table manejos(techa datetime);
insert into manejos values (now());
create table registro(fecha datetime);
insert into registro values (now());
-- --------------------probando probando

select * from registro;
INSERT INTO alumno VALUES ('9008998dZ','Mengano Fulano',8880.25);
show triggers;
select * from alumno;
select * from manejos;

drop procedure CrearHandler;

show tables;
use alumnos;
select * from manejos;
delete from manejos;
drop procedure probar;
show create trigger alumno_AFTER_INSERT;
-- -----------------------------------------------------------
drop procedure probar;
select * from manejos;
select * from registro;
delete from manejos;
delete from registro;
call probar();
call InsertarMal();
SHOW CREATE TRIGGER registrar;
SHOW triggers;





