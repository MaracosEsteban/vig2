
-- EJERCICIO 2

-- Esribe / pega tu trigger aquí



use examen_recup_t3 ;


delimiter //
create trigger ariculo_update before update on articulo for each row



begin
declare maxcat decimal(10,2) default 0;
declare mincat decimal(10,2) default 0;

select precio_max  into maxcat from categoria where id=new.categoria; 
select precio_min  into mincat from categoria where id=new.categoria; 

if  (mew.precio > maxcat) then
set new.precio := maxcat;
end if;

if (new.precio < mincat) then
set new.precio := mincat;
end if;


end//

delimiter ;