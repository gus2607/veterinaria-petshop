
-- Subset limpio para el módulo de Gustavo (compatible con el esquema de la profesora)
-- Crea solo las tablas necesarias: mascota, veterinario, examen, parametros,
-- orden_servicio, orden_servicio_detalle.

-- Usa tu base de datos (ajusta el nombre si es distinto)
CREATE DATABASE IF NOT EXISTS labpets CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE labpets;

-- ==== Catálogos mínimos ====
DROP TABLE IF EXISTS mascota;
CREATE TABLE mascota (
  mas_id INT NOT NULL AUTO_INCREMENT,
  mas_nombre VARCHAR(120) NOT NULL,
  PRIMARY KEY (mas_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS veterinario;
CREATE TABLE veterinario (
  vet_id INT NOT NULL AUTO_INCREMENT,
  vet_nombre VARCHAR(120) NOT NULL,
  PRIMARY KEY (vet_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS examen;
CREATE TABLE examen (
  exa_id INT NOT NULL AUTO_INCREMENT,
  exa_descripcion VARCHAR(120) NOT NULL,
  exa_valor INT NOT NULL DEFAULT 0,
  exa_tipo VARCHAR(50) DEFAULT NULL,
  exa_estado VARCHAR(10) NOT NULL DEFAULT 'Activo',
  PRIMARY KEY (exa_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS parametros;
CREATE TABLE parametros (
  para_id INT NOT NULL AUTO_INCREMENT,
  para_descripcion VARCHAR(120) NOT NULL,
  para_unidad VARCHAR(30) DEFAULT NULL,
  para_estado VARCHAR(10) NOT NULL DEFAULT 'Activo',
  para_formula VARCHAR(120) DEFAULT NULL,
  para_referencia1 VARCHAR(60) DEFAULT NULL,
  para_referencia2 VARCHAR(60) DEFAULT NULL,
  PRIMARY KEY (para_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ==== Orden de servicio ====
DROP TABLE IF EXISTS orden_servicio;
CREATE TABLE orden_servicio (
  os_id INT NOT NULL AUTO_INCREMENT,
  os_fecha DATE NOT NULL,
  os_vet_id INT NOT NULL,
  os_mas_id INT NOT NULL,
  os_mas_propietario VARCHAR(120) DEFAULT '',
  os_estado VARCHAR(20) NOT NULL DEFAULT 'Pendiente',
  os_valor_total INT NOT NULL DEFAULT 0,
  os_abono INT NOT NULL DEFAULT 0,
  os_observaciones VARCHAR(255) DEFAULT '',
  os_observacionesResultados VARCHAR(255) DEFAULT '',
  os_usuResultado_crea VARCHAR(60) DEFAULT '',
  PRIMARY KEY (os_id),
  INDEX (os_vet_id),
  INDEX (os_mas_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS orden_servicio_detalle;
CREATE TABLE orden_servicio_detalle (
  dos_id INT NOT NULL AUTO_INCREMENT,
  dos_os_id INT NOT NULL,
  dos_exa_id INT NOT NULL,
  dos_exa_valor INT NOT NULL DEFAULT 0,
  dos_exa_cantidad VARCHAR(15) NOT NULL DEFAULT '1',
  dos_exa_observaciones VARCHAR(120) DEFAULT '',
  PRIMARY KEY (dos_id),
  INDEX (dos_os_id),
  INDEX (dos_exa_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- (Opcional) llaves foráneas si quieres activarlas:
-- ALTER TABLE orden_servicio ADD CONSTRAINT fk_os_mascota FOREIGN KEY (os_mas_id) REFERENCES mascota(mas_id);
-- ALTER TABLE orden_servicio ADD CONSTRAINT fk_os_vet FOREIGN KEY (os_vet_id) REFERENCES veterinario(vet_id);
-- ALTER TABLE orden_servicio_detalle ADD CONSTRAINT fk_det_os FOREIGN KEY (dos_os_id) REFERENCES orden_servicio(os_id);
-- ALTER TABLE orden_servicio_detalle ADD CONSTRAINT fk_det_exa FOREIGN KEY (dos_exa_id) REFERENCES examen(exa_id);

-- ==== Datos de prueba ====
INSERT INTO mascota (mas_nombre) VALUES ('Firulais'),('Mishi');
INSERT INTO veterinario (vet_nombre) VALUES ('Dra. López'),('Dr. Pérez');
INSERT INTO examen (exa_descripcion, exa_valor, exa_tipo) VALUES
('Hemograma',30000,'Laboratorio'),
('Perfil renal',45000,'Laboratorio');
