CREATE TABLE `resultado_orden` (
  `res_id` INT(11) NOT NULL AUTO_INCREMENT,
  `orden_id` INT(11) NOT NULL,
  `descripcion` TEXT NOT NULL,
  `fecha_resultado` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estado` VARCHAR(20) NOT NULL DEFAULT 'Pendiente',
  PRIMARY KEY (`res_id`),
  KEY `fk_resultado_orden_orden` (`orden_id`),
  CONSTRAINT `fk_resultado_orden_orden` FOREIGN KEY (`orden_id`) REFERENCES `orden_servicio` (`orden_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `resultado_orden` (`orden_id`, `descripcion`, `fecha_resultado`, `estado`) VALUES
(1, 'Resultado de análisis de sangre: Todo normal.', NOW(), 'Completado'),
(2, 'Radiografía muestra posible fractura.', NOW(), 'Completado'),
(3, 'Examen parasitológico: negativo.', NOW(), 'Completado');