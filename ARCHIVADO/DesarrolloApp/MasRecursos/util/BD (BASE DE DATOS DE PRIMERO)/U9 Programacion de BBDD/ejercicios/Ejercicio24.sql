-- Ejercicio 24. Crea una función que resuelva una ecuación de segundo grado.  
-- a es el número que acompña a x cuadrado
-- b es el numero que acompaña a x
-- c es el término independiente
-- Este tipo de ecuaciones tiene dos soluciones asi que agragaré un cuarto parametro
-- booleano para indicar si quiereo la primera o seguanda solución
-- x1=(-b+sqr(b*b-4*a*c))/(2*a)
-- x2=(-b+sqr(b*b-4*a*c))/(2*a)
--
delimiter $$
use alumnos$$
create function Resolv(elegir bool,a decimal,b decimal,c decimal) returns decimal
deterministic
begin

declare x1 decimal;
declare x2 decimal;
set x1=(-b + sqrt(b*b-4*a*c))/(2*a);
set x2=(-b + sqrt(b*b-4*a*c))/(2*a);

if (elegir) then
return x1;
else
return x2;
end if;


end$$
delimiter ;


-- arho escribo una procedimiento para llamar a la funcion y mostrar los resultados

delimiter $$
use alumnos$$
create procedure llamarR()
begin
declare resultado decimal;
-- ahora llamo a la funcion
set resultado := resolv(false,1,2,1);
select resultado;
end$$
delimiter ;

call llamarR();
drop function resolv;
drop procedure llamarR;











