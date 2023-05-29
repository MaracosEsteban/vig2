-- Ejercicio 25. Crea una función que devuelva el número de años transcurridos entre dos fechas.

delimiter //

create function NumeroA(fecha1 date, fecha2 date) returns int
deterministic
begin
 -- return (TIMESTAMPDIFF(YEAR,fecha1,fecha2));
return 5;
end//
delimiter ;


--                    VARIOS
use alumnos;
select NumeroA('1972-11-24','2021-11-11');
select 5;
drop function NumeroA;