-- Ejercicio 26. Escribe una función para la base de datos Q3ERP que devuelva el número total de productos que hay en la tabla productos.

delimiter $$
use Q3ERP$$

create function contar() returns int
deterministic
begin
declare cantidad int default 0;
set cantidad := (select count(*) from productos);

return cantidad;
end$$
delimiter ;

delimiter $$
create procedure ejecutar()
begin

select (contar());
end$$
delimiter ;

call ejecutar();
drop function contar;
drop procedure ejecutar;

