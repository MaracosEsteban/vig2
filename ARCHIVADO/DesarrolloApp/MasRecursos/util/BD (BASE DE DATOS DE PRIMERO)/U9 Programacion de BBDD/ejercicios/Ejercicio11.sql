 -- Ejercicio 11. Crea un trigger en la tabla artículos de la base de datos Q3ERP para que cuando se inserte 
 -- un artículo verifique si el precio es positivo. En caso contrario pondrá el precio a cero.
 
 delimiter $$
 use Q3ERP$$
 
 create trigger ContPrecio 
 before insert
 on productos
 for each row
 begin
 if (new.precio < 0) then
 set new.precio= 0;
 end if;
 
 end$$
 delimiter ;





 
  insert into productos (categoria_id,marca_id,codigo,producto,precio,calidad,estrellas) 
values (4,2,100,'HDMI 20 msts',-400,5,'***');
 
 
 
 select * from productos;
 drop trigger ContPrecio;