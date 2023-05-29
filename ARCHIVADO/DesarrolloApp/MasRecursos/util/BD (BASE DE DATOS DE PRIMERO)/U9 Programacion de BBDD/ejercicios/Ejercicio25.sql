--  Ejercicio 25. Crea una función que devuelva el número de años transcurridos entre dos fechas.


delimiter $$
use alumnos $$
create  function dif(primera date,segunda date) returns int
deterministic
 begin
 -- declare primera date default '1972-11-24';
 -- declare segunda date default '2021-04-25';
 declare resultado int;
  set resultado := TIMESTAMPDIFF(year,primera,segunda);
 return resultado;
 
 end$$
 delimiter ;
  -- ---------------------------------------------------------------------------------------------------
 delimiter $$
use alumnos $$
create procedure PFechas()
 begin
 select dif('1972-11-24','2021-04-25') as Años_transcurridos;
 -- select "marcos";
 
 end$$
 delimiter ;
 
 -- ---------------------------------------------------------------------------------------------------
 call PFechas();
 drop procedure PFechas;
 drop function dif;
 
 
 
 
 
 