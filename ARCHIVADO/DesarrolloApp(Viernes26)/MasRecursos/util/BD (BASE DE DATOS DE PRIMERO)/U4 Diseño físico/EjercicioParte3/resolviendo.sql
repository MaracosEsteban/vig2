drop database parte3;


CREATE DATABASE parte3;
USE parte3;


CREATE TABLE mecenas (
	codigo INT,
    nombre VARCHAR(50),
    ciudad VARCHAR(20),
    pais VARCHAR(20)
);

CREATE TABLE autor (
	id INT,
    nombre VARCHAR(50),
    pais VARCHAR(20),
    fecha_nacimiento DATE,
    fecha_defuncion DATE 
);

CREATE TABLE patrocina (
	mecenas INT,
    autor INT,
    fecha_inicio DATE,
    fecha_fin DATE
);

CREATE TABLE maestro (
	maestro INT,
    aprendiz INT
);

CREATE TABLE obra (
	codigo INT,
    autor INT,
    titulo VARCHAR(50)
);

CREATE TABLE galeria(
	codigo INT,
    nombre VARCHAR(50),
    direccion VARCHAR(100),
    poblacion VARCHAR(50),
    provincia VARCHAR(50)
);

CREATE TABLE expone (mec
	galeria INT,
	obra INT
);


-- Agregare restricciones a la tabla mediante alter table

alter table mecenas add primary key(codigo);
alter table autor add primary  key(id);
alter table patrocina add primary key(mecenas,autor);
alter table patrociona add foreign key(mecenas) references mecenas(codigo);
alter table patrociona add foreign key(autor) references autor(id);
alter table maestro add primary key(mestro,aprendiz);
alter table maestro add foreign key(mestro) references autor(id);
alter table maestro add foreign key(aprendiz) references autor(id);

alter table obra add primary key(codigo);
alter table obra add foreign key(autor) references autor(id);
-- la restriccion de not nul es un restricccion de columno asi que....
 
 alter table obra change column autor autor int not null;
 
 alter table galeria add primary key(codigo);
 
 alter table expone add primary key(obra);
 
 alter table expone add foreign key(obra) references obra(codigo)
                        on delete cascade
                        on update cascade;
alter table expone add foreign key(galeria) references galería(codigo)
                        on delete cascade
                        on update cascade;
                        
alter table expone change column galeria galeria int not null;

 alter table maestro add foreign key(mestro) references autor(id);
 
 
 -- Modifica el nombre de la tabla autor para que pase a ser artista.
 
 alter table autor rename artista;
 
 -- Añade una columna en la tabla expone para poder guardar el número de la sala. Su valor no puede ser nulo 
 
 alter table expone add column num_sala int check(num_sala>0);
 
 -- Añade una restricción para que el nombre del mecenas no puede estar vacío.
 
 alter table mecenas change column nombre nombre varchar(100) not null;
 
 -- Añade una restricción para que la fecha de fin de un patrocinio sea posterior a la fecha de inicio.
 
 alter table patrocina 
 
 






