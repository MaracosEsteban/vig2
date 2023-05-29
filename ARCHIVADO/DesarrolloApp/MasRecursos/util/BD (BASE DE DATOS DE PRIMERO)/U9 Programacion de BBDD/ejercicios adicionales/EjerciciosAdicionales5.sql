-- 5. Crea una función que reciba como parámetro dos marcas, la función devolverá el identificador de aquella marca con el producto más caro.
--  En caso de empate se devolverá cualquiera de los dos identificadores.

delimiter //

create function MasCaro(par1 integer,par2 integer) returns integer
deterministic
begin

declare precio1 decimal(10,2);
declare precio2 decimal(10,2);

select max(precio) into precio1 from productos where marca_id=par1;
select max(precio) into precio2 from productos where marca_id=par2;

if (precio1>precio2) then
return par1;
else 
return par2;
end if;

end//

delimiter ;

--                     VARIOS

select * from productos;
select mascaro(2,7);


