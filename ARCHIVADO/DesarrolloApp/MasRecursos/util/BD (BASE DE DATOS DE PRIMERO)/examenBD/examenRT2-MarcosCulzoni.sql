-- EJERCICIO 1


create database RegEst;
use RegEst;

create table registro ( 
			   
               id integer primary key,
               estacion int,
               temperatura decimal(6,2) check(temperatura > -200 and temperatura > 200 ),
										
               fecha date,
               foreign key(estacion) references  estacion(id)
               on update cascade
               on delete cascade
			
			           
			 );
             
             
             
 create table estacion(
              id integer primary key,
              ciudad varchar(50) unique,
              proveedor varchar(50)
              );
              
              
               


-- EJERCICIO 2
-- Consulta a

 select tic.codigo, sum(lin.cant*lin.precio) from ticket tic join linea_ticket lin on lin.ticket=tic.codigo;

-- Consulta b
 select cli.nombre, count(cli.nombre) from cliente cli join ticket tic on tic.cliente=cli.codigo group by cli.nombre order by cli.nombre;
     
     


-- Consulta c

-- Consulta d




