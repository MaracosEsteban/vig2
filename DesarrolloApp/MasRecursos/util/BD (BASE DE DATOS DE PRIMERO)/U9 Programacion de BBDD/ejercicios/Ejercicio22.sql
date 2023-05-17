-- Ejercicio 22. Crea una función que tenga como parámetro de entrada un número real
-- y devuelva una cadena de caracteres indicando si el número es positivo, negativo o cero.
delimiter $$
use alumnos$$
create function PosNegCero( numero integer) returns varchar(30)
deterministic
begin
declare mensaje varchar(30);
if (numero<0) then
set mensaje := 'El número es negativo';
elseif (numero=0) then
set mensaje := 'El número es cero';
else
set mensaje := 'El número es positivo';
end if;
return mensaje;
end$$
delimiter ;

delimiter $$
use alumnos$$
create procedure ejecutar(numero integer) 

begin
declare mensaje varchar(30) default 'Error';

set mensaje := PosNegCero(numero);
-- set mensaje := 'probando probando';
select mensaje;


end$$
delimiter ;

call ejecutar(0);
drop procedure ejecutar;
drop function PosNegCero;



select * from alumno
