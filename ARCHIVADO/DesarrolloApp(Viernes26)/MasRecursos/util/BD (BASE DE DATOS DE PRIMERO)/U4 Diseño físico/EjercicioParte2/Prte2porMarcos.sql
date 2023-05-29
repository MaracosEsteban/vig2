--                  EJERCICIOS PARTE 2 


-- Ejercicio 1


create table parte2;

use parte2;

Create table asignatura(
						codigo int primary key,
						nombre char(100)
						);
            
create table matricula(
						asignatura int,
						estudiante char(9),
						nota decimal(4,2) check(nota >=0)
										  check(nota>=10),
						foreign key(asignatura) references asignatura(codigo),
						foreign key(estudiante) references estudiante(codigo),
                         constraint nombre_de_la_puta_clave  primary key(asignatura,estudiante)
						);
                        
create table estudiante(
						dni char(9) primary key,
                        nombre char(100),
                        edad int check(edad>18),
						ciudad char(100) default "Alicante"
                        );
                        
                        
-- E jercicio 2

drop database if exists parte2;
create database  parte2;

use parte2;


create table mecenas(codigo int primary key,
					 nombre char(100) not null,
                     ciudad char(100),
                     pais char(100)
                     );
                     
                     
create table autor(id integer primary key,
                   nombre char(100),
                   pais char (100) default "españa",
                   f_nac date not null,
                   f_def date check(f_def>f_nac)
                   ); 
                   
                   
create table patrocina(mecena integer,
					   autor integer,
                       f_inicio date,
                       f_fin date check(f_fin>finicio),
                       constraint patrocina_mecenas_autor_pk primary key(mecenas,autor),
                       constraint foreign  key(mecena) references mecenas(codigo),
                       foreign key(autor) references autor(id)
                       );
                       
create table maestro(mestro integer,
					 aprendiz integer,
                     foreign key(mestro) references autor(id),
                     foreign key(aprendiz) references autor(id),
                     primary key(mestro,aprendiz)
                     );
                     
create table obra(codigo integer primary  key,
			      autor integer not null,
                  titulo char(100),
                  foreign key(autor) references autor(id)
                  );
                  
create table galeria(codigo integer primary key,
					 nombre char(100),
                     direcccion char(100),
                     provincia char(100)
                     );
                  






create table expone(galeria integer,
					obra integer primary key not null ,
                    constraint foreign key(obra) references obra(codigo)
                    on delete cascade
                    on update cascade,
                    constraint foreign key(galeria) references galeria(codigo)
                    on delete cascade
                    on update cascade
                    
                    );
                    
                    
                     
                     
                     
                       
                   
                   













                        
                        

            
            