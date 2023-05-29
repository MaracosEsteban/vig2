-- Ejercicio 15. Crea un procedimiento que tenga como parámetro de entrada un número real y como parámetro de salida una cadena de caracteres. 
-- El parámetro de salida indicará si el número es positivo, negativo o cero.
 
delimiter $$
create procedure NumText(in PEntrada real,out PSalida char(50)) 
 deterministic
begin
set PSalida := 'Error...';

if (PEntrada < 0) then
set PSalida = 'Número Negativo' ;
end if;

if (PEntrada = 0) then
set PSalida = 'El nnúmero es cero' ;
end if;

if (PEntrada > 0) then
set PSalida = 'El número es positivo' ;
end if;

end$$
delimiter ;



delimiter $$
create procedure probar()
begin
declare recibido char(50);
call NumText(8,recibido);
select recibido;

end$$
delimiter ;

--                                    ------cambalache-----------
drop procedure NumText;
drop procedure probar;
call probar();
use Q3erp;





