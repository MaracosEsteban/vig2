-- Ejercicio 16

delimiter $$
create procedure NotaAText(in NotaN integer,out NotaT varchar(20))
comment 'Este procedimiento recibe como entrada la nota del alumno numero real, y como salida um string
	0,5=> insificiente
    5,6=> aprobado
    6,7=> bienMostrarNoganadores
    7,9=> notable
    9,10=> sobresaliente'
begin
set NotaT := 'Insuficiente';

if (NotaN >5) then
set NotaT := 'Aprobado';
end if;

if (NotaN >6) then
set NotaT := 'Bien';
end if;

if (NotaN >7) then
set NotaT := 'Notable';
end if;

if (NotaN >9) then
set NotaT := 'Sobresaliente';
end if;

end$$
delimiter ;

-- Escribo otra funcion almacenada para desde alli llmar a la primera

delimiter $$

create procedure proc()
comment 'Desde este procedimiento llamo a NotaAText()'

begin
declare numero integer default 9;
declare texto varchar(20);

call NotaAText(numero,texto);
select texto;

end$$
delimiter ;

drop procedure proc;
drop procedure NotaAText;

call proc();











