create database cuenta;
use cuenta;

CREATE TABLE perfil (
  `per_id` int(2) NOT NULL,
  `per_descripcion` varchar(60) NOT NULL,
  `per_estado` varchar(10) NOT NULL
) ;

INSERT INTO perfil (`per_id`, `per_descripcion`, `per_estado`) VALUES
(1, 'Gerente', 'Activo'),
(2, 'Admin', 'Activo'),
(3, 'Aux', 'Activo');

CREATE TABLE producto (
	 id_producto int primary key auto_increment,
    nombre varchar(100) not null,
    descripcion varchar(200),
    precio decimal(10,2) not null,
    stock int not null
);

CREATE TABLE veterinario (
    id_veterinario int primary key auto_increment,
    nombre varchar(100) not null,
    especialidad varchar(100),
    telefono varchar(20),
    email varchar(100) unique
)
