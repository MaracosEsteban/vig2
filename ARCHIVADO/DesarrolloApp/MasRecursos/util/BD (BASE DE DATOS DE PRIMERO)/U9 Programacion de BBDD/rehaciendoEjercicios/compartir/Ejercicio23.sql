/* Ejercicio 23. Crea una función que devuelva la raíz cuadrada de un valor real introducido como parámetro. Si la no se calcular la raíz cuadrada devolverá -1. */

-- delimiter //
DELIMITER //


create function RaizCuadrada (numero decimal) returns decimal deterministic
begin
declare resultado decimal;
if (sqrt(numero) is not null) then
return sqrt(numero);
else
return -1;
end if;
end//


delimiter ;



--                   VARIOS
select RaizCuadrada(-4);
use alumnos;
drop function RaizCuadrada;