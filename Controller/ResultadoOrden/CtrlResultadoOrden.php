<?php
require_once __DIR__ . "/../../Lib/db.php";

class CtrlResultadoOrden {

    private $db;

    public function __construct() {
        $this->db = (new DB())->connect();
    }

    // Listar todos los resultados de órdenes
    public function listar() {
        $stmt = $this->db->prepare("SELECT r.res_id, r.orden_id, r.descripcion, r.fecha_resultado, r.estado,
                                           o.cliente_id, o.fecha_orden
                                    FROM resultado_orden r
                                    INNER JOIN orden_servicio o ON r.orden_id = o.orden_id
                                    ORDER BY r.fecha_resultado DESC");
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    // Insertar nuevo resultado
    public function crear($orden_id, $descripcion, $estado = 'Pendiente') {
        $stmt = $this->db->prepare("INSERT INTO resultado_orden (orden_id, descripcion, fecha_resultado, estado)
                                    VALUES (?, ?, NOW(), ?)");
        return $stmt->execute([$orden_id, $descripcion, $estado]);
    }

    // Obtener resultado por ID
    public function obtener($res_id) {
        $stmt = $this->db->prepare("SELECT * FROM resultado_orden WHERE res_id = ?");
        $stmt->execute([$res_id]);
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }

    // Actualizar un resultado
    public function actualizar($res_id, $descripcion, $estado) {
        $stmt = $this->db->prepare("UPDATE resultado_orden SET descripcion = ?, estado = ? WHERE res_id = ?");
        return $stmt->execute([$descripcion, $estado, $res_id]);
    }

    // Eliminar un resultado
    public function eliminar($res_id) {
        $stmt = $this->db->prepare("DELETE FROM resultado_orden WHERE res_id = ?");
        return $stmt->execute([$res_id]);
    }
}
