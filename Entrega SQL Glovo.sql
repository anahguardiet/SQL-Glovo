create schema videoclub;

set schema 'videoclub';


-- crear tablas
create table socios(
    id_socio smallserial primary key,
    nombre varchar(12) not null,
    apellidos varchar(25) not null,
    dni varchar(10) not null,
    fecha_nacimiento date not null,
    telefono varchar(14) not null
);

create table direcciones(
    id_socio smallint primary key,
    codigo_postal smallint not null,
    calle varchar(25) not null,
    numero varchar(4) not null,
    piso varchar (5),
    letra varchar (5) 
);

create table peliculas(
    id_pelicula smallserial primary key,
    titulo varchar(35) not null,
    genero varchar(30) not null,
    director varchar (40) not null,
    sinopsis varchar (150) not null
);

create table copias(
    id_copia smallserial primary key,
    id_pelicula smallint not null,
    estado boolean not null
);

create table prestamos (
	id_prestamo smallserial primary key,
	id_copia smallint not null,
	id_socio smallint not null,
	fecha_alquiler_texto date not null,
	fecha_devolucion date 
);

-- alterar tablas (incluir constraints)
--- socios
alter table socios 
add constraint unique_id_socios UNIQUE(id_socio),
add constraint unique_dni unique (dni),
add constraint unique_telefone unique (telefono);

--- direcciones
alter table direcciones
add constraint unique_direccion_socios UNIQUE(id_socio),
add constraint fk_direcciones_socios foreign key (id_socio) references socios(id_socio);

--- peliculas
alter table peliculas
add constraint unique_peliculas UNIQUE(id_pelicula);

--- copias
alter table copias
add constraint unique_copias UNIQUE(id_copia),
add constraint fk_copias_peliculas foreign key (id_pelicula) references peliculas(id_pelicula);

--- prestamos
alter table prestamos
add constraint unique_prestamo UNIQUE(id_prestamo),
add constraint fk_copias_peliculas foreign key (id_copia) references copias(id_copia),
add constraint fk_socio_prestamo foreign key (id_socio) references socios(id_socio);


--- insert data
---select * from videoclub.tmp_videoclub p;
---select distinct p.id_copia from videoclub.tmp_videoclub p;

insert into copias (id_copia)
select distinct ta.id_copia from tmp_videoclub p group by p.id_copia;

select cast (fecha_nacimiento as date) from tmp_videoclub ta;
select cast (fecha_alquiler as date) from tmp_videoclub ta;
select cast (fecha_devolucion as date) from tmp_videoclub ta;
select concat (apellido_1,' ',apellido_2) from tmp_videoclub ta;

select * from tmp_videoclub p;
select * from tmp_videoclub where nombre isnull;

