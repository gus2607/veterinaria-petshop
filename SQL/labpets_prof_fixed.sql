-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-02-2021 a las 02:08:44
-- Versión del servidor: 10.1.21-MariaDB
-- Versión de PHP: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `labpets`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `concepto`
--

CREATE TABLE `concepto` (
  `con_id` int(3) NOT NULL,
  `con_descripcion` varchar(100) NOT NULL,
  `con_estado` varchar(10) NOT NULL
) ;

--
-- Volcado de datos para la tabla `concepto`
--

INSERT INTO `concepto` (`con_id`, `con_descripcion`, `con_estado`) VALUES
(2, 'Pago a terceros', 'Activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `consecutivo_documentos`
--

CREATE TABLE `consecutivo_documentos` (
  `td_sigla` varchar(3) NOT NULL,
  `nit_empresa` varchar(15) NOT NULL,
  `ultimo_creado` varchar(15) NOT NULL
) ;

--
-- Volcado de datos para la tabla `consecutivo_documentos`
--

INSERT INTO `consecutivo_documentos` (`td_sigla`, `nit_empresa`, `ultimo_creado`) VALUES
('FV', '9002323-9', '132'),
('OS', '9002323-9', '12'),
('CE', '9002323-9', '6'),
('NC', '9002323-9', '1'),
('GA', '9002323-9', '16');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `encabezado_egresos`
--

CREATE TABLE `encabezado_egresos` (
  `id` int(11) NOT NULL,
  `no_egreso` int(11) NOT NULL,
  `fecha_documento` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `tercero_identificacion` varchar(15) NOT NULL,
  `detalle` varchar(250) NOT NULL,
  `fp_id` int(3) NOT NULL,
  `conceptoEgreso_codigo` int(4) NOT NULL,
  `no_documento` varchar(15) NOT NULL,
  `valor_egreso` double NOT NULL,
  `estado` varchar(10) NOT NULL
) ;



--
-- Estructura de tabla para la tabla `especie`
--

CREATE TABLE `especie` (
  `esp_id` int(2) NOT NULL,
  `esp_descripcion` varchar(60) NOT NULL,
  `esp_estado` varchar(10) NOT NULL
) ;
--
-- Volcado de datos para la tabla `especie`
--

INSERT INTO `especie` (`esp_id`, `esp_descripcion`, `esp_estado`) VALUES
(1, 'Caninos', 'Activo'),
(2, 'Felinos', 'Activo'),
(3, 'Otros', 'Activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `examen`
--

CREATE TABLE `examen` (
  `exa_id` int(11) NOT NULL,
  `exa_descripcion` varchar(100) NOT NULL,
  `exa_valor` int(11) NOT NULL,
  `exa_tipo` varchar(30) NOT NULL,
  `exa_estado` varchar(15) NOT NULL
) ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `examen_parametros`
--

CREATE TABLE `examen_parametros` (
  `ep_id` int(11) NOT NULL,
  `ep_exa_id` int(11) NOT NULL,
  `ep_para_id` int(11) NOT NULL,
  `ep_consecutivo` int(11) NOT NULL
) ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `forma_pago`
--

CREATE TABLE `forma_pago` (
  `fp_id` int(2) NOT NULL,
  `fp_descripcion` varchar(50) NOT NULL,
  `fp_estado` varchar(15) NOT NULL
) ;

--
-- Volcado de datos para la tabla `forma_pago`
--

INSERT INTO `forma_pago` (`fp_id`, `fp_descripcion`, `fp_estado`) VALUES
(1, 'Efectivo', 'Activo'),
(2, 'Transferencia', 'Activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mascota`
--

CREATE TABLE `mascota` (
  `mas_id` int(6) NOT NULL,
  `mas_nombre` varchar(60) NOT NULL,
  `mas_edad` int(10) NOT NULL,
  `mas_propietario` varchar(100) NOT NULL,
  `mas_sexo` varchar(20) NOT NULL,
  `raza_id` int(10) NOT NULL,
  `mas_estado` varchar(10) NOT NULL
) ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden_servicio`
--

CREATE TABLE `orden_servicio` (
  `os_id` int(10) NOT NULL,
  `os_fecha` date NOT NULL,
  `os_vet_id` int(10) NOT NULL,
  `os_mas_id` int(10) NOT NULL,
  `os_mas_propietario` varchar(100) NOT NULL,
  `os_estado` varchar(10) NOT NULL,
  `os_valor_total` int(11) NOT NULL,
  `os_abono` int(11) NOT NULL,
  `os_observaciones` varchar(100) NOT NULL,
  `os_observacionesResultados` varchar(100) NOT NULL,  
  `os_usuResultado_crea` varchar(15) NOT NULL
) ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden_servicio_detalle`
--

CREATE TABLE `orden_servicio_detalle` (
  `dos_id` int(11) NOT NULL,
  `dos_os_id` int(11) NOT NULL,
  `dos_exa_id` int(11) NOT NULL,
  `dos_exa_valor` int(11) NOT NULL,
  `dos_exa_cantidad` varchar(15) NOT NULL,
  `dos_exa_observaciones` varchar(200) NOT NULL
) ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden_servicio_resultados`
--

CREATE TABLE `orden_servicio_resultados` (
  `osr_id` int(6) NOT NULL,
  `os_id` int(10) NOT NULL,
  `dos_exa_id` int(11) NOT NULL,
  `para_id` int(6) NOT NULL,
  `osr_resultado` varchar(50) NOT NULL) ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parametros`
--

CREATE TABLE `parametros` (
  `para_id` int(6) NOT NULL,
  `para_descripcion` varchar(100) NOT NULL,
  `para_unidad` varchar(50) NOT NULL,
  `para_estado` varchar(50) NOT NULL,
  `para_formula` varchar(100) NOT NULL,
  `para_referencia1` varchar(100) NOT NULL,
  `para_referencia2` varchar(100) NOT NULL
) ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfil`
--

CREATE TABLE `perfil` (
  `per_id` int(2) NOT NULL,
  `per_descripcion` varchar(60) NOT NULL,
  `per_estado` varchar(10) NOT NULL
) ;

--
-- Volcado de datos para la tabla `perfil`
--

INSERT INTO `perfil` (`per_id`, `per_descripcion`, `per_estado`) VALUES
(1, 'Gerente', 'Activo'),
(2, 'Admin', 'Activo'),
(3, 'Aux', 'Activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `raza`
--

CREATE TABLE `raza` (
  `raza_id` int(3) NOT NULL,
  `raza_descripcion` varchar(60) NOT NULL,
  `raza_estado` varchar(10) NOT NULL,
  `esp_id` int(2) NOT NULL
) ;

--
-- Volcado de datos para la tabla `raza`
--

INSERT INTO `raza` (`raza_id`, `raza_descripcion`, `raza_estado`, `esp_id`) VALUES
(1, 'Beagle', 'Activo', 1),
(2, 'Boston Terrier', 'Activo', 1),
(3, 'Bóxer', 'Activo', 1),
(4, 'Bull Terrier', 'Activo', 1),
(5, 'Bulldog', 'Activo', 1),
(6, 'Bulldog Francés', 'Activo', 1),
(7, 'Carlino', 'Activo', 1),
(8, 'Chihuahua', 'Activo', 1),
(9, 'Dóbermann', 'Activo', 1),
(10, 'Labrador', 'Activo', 1),
(11, 'Maltés', 'Activo', 1),
(12, 'Perro Pastor Alemán', 'Activo', 1),
(13, 'Perro Salchicha', 'Activo', 1),
(14, 'Pinscher Miniatura', 'Activo', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `terceros`
--

CREATE TABLE `terceros` (
  `id` int(11) NOT NULL,
  `ti_descripcion` varchar(30) NOT NULL,
  `identificacion` varchar(15) NOT NULL,
  `representante_legal` varchar(80) NOT NULL,
  `razon_social` varchar(100) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `tel1` varchar(30) NOT NULL,
  `tel2` varchar(30) NOT NULL,
  `observaciones` varchar(250) NOT NULL,
  `usu_crea` varchar(15) NOT NULL,
  `fecha_crea` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usu_anula` varchar(15) NOT NULL,
  `fecha_anula` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `razon_anula` varchar(200) NOT NULL,
  `estado` varchar(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `terceros`
--

INSERT INTO `terceros` (`id`, `ti_descripcion`, `identificacion`, `representante_legal`, `razon_social`, `direccion`, `tel1`, `tel2`, `observaciones`, `usu_crea`, `fecha_crea`, `usu_anula`, `fecha_anula`, `razon_anula`, `estado`) VALUES
(1, '', '123', 'Done', 'Veterinaria Doctor PET', '', '', '', '', '', '2020-07-20 03:49:28', '', '0000-00-00 00:00:00', '', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `usu_id` int(6) NOT NULL,
  `usu_identificacion` varchar(15) NOT NULL,
  `usu_login` varchar(30) NOT NULL,
  `usu_pass` varchar(30) NOT NULL,
  `usu_nombre` varchar(60) NOT NULL,
  `usu_apellido` varchar(60) NOT NULL,
  `usu_email` varchar(100) NOT NULL,
  `usu_dir` varchar(100) NOT NULL,
  `usu_tel` varchar(15) NOT NULL,
  `usu_estado` varchar(10) NOT NULL,
  `per_id` int(2) NOT NULL,
  `img_firma` varchar(100) NOT NULL
) ;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`usu_id`, `usu_identificacion`, `usu_login`, `usu_pass`, `usu_nombre`, `usu_apellido`, `usu_email`, `usu_dir`, `usu_tel`, `usu_estado`, `per_id`, `img_firma`) VALUES
(1, '123', 'mdrestrepo', '1234', 'a', 'a', 'a@gmail.com', '1', '1', 'Activo', 1, ''),
(2, '99', 'nancyrivera', 'nando14', 'Nancy', 'Rivera', 'z@gmail.com', 'zz', '99', 'Activo', 2, 'img/firma1.png'),
(3, '321', 'elbitaluz', 'pipenena', 'Elba', 'Fernandez', 'c@gmail.com', 'cr', '2222', 'Activo', 3, 'img/firma2.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `veterinario`
--

CREATE TABLE `veterinario` (
  `vet_id` int(10) NOT NULL,
  `vet_nombre` varchar(120) NOT NULL,
  `vet_email` varchar(100) NOT NULL,
  `vet_tel` varchar(15) NOT NULL,
  `vet_veterinaria` varchar(100) NOT NULL,
  `vet_direccion` varchar(100) NOT NULL,
  `vet_estado` varchar(10) NOT NULL,
  `usu_crea` varchar(15) NOT NULL,
  `fecha_crea` date NOT NULL,
  `usu_anula` varchar(15) NOT NULL,
  `fecha_anula` date NOT NULL
) ;

--
-- Volcado de datos para la tabla `veterinario`
--

INSERT INTO `veterinario` (`vet_id`, `vet_nombre`, `vet_email`, `vet_tel`, `vet_veterinaria`, `vet_direccion`, `vet_estado`, `usu_crea`, `fecha_crea`, `usu_anula`, `fecha_anula`) VALUES
(1, 'Claudia Suarez ', 'perroamor732@hotmail.com', '3045909984', 'Perro amor ', ' Calle 14 #46B-09 ', 'Activo', '', '0000-00-00', '', '0000-00-00'),
(2, ' MARIA TIBISAY CABELLO', 'karenamonroy@gmail.com', '', 'ANIMALAHIA ', '', 'Activo', '', '0000-00-00', '', '0000-00-00'),
(3, ' German Gallo ', 'germangallo1234@hotmail.com', '', 'AGROMASCOTAS ', '', 'Activo', '', '0000-00-00', '', '0000-00-00'),
(4, 'JULIO CESAR ACOSTA', 'centroanimaljamundi01@gmail.com', '', 'CENTRO ANIMAL ', '', 'Activo', '', '0000-00-00', '', '0000-00-00'),
(5, ' ANIBAL LOPEZ ', 'jhanibal3@hotmail.com', '', 'ANIMASKOTAS ', '', 'Activo', '', '0000-00-00', '', '0000-00-00'),
(6, 'YULIAN PINTO', 'veterinariaportal@hotmail.com', '', 'VETERINARIA EL PORTAL ', ' Jamundi', 'Activo', '', '0000-00-00', '', '0000-00-00'),
(7, ' CESAR ZAPATA ', 'centroveterinariosanmiguel@hotmail.com', '', 'SAN MIGUEL ', '', 'Activo', '', '0000-00-00', '', '0000-00-00'),
(8, ' JONATAN LOPEZ ', 'tumascotaclinicaveterinaria@outlook.com', '', 'TU MASCOTA ', '', 'Activo', '', '0000-00-00', '', '0000-00-00'),
(9, 'JOSE ANDRES CANAVAL', 'joseandrescanaval@hotmail.com', '', 'HOME CARE MASCOTAS ', '', 'Activo', '', '0000-00-00', '', '0000-00-00'),
(10, 'ANGELA MARIA RAMIREZ', 'ramireztamayo@gmail.com', '', 'HIRCANES', '', 'Activo', '', '0000-00-00', '', '0000-00-00'),
(11, 'KATHERINE OCAnA-DORA VILLARREAL', 'centroveterinariohuellassanas@gmail. com', '', 'HUELLAS SANAS', '', 'Activo', '', '0000-00-00', '', '0000-00-00'),
(12, 'LUIS CABRALES', 'manchascali@gmail.com', '3216974765', 'MANCHAS PET BOUTIQUE', 'Cra. 125 N?19-170', 'Activo', '', '0000-00-00', '', '0000-00-00'),
(13, 'SERGIO CORREDOR - IVAN CORREDOR', 'clinicaveterinariapetslife@gmail.com', '', 'PETSLIFE', '', 'Activo', '', '0000-00-00', '', '0000-00-00'),
(14, 'RUBEN DARIO MEJIA', 'safaripets@gmail.com', '', 'SAFARIPETS', '', 'Activo', '', '0000-00-00', '', '0000-00-00'),
(15, 'Elba Luz ', 'hache12@gmail.com', '3186346698', 'Diagnovet', 'Calle 13 #65-32 ', 'Activo', '', '0000-00-00', '', '0000-00-00'),
(16, 'ALEJANDRO RAMIREZ', 'resultadostamypradera@gmail.com', '', 'TAMY ', 'JAMUNDI', 'Activo', '', '0000-00-00', '', '0000-00-00'),
(17, 'SEBASTIAN SANCHEZ', 'sanchez.310@hotmail.com', '', 'SEBASTIAN SANCHEZ', 'GUASIMOS 301 -G', 'Activo', '', '0000-00-00', '', '0000-00-00'),
(18, 'ALEJANDRO RAMIREZ', 'pet\'scaresas@outlook.com', '', 'PARTICULAR', '', 'Activo', '', '0000-00-00', '', '0000-00-00'),
(19, 'Juan David Gutierrez', 'animaiaclinicaveterinaria@gmail.com', '3774650-3007072', 'ANIMAIA', 'Cra 96 A No 45-107', 'Activo', '', '0000-00-00', '', '0000-00-00'),
(20, 'SANDRA MUnOZ', 'sandra.munozmvz@gmail.com', '', 'SANDRA MU?OZ', '', 'Activo', '', '0000-00-00', '', '0000-00-00'),
(21, 'NO REPORTADO', 'luzmila010203@hotmail.com', '', 'FABIAN ARENAS', '', 'Activo', '', '0000-00-00', '', '0000-00-00'),
(22, 'FERNANDO RAMIREZ', 'fercho1969@gmail.com', '', 'FRACTURAS DEL VALLE', 'CRA 64 A 10-65', 'Activo', '', '0000-00-00', '', '0000-00-00'),
(23, 'IGNACIO RAMIREZ', 'patomos2008@hotmail.com', '', 'AGROGANADERO', 'JAMUNDI', 'Activo', '', '0000-00-00', '', '0000-00-00'),
(24, 'ALEJANDRO RAMIREZ', 'petscaresas@gmail.com', '3061459', 'PET\'SCARE CENTER', 'CALLE 13 CON 65', 'Activo', '', '0000-00-00', '', '0000-00-00'),
(25, 'PARTICULAR', 'jgallego86@gmail.com', '', 'FRACTURAS DEL VALLE -1', 'CALI', 'Activo', '', '0000-00-00', '', '0000-00-00'),
(26, 'ALEJANDRA CASAS', 'patitadeperro.cali@hotmail.com', '', 'PATITA DE PERRO', '', 'Activo', '', '0000-00-00', '', '0000-00-00'),
(27, 'TOMAS PANTOJA', 'tiendademaskotas@hotmail.es', '3302209', 'TIENDA DE MASCOTAS', 'CALI', 'Activo', '', '0000-00-00', '', '0000-00-00'),
(28, 'IVAN CORREDOR', 'drcorredorveterinaria@gmail.com', '', 'DR. CORREDOR', 'JAMUNDI', 'Activo', '', '0000-00-00', '', '0000-00-00'),
(29, 'MAURICIO VILLALOBOS', 'cvet.villalobos@gmail.com', '', 'CLINICA VETERINARIA VILLALOBOS', 'CALI', 'Activo', '', '0000-00-00', '', '0000-00-00'),
(30, 'CARLOS PANTOJA', 'el_sabueso_cali@yahoo.es', '', 'EL SABUESO', '', 'Activo', '', '0000-00-00', '', '0000-00-00'),
(31, 'JUAN PABLO CIFUENTES', 'cvelbosquea@gmail.com', '', 'EL BOSQUE - ALFAGUARA', '', 'Activo', '', '0000-00-00', '', '0000-00-00'),
(32, 'MELISSA DELGADO', 'vetsathomecali@gmail.com', '', 'VETS AT HOME', '', 'Activo', '', '0000-00-00', '', '0000-00-00'),
(33, 'RAUL ANDRES CARRILLO SUAREZ', 'raulkrrillo@hotmail.com', '', 'RAUL CARRILLO', '', 'Activo', '', '0000-00-00', '', '0000-00-00'),
(34, 'SANTIAGO ROZO', 'clinicaveterinariapetslife@gmail.com', '3745441', 'PETSLIFE 2', 'CALI', 'Activo', '', '0000-00-00', '', '0000-00-00'),
(35, 'DR.CAMILO CARBONELL', 'camihulk2@hotmail.com', '', 'DR.CARBONELL', '', 'Activo', '', '0000-00-00', '', '0000-00-00'),
(36, 'JUAN SEBASTIAN BEJARANO', 'petscaresas@gmail.com', '', 'PET\'S CARE CENTER 1', '', 'Activo', '', '0000-00-00', '', '0000-00-00'),
(37, 'MAURICIO VILLALOBOS', 'cvet.villalobos@gmail.com', '', 'VILLALOBOS', 'CALI', 'Activo', '', '0000-00-00', '', '0000-00-00'),
(38, 'LUCERO HENAO SERNA', 'nanatamayotrujillo@gmail.com', '', 'SALUDCAN', 'CALI', 'Activo', '', '0000-00-00', '', '0000-00-00'),
(39, 'KARINA ORDO?EZ', 'el_sabueso_cali@yahoo.es', '', 'EL SABUESO (1)', '', 'Activo', '', '0000-00-00', '', '0000-00-00'),
(40, 'LAURA SOFIA ORTEGON VALBUENA', 'veterinariaportal@hotmail.com', '', 'EL PORTAL 1', '', 'Activo', '', '0000-00-00', '', '0000-00-00'),
(41, 'LINA M. SOTO', 'linamarcest2@gmail.com', '', 'ZOOSALUD-1', '', 'Activo', '', '0000-00-00', '', '0000-00-00'),
(42, 'LINA M. SOTO', 'linamarcest2@gmail.com', '', 'ZOOSALUD 2', '', 'Activo', '', '0000-00-00', '', '0000-00-00'),
(43, 'LINA MARCELA SOTO', 'CENTROVETERINARIOZOOSALUD@GMAIL.COM', '', 'ZOOSALUD', '', 'Activo', '', '0000-00-00', '', '0000-00-00'),
(44, 'LAURA FONSECA', 'famianimal@gmail.com', '', 'FAMIANIMAL', '', 'Activo', '', '0000-00-00', '', '0000-00-00'),
(45, 'YOLI ASTRID BOLA?OS', 'alye0512@hotmail.com', '', 'PATITAS FELICES', '', 'Activo', '', '0000-00-00', '', '0000-00-00'),
(46, 'JESUS FERNANDO LOSADA', 'veterinariaportal@hotmail.com', '', 'EL PORTAL 2', '', 'Activo', '', '0000-00-00', '', '0000-00-00'),
(47, 'MARIA FERNANDA ESPINOSA', 'mariaespinosaj1957@gmail.com', '', 'CACHORRITOS.CO', '', 'Activo', '', '0000-00-00', '', '0000-00-00'),
(48, 'TATIANA BETANCUR', 'veterinariaportal@hotmail.com', '', 'VETERINARIA EL PORTAL 3', '', 'Activo', '', '0000-00-00', '', '0000-00-00'),
(49, 'JOSE HERNANDEZ', 'ltarruella@hotmail.com', '', 'DR. JOSE HERNANDEZ', '', 'Activo', '', '0000-00-00', '', '0000-00-00');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `concepto`
--
ALTER TABLE `concepto`
  ADD PRIMARY KEY (`con_id`);

--
-- Indices de la tabla `consecutivo_documentos`
--
ALTER TABLE `consecutivo_documentos`
  ADD PRIMARY KEY (`td_sigla`);

--
-- Indices de la tabla `encabezado_egresos`
--
ALTER TABLE `encabezado_egresos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `especie`
--
ALTER TABLE `especie`
  ADD PRIMARY KEY (`esp_id`);

--
-- Indices de la tabla `examen`
--
ALTER TABLE `examen`
  ADD PRIMARY KEY (`exa_id`);

--
-- Indices de la tabla `examen_parametros`
--
ALTER TABLE `examen_parametros`
  ADD PRIMARY KEY (`ep_id`);

--
-- Indices de la tabla `forma_pago`
--
ALTER TABLE `forma_pago`
  ADD PRIMARY KEY (`fp_id`);

--
-- Indices de la tabla `mascota`
--
ALTER TABLE `mascota`
  ADD PRIMARY KEY (`mas_id`);

--
-- Indices de la tabla `matriculas_financieras`
--
ALTER TABLE `matriculas_financieras`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `orden_servicio`
--
ALTER TABLE `orden_servicio`
  ADD PRIMARY KEY (`os_id`);

--
-- Indices de la tabla `orden_servicio_detalle`
--
ALTER TABLE `orden_servicio_detalle`
  ADD PRIMARY KEY (`dos_id`);

--
-- Indices de la tabla `orden_servicio_resultados`
--
ALTER TABLE `orden_servicio_resultados`
  ADD PRIMARY KEY (`osr_id`);

--
-- Indices de la tabla `parametros`
--
ALTER TABLE `parametros`
  ADD PRIMARY KEY (`para_id`);

--
-- Indices de la tabla `perfil`
--
ALTER TABLE `perfil`
  ADD PRIMARY KEY (`per_id`);

--
-- Indices de la tabla `raza`
--
ALTER TABLE `raza`
  ADD PRIMARY KEY (`raza_id`),
  ADD KEY `esp_id` (`esp_id`);

--
-- Indices de la tabla `terceros`
--
ALTER TABLE `terceros`
  ADD PRIMARY KEY (`identificacion`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`usu_id`),
  ADD KEY `per_id` (`per_id`);

--
-- Indices de la tabla `veterinario`
--
ALTER TABLE `veterinario`
  ADD PRIMARY KEY (`vet_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `concepto`
--
ALTER TABLE `concepto`
  MODIFY `con_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `encabezado_egresos`
--
ALTER TABLE `encabezado_egresos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `especie`
--
ALTER TABLE `especie`
  MODIFY `esp_id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `examen`
--
ALTER TABLE `examen`
  MODIFY `exa_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT de la tabla `examen_parametros`
--
ALTER TABLE `examen_parametros`
  MODIFY `ep_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=213;
--
-- AUTO_INCREMENT de la tabla `forma_pago`
--
ALTER TABLE `forma_pago`
  MODIFY `fp_id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `mascota`
--
ALTER TABLE `mascota`
  MODIFY `mas_id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `orden_servicio_detalle`
--
ALTER TABLE `orden_servicio_detalle`
  MODIFY `dos_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT de la tabla `orden_servicio_resultados`
--
ALTER TABLE `orden_servicio_resultados`
  MODIFY `osr_id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;
--
-- AUTO_INCREMENT de la tabla `parametros`
--
ALTER TABLE `parametros`
  MODIFY `para_id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=162;
--
-- AUTO_INCREMENT de la tabla `perfil`
--
ALTER TABLE `perfil`
  MODIFY `per_id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `raza`
--
ALTER TABLE `raza`
  MODIFY `raza_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `usu_id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `veterinario`
--
ALTER TABLE `veterinario`
  MODIFY `vet_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `raza`
--
ALTER TABLE `raza`
  ADD CONSTRAINT `raza_ibfk_1` FOREIGN KEY (`esp_id`) REFERENCES `especie` (`esp_id`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`per_id`) REFERENCES `perfil` (`per_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
