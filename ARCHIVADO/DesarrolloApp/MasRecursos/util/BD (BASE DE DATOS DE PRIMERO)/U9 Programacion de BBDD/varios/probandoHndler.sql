

USE Q3ERP;


delimiter //
USE Q3ERP;
create procedure prueba()
begin


declare exit handler for 1051
begin
select 'tabla no encontrada';
end

selec * from tablaQueNoExiste;


end//
delimiter ;




