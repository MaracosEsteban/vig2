-- Ejercicio 28. Escribe una función para la base de datos Q3ERP que devuelva el valor mínimo del precio de los productos de una 
-- determinada marca que se recibirá como parámetro de entrada. 

delimiter //
-- use Q3ERP;
create function DevMinMar(marca bigint) returns decimal(10,2) deterministic
begin
return (select min(precio) from productos where marca_id=marca);
end//

delimiter ;

-- varios 
use Q3ERP;
select * from productos where marca_id=3;
select * from productos;
drop function DevMinMar;
Select DevMinMar(6);
select min(precio) from productos where marca_id=4;





