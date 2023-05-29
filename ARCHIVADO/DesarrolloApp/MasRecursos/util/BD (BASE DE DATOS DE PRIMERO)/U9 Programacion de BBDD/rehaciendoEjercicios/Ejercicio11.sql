-- Ejercicio 11. Crea un trigger en la tabla artículos de la base de datos Q3ERP para que cuando se inserte un artículo verifique si el precio es positivo.
-- En caso contrario pondrá el precio a cero.
delimiter //
use q3erp//
create trigger VerPrePos before insert  on productos for each row
begin
if (NEW.precio<0) then
set NEW.precio :=0;
end if;

end//

delimiter ;


--         
use q3erp;


insert into productos (categoria_id,marca_id,codigo,producto,precio,calidad,estrellas) 
values (4,2,100,'Raton de oro',-400,5,'***');
select * from productos;