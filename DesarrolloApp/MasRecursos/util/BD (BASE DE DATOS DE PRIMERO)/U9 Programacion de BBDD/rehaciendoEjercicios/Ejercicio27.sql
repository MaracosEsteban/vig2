delimiter $$
use q3erp$$
create function medio(MarcaProd int) returns decimal
deterministic 
begin
return (select avg(precio) from productos where marca_id=MarcaProd);
end$$
delimiter ;


delimiter $$
create procedure ejecutar()
begin
select (medio(1));
end$$
delimiter ;

drop procedure ejecutar;
drop function medio;
call ejecutar();

select (medio(1));
