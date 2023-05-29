/* Escribe un procedimiento que reciba como entrada la nota de un alumno (numérico real) y un parámetro de salida (cadena de caracteres) con las siguientes condiciones:
• [0, 5): Insuficiente
• [5, 6): Aprobado
• [6, 7): Bien
• [7, 9): Notable
• [9, 10]: Sobresaliente
• En cualquier otro caso la nota no será válida. */

use alumnos;
delimiter //
create procedure convertir(in numero decimal,out texto varchar(20))
comment 'rehaciendo el ejercicio para estar mas prácticos'

begin 

set texto:= 'Nota no valida';

if (numero>0) then
set texto='Insuficiente';
end if;


if (numero>5) then
set texto='Aprobado';
end if;

if (numero>6) then
set texto='Bien';
end if;

if (numero>7) then
set texto='Insuficiente';
end if;

if (numero>7) then
set texto='Notable';
end if;

if (numero>9) then
set texto='Sobresaliente';
end if;

if (numero>10) then
set texto='Nota no valida';
end if;

end//

delimiter ;


delimiter //
create procedure probar()
begin
declare  mostrar varchar(20);
call convertir(90,mostrar);
select mostrar;
end//
delimiter ;


--                  VARIOS

drop procedure probar;
call probar();


