

delimiter $$
use alumnos$$

create trigger registrar 
before insert
on alumno for each row
begin
insert into registro values (now(),'Se realizo una insercion ');
end$$
delimiter ;


delimiter $$
use alumnos$$
create procedure probar()
begin
INSERT INTO alumno VALUES ('9999998dZ','Perengano Confusio',88800.25);


end$$
delimiter ;





-- ------------------------------------------------------------------------

call GenerarTriger;
call probar();
drop procedure probar;

drop table registro;

create table registro(fecha datetime, descripcion varchar(30));
drop trigger registrar;

select * from alumno;
select * from registro;