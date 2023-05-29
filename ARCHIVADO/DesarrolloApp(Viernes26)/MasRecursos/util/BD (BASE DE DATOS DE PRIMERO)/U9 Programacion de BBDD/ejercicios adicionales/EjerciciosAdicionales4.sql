-- 4. Crea una trigger en la base de datos Q3ERP para que el precio de los productos que se inserten no pueda superar en 200€ al precio del producto más
--  caro que exista en la base de datos. En el caso de que lo superen el precio que se guardará será el del producto más caro más 200€.

delimiter //

create trigger ControlPrecio  before insert on productos for each row
begin
declare MasCaroMas decimal(10,2);
select max(precio) into MasCaroMas from productos;
set MasCaroMas := MasCaroMas+200;
if (new.precio > MasCaroMas) then
set new.precio=MasCaroMas;
end if;
end//

delimiter ;

--                      VARIOS        
use  Q3ERP;
select * from productos;
select * from marcas;
select * from categorias ;
drop trigger ControlPrecio; 

--                     PROVANDO
insert into productos value ( default,4,6,100,'barita mágica',1000,4,'***');
insert into productos value ( default,2,4,100,'barita mágica flex superbig',10000,4,'****');


