-- EJERCICIO 1 
drop database practica;
create database practica;
create table ordenador(
                    id int primary key  auto_increment,
                    numeroSerie char(50) unique not null,
                    marca char(50) default 'HP',
                    precio dec(10,2) check(precio>0)
                                        );

create table trabajador(
                   dni char(9),
                   nombre char(50),
                   ordenador int unique,
                   fechaContratacion date,
                   foreign key(ordenador) references ordenador(id)
                   on update set null
                   on delete cascade
                   );

-- EJERCICIO 2

insert into ordenador VALUE (default,'100','DELL',700);
insert into ordenador VALUE (default,'200',default,1100);


-- EJERCICIO 3


insert into trabajador values ('10000000A','Sonia',2,'2021-10-20'),('20000000B','Juan',1,'2021-10-25');


-- EJERCICIO 4

update ordenador set precio=precio+50;


-- EJERCICIO 5
update trabajador set fechaContratacion='2021-10-31' where dni='20000000B'; 


-- EJERCICIO 6

delete from trabajador where DNI=20000000B;

-- EJERCICIO 7

delete from ordenador where numeroSerie='100';


-- borrar

select * from ordenador;
select * from trabajador;
delete from trabajador;
delete from ordenador;

select * from trabajador tra left join ordenador ord on tra.ordenador=ord.id;

