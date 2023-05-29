 -- Ejercicio 11. Crea un trigger en la tabla artículos de la base de datos Q3ERP para que cuando se modifique 
 -- un artículo verifique si el precio es positivo. En caso contrario pondrá el precio a cero.
 
 delimiter $$
 use Q3ERP$$
 
 create trigger ContPrecio 
 before update
 on productos
 for each row
 begin
 if (new.precio < 0) then
 set new.precio= 0;
 end if;
 
 end$$
 delimiter ;




update productos set precio=-458 where producto_id=1 ;
 
  
 
 
 select * from productos;
 drop trigger ContPrecio;