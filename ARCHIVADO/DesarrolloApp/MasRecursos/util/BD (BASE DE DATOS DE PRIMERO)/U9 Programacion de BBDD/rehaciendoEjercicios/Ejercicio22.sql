/* Ejercicio 22. Crea una función que tenga como parámetro de entrada un número real y devuelva una cadena de caracteres indicando 
si el número es positivo, negativo o cero. */

delimiter //

create function PosNegCer(numero decimal) returns char(20)
deterministic
begin
if (numero<0)  then
   return 'Negativo';
elseif (numero>0) then
    return  'positivos';
else
	return 'cero';
end if;

end//
delimiter ;


--          VARIOS
use alumnos;
set @var1 := 45;
select PosNegCer(@var1);
drop function PosNegCer;

