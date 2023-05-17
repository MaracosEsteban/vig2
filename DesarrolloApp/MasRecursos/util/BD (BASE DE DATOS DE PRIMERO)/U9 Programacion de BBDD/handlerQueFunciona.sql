
USE Q3ERP;

delimiter //


CREATE PROCEDURE DemoControlador() 
BEGIN 
declare var1 char(50) default 'No se ha producido un error';

DECLARE continue  HANDLER FOR SQLSTATE '23000' -- clave duplicada
BEGIN
 set var1 := 'se ha producido un herror';
END; 


 INSERT INTO categorias VALUES (11, 'Error');
 select var1;
 
 
 
 END//
 
 delimiter ;
 
 
 --     varios
 select * from categorias;
 call DemoControlador() ;
 select @x;
 drop procedure DemoControlador;
 
 
 
 
 
/* CREATE PROCEDURE DemoControlador() 
BEGIN 
DECLARE EXIT HANDLER FOR SQLSTATE '23000' -- clave duplicada
BEGIN
 SET @x := -1;
END; 
SET @x := 1; 
 INSERT INTO categorias VALUES (1, 'Error');
 SET @x := 2; 
 END//
 
 delimiter ;
 
 
 --     
 select * from categorias; */
