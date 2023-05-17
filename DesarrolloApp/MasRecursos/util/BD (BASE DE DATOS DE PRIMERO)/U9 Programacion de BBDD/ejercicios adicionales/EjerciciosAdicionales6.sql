-- En la base de datos Q3ERP crea la siguiente tabla:
use Q3ERP;
CREATE TABLE clientes (
id INT PRIMARY KEY,
nombre VARCHAR(50)
);

delimiter //
create trigger AutoIncremento before insert on clientes for each row
begin
declare NuevoIdentificador int;
select max(id)into NuevoIdentificador from clientes;
If (NuevoIdentificador is not null) then
set new.id =NuevoIdentificador+1;
else 
set new.id=1;
end if;
end//

delimiter ;

-- probando
drop trigger AutoIncremento;
 insert into clientes value (5,"Marcelo");
 insert into clientes value (5,"Adrián");
 select max(id) from clientes;
 select * from clientes;
 delete from clientes;