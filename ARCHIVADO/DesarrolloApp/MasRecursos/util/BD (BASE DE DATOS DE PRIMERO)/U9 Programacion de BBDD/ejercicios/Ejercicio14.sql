-- Ejercicio 14 Crea un trigger en todas las tablas de la base de datos Q3ERP para que cada vez que se borre un registro se 
-- guarde la información en la tabla log.

delimiter $$
create trigger guardar after delete on productos
for each row

begin 

declare guardar text;
set guardar := CONCAT('Fila borrada valores => ',CONVERT(old.producto_id,CHAR),',',CONVERT(old.categoria_id,CHAR),',',CONVERT(old.marca_id,CHAR),',',
CONVERT(old.codigo,CHAR),',',CONVERT(old.producto,CHAR),',',CONVERT(old.precio,CHAR),',',CONVERT(old.calidad,CHAR),',',CONVERT(old.estrellas,CHAR),','); 

insert into log(fecha,usuario,descripcion) values ( now(),current_user(),guardar);



end$$

delimiter ;




--                      Borrar registros

delete from productos where producto_id=5; 




--                    ----------Varios--------------
select * from productos;
select * from log;
drop trigger guardar;
