-- En este procedimiento tratare de gestionar herrores mediante declare..... handler un Declare...
-- Intentare programar un controlador para que en el caso de que  se quiera hacer una insercion en 
-- una tabla que no existe el procedimiento  almacenado se detenga y se inserte un registro en la tabla manejos con fecha y hora del error



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
insert into padres values ('Pepito', 'Jose');
insert into registro values (now());

end$$
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




