delimiter $$
create procedure prueba()
begin 
declare fin bool default false;
declare imp decimal default 0;
declare total decimal default 0;

-- cargoo datos en el cursor tres alumnos
declare tresAlumnos cursor for select importe from alumno order by importe desc limit 2,3;

declare continue handler for not found
begin
set fin := true;
end;

open TresAlumnos;
-- recorro el cursor hasta que se prduzca un "NOT FOUND"
while (fin= false) do
begin
fetch tresAlumnos into imp;
-- set todos=todos+nom+'   ';
set total=total+imp;
end;
end while;

select total; 


end$$
delimiter ;





-- ---------------------------------------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------
use alumnos;
show tables;
select * from manejos;
select  * from registro;

select * from registro limit 1;

call prueba();
drop procedure prueba;
select importe from alumno order by importe desc limit 2,3;

