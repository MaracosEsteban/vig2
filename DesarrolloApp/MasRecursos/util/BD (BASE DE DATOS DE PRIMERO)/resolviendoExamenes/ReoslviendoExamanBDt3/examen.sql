-- EJERCICIO 1

DROP DATABASE IF EXISTS exament3;
CREATE DATABASE exament3;
USE exament3;

CREATE TABLE productos (
    id INT PRIMARY KEY,
    descripcion VARCHAR(255),
    precio DECIMAL(10,2)
);

delimiter // 
create trigger produco_b_update before update on productos for each row 
begin
if (new.precio < (old.precio*0.8)) then
	set new.precio := (old.precio*0.8);
end if;
end//
delimiter ;

-- EJERCICIO 2

delimiter //
create function comparar(ide1 int,ide2 int) returns char(200)
deterministic
begin
declare precio1 decimal(10,2);
declare precio2 decimal(10,2);
declare promedio decimal(10,2);

select precio into precio1 from productos where id=ide1;
select precio into precio2 from productos where id=ide2;
select avg(precio) into promedio from productos;

if ((precio1 > promedio) and (precio2>promedio)) then
return "Los dos productos tienen un precio por encima de la media";
end if;

if ((precio1 > promedio) )then
return "El primer producto tiene un precio por encima de la media";
end if;

if ((precio2 > promedio)) then
return "El segundo producto tiene un precio por encima de la media";
end if;

return "Ninguno de los productos tiene un precio por encima de la media";


end//
delimiter ;



--  ahora lo probamos el ejercicio 2

insert into productos values(5,'Silla Americana',100);   -- creo un producto con precio 100

update productos set precio=50 where id=5  ;                -- ahora trato de vajar el precio a 50

select * from productos;   -- el precio ha cambiado a 80 por lo tanto el triger funciona 





-- ahor pruebo el ejercicio 3

insert into productos values(10,'Silla Española',160); -- agrego otro producto par tener al meno 2
select * from productos ;

-- ahora tengo uno producto con precio 80 y uno con precio 160 el precio promedio seria 120
-- la funcion la puedo usar en un select

select comparar(10,10);
select comparar(10,5);
select comparar(5,10);
select comparar(5,5);   -- todo perfecto

                       





