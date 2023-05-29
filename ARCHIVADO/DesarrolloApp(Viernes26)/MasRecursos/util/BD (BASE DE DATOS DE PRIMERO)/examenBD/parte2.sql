

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
              
              
               
			-- ejercicio 2
            
            use comercio;
            
            
                        
                        