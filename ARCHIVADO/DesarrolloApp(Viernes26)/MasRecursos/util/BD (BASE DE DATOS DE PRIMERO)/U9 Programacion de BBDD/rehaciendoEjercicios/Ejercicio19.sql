
use alumnos;
drop table if exists fibonacci;
create table if not exists fibonacci( 
numero bigint);
delete from fibonacci;

delimiter //

create procedure fibo()
comment 'Ejercicio 19. Crea una tabla llamada Fibonacci. Inserta los 50 primeros términos de la serie mediante un procedimiento 
almacenado. Utiliza la instrucción REPEAT.'
begin
declare anteultimo bigint default 0;
declare ultimo bigint default 1;
declare contador int default 1;
declare nuevotermino bigint default 0;

-- los dos primeros término de la serie ya lo se y los puedo escribir directramente en la tabla
-- insert into fibonacci values((anteultimo),(anteultimo));
insert into fibonacci value(anteultimo);
insert into fibonacci value(ultimo);
-- actualizo contador que me dice cual es el proximo termino a calcular
set contador:=3;

 -- ahora  aré un bucle que se ejecutará 48 veces dentreo del cual primero calculare el próximo termino y lo escribiré en la tabla 
 -- y luego actualizare utlimo y anteúltimo
 
 repeat
 set nuevotermino:=anteultimo+ultimo;
 insert into fibonacci value(nuevotermino);
 -- ahora solo me falt actualizar ultimo y anteultimo e incrementear el contador
 set anteultimo:=ultimo;
 set ultimo:= nuevotermino;
 
 set contador:=contador+1;
 until(contador=51)
 end repeat;
 
end//

delimiter ;


--                   VARIOS



call fibo();
drop procedure fibo;
select * from fibonacci;
select count(*)from fibonacci;
delete from fibonacci;
