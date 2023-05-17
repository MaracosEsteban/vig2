-- Ejercicio 28. Escribe una función para la base de datos Q3ERP que devuelva el valor mínimo 
-- del precio de los productos de una determinada marca que se recibirá como parámetro de entrada.

delimiter $$
use q3erp$$
create function medio(MarcaProd int) returns decimal
deterministic 
begin
return (select min(precio) from productos where marca_id=MarcaProd);
end$$
delimiter ;


delimiter $$
create procedure ejecutar()
begin
select (medio(5));
end$$
delimiter ;

drop procedure ejecutar;
drop function medio;
call ejecutar();


