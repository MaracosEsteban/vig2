--                     CREACION DE LA BASE DE DATOS
create database prueba4;
use prueba4;



      --   LO DECLARO USANDO RESTRICCION DE COLUMNA  
        
create table cliente( 
        dni CHAR(9) primary key,
		nombre char(40) not null,
        provincia int, 
        constraint cliente_provincia_fk foreign key(provincia)
        references provincia(codigo)
        on delete  cascade
        on update cascade
        
        
        );
        
        
             --   AHORA defino la tabla con  todas restricciones de tabla.
        
create table cliente( 
        dni CHAR(9) ,
		nombre char(40),
        provincia int, 
        constraint cliente_provincia_fk foreign key(provincia)
        references provincia(codigo),
        
        constraint cliente_dni_pk primary key(dni),
        
        constraint cliente_nombre_uk unique(nombre)
         
        );
        
        
        
        
        
        
        
        
        
        
        
        
        
        
 Create table provincia(
		codigo int primary key auto_increment,
        nombre varchar(40),
        habitantes int
        );

--                                  Carga de datos


insert into provincia value(default,"Alicante",458245);
insert into provincia value(default,"Valencia",1999245);
insert into provincia value(default,"La Rioja",6666666);




insert into cliente value( '42253370R','Marcos Culzoni',2);
insert into cliente value( "42255555R","Federico Pogliani",2);
insert into cliente value( "42277777R","Bernardo Rata Rtón",1);






--                     varios 

drop  database if exists prueba4;
select * from provincia;
select * from cliente;
delete from provincia where codigo=2;
delete from provincia where codigo=6;
update provincia set codigo=100 where codigo=1;





