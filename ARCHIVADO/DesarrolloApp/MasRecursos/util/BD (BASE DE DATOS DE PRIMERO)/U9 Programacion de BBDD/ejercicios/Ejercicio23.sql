-- Ejercicio 23. Crea una función que devuelva la raíz cuadrada de un valor real
-- introducido como parámetro. Si la no se calcular la raíz cuadrada devolverá -1.
delimiter $$
use alumnos $$
create function CalcRaiz( parametro decimal) returns decimal
deterministic 
begin
declare resultado decimal;
set resultado := sqrt(parametro);
if (resultado is null) then
set resultado := -1;
end if;
return resultado;
end $$
delimiter ;

delimiter $$
use alumnos$$
create procedure ERaiz(parametro decimal) 
begin
declare imprimir decimal default 0;
set imprimir := CalcRaiz(parametro);

select imprimir;


end$$
delimiter ;


drop function calcraiz;
call eraiz(64);