/* Ejercicio 18. Escribe un procedimiento que reciba como parámetro de entrada un valor numérico que represente un día
 de la semana y que devuelva una cadena de caracteres con el nombre del día de la semana correspondiente.
 Por ejemplo, para el valor de entrada 1 devolverá lunes, para el 2 devolverá martes, etc. */
 
 delimiter $$
 use alumnos$$
create procedure dia(in numero int,out texto char(20))
comment 'Aca van todos los comentarios'
language sql
deterministic


begin
 if (numero=1) then
 set texto :='Lunes';
elseif (numero=2) then
set texto := 'Martes';
elseif (numero=3) then
set texto := 'Miércoles';
elseif (numero=4) then 
set texto := 'jueves';
elseif (numero=5) then 
set texto := 'Viernes';
elseif (numero=6) then 
set texto := 'Sábado';
elseif (numero=7) then 
set texto := 'Domingo';

end if;

end$$
 
 delimiter ;
 
 
delimiter $$
 
use alumnos$$
create procedure probar()
language sql
deterministic

begin
declare nombre char(20);
call dia(7,nombre);
select nombre;
end$$
delimiter ;



--          VARIOS


call probar();

drop procedure probar;
drop procedure dia;







