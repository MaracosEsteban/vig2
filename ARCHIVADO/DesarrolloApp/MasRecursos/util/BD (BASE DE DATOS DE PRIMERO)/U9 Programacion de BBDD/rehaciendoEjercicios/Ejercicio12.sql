-- Ejercicio 12. Crea un trigger en la tabla artículos de la base de datos Q3ERP para que cuando se modifique un artículo verifique si el precio es positivo.
--  En caso contrario pondrá el precio a cero.
delimiter //
use q3erp//
create trigger VerPrePos before update   on productos for each row
begin
if (NEW.precio<0) then
set NEW.precio :=0;
end if;

end//

delimiter ;


--                                       VARIOS     
use q3erp;


insert into productos (categoria_id,marca_id,codigo,producto,precio,calidad,estrellas) 
values (4,2,100,'Raton de oro',-400,5,'***');
select * from productos;
drop trigger VerPrePos;

Update productos set precio=-500 where producto_id = 7;
delete from productos where producto_id=14;