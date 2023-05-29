-- Ejercicio 13. Crea un trigger en todas las tablas de la base de datos Q3ERP que cada vez que se modifique algo 
-- se guarde la modificación en la tabla log.


delimiter $$

create trigger  control after update on productos
for each row 

begin
declare AccionRealizada varchar(64) default 'update en la tabla productos';

insert into log(fecha,usuario,descripcion) values ( now(),current_user(),AccionRealizada);

end$$

delimiter ;

/* Para las otras tablas seria el mismo script solo hoy que modificar el texto en la variable acccion realizada  y poner la tabla 
que corrresponda   */
 
 
 --                      -------------------- insertar un registro en productos

insert into productos (categoria_id,marca_id,codigo,producto,precio,calidad,estrellas) 
values (7,1,1000,'Ventilador',172.25,7,'****');

--                      -------------------- update de un  productos




update productos set precio = 10000 where producto_id=3; 

--                         ------------ varios                 ------------------
use q3ERP;
use Q3erp;
show tables;
show triggers;
select * from log;
select * from productos;
