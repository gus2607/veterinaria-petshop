CREATE DATABASE IF NOT EXISTS petshop;
/*Tabla concepto de pago*/

use petshop; 
CREATE TABLE concepto(
  con_id INT(3) NOT NULL AUTO_INCREMENT,
  con_descripcion VARCHAR(100) NOT NULL,
  con_estado VARCHAR(10) NOT NULL,
  PRIMARY KEY (con_id)
);

INSERT INTO `concepto` (`con_id`, `con_descripcion`, `con_estado`) VALUES
(2, 'Pago a terceros', 'Activo');
/*forma de pago*/
CREATE TABLE `forma_pago` (
  `fp_id` int(2) NOT NULL AUTO_INCREMENT,
  `fp_descripcion` varchar(50) NOT NULL,
  `fp_estado` varchar(15) NOT NULL,
  PRIMARY KEY (`fp_id`)
);

INSERT INTO `forma_pago` (`fp_id`, `fp_descripcion`, `fp_estado`) VALUES
(1, 'Efectivo', 'Activo'),
(2, 'Transferencia', 'Activo');
/*terceros*/
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
  `estado` varchar(10) NOT NULL,
  PRIMARY KEY (`identificacion`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

INSERT INTO `terceros` (`id`, `ti_descripcion`, `identificacion`, `representante_legal`, `razon_social`, `direccion`, `tel1`, `tel2`, `observaciones`, `usu_crea`, `fecha_crea`, `usu_anula`, `fecha_anula`, `razon_anula`, `estado`) VALUES
(1, '', '123', 'Done', 'Veterinaria Doctor PET', '', '', '', '', '', '2020-07-20 03:49:28', '', '0000-00-00 00:00:00', '', 'A');
/*comprobante de egresos*/
CREATE TABLE `encabezado_egresos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `no_egreso` int(11) NOT NULL,
  `fecha_documento` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `tercero_identificacion` varchar(15) NOT NULL,
  `detalle` varchar(250) NOT NULL,
  `fp_id` int(3) NOT NULL,
  `conceptoEgreso_codigo` int(4) NOT NULL,
  `no_documento` varchar(15) NOT NULL,
  `valor_egreso` double NOT NULL,
  `estado` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
);