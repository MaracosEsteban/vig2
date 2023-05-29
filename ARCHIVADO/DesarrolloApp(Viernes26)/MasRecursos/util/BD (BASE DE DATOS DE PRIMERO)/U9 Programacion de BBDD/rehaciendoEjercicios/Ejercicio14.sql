-- Ejercicio 14 Crea un trigger en todas las tablas de la base de datos Q3ERP para que cada vez que se borre 
-- un registro se guarde la información en la tabla log.

delimiter //

create trigger Bajas_Productos before delete on productos for each row
begin
declare detalle text default 'detalle por defecto se dio de baja un articulo';
set detalle:= concat_ws('Producto  ',old.producto,' con precio ',old.precio,'  fue borrado de la tabla productos' );

insert into log value(default,now(),current_user(),detalle);

end//

delimiter ;


--         VARIOS
select * from productos;
delete from productos where producto_id=12;
use q3erp;
select * from log;
drop trigger Bajas_Productos;