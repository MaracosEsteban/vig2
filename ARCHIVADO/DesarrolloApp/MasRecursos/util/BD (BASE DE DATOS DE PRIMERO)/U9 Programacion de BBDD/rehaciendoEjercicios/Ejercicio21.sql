
use alumnos;
drop table if exists fibonacci;
create table if not exists fibonacci( 
numero bigint);
delete from fibonacci;

delimiter //

create procedure fibo(in terminos int)
comment 'Ejercicio 21. Repite el ejercicio anterior, pero modifícalo para pasarle por parámetro la cantidad de términos de la serie.'
begin
declare anteultimo bigint default 1;
declare ultimo bigint default 1;
declare contador int default 1;
declare nuevotermino bigint default 0;

-- los dos primeros término de la serie ya lo se y los puedo escribir directramente en la tabla
-- insert into fibonacci values((anteultimo),(anteultimo));
insert into fibonacci value(anteultimo);
if (terminos > 1) then
begin

insert into fibonacci value(ultimo);
if (terminos > 2) then
begin


-- actualizo contador que me dice cual es el proximo termino a calcular
set contador:=3;

 -- ahora  aré un bucle que se ejecutará "termonos" veces dentreo del cual primero calculare el próximo termino y lo escribiré en la tabla 
 -- y luego actualizare utlimo y anteúltimo
 
 while (contador <= terminos) do
 set nuevotermino:=anteultimo+ultimo;
 insert into fibonacci value(nuevotermino);
 -- ahora solo me falt actualizar ultimo y anteultimo e incrementear el contador
 set anteultimo:=ultimo;
 set ultimo:= nuevotermino;
 
 set contador:=contador+1;
 
 end while;
end;
end if;
end;
end if;
end//

delimiter ;


--                   VARIOS

delete from fibonacci;

call fibo(15);
drop procedure fibo;
select * from fibonacci;
select count(*)from fibonacci;
delete from fibonacci;
