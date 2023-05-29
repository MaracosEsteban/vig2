-- Ejercicio 13. Crea un trigger en todas las tablas de la base de datos Q3ERP que cada vez que se modifique algo se guarde la
--  modificación en la tabla log.

-- now()  es la funcion que permite obener la fecha y hora actual
-- current_user es una variable que contine el usuario actual.
-- concate_ws() => significa concaternar With Separtors

delimiter //
use q3erp//
create trigger GurdarLog before update on productos for each row
begin
declare descripcion text;
SET descripcion := CONCAT_WS(' ','UPDATE ON productos. OLD: (', OLD.producto, OLD.precio,')',
													      'NEW: (', NEW.producto, NEW.precio,')');


insert into log values (default,now(), current_user(),descripcion);



end//
delimiter ;






--                     VARIOS

select * from productos;
insert into productos value(default,4,6,100,'microfono',45,7,'*****');
select * from log;
update productos  set precio=666 where producto_id=6 ;
show triggers;
drop trigger  GurdarLog;

