--Ejercicio 5. Crea una estructura de código que sume los diez primeros número utilizando WHILE.

delimiter $$
use alumnos$$
create procedure sumar10()
begin
declare cont  int default  1;
declare total int default 0;

while(cont < 11) do
set total=total+cont;
set cont=cont+1;

end while;

select total as LosDiesPrimerosNumerosNaturalesSuman ;

end$$


delimiter ;



drop procedure sumar10;
call sumar10;





