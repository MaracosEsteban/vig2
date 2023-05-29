-- 3. Implementa una función en la base de datos Q3ERP que reciba como parámetro un precio mínimo y un precio máximo y devuelva el número de productos cuyo 
-- precio esté dentro del rango indicado.
delimiter //

create function Cantidad(precio1 decimal(10,2), precio2 decimal (10,2)) returns int
deterministic
begin
declare CantArt int;
 select count(precio) into CantArt from productos where precio between precio1 and precio2;

return CantArt;

end//
delimiter ;

--        VARIO
Use Q3ERP;
select * from productos order by precio;
drop function Cantidad;

--      PROBANDO

select cantidad(100,300);
select count(precio)  from productos where precio between 100 and 300;
