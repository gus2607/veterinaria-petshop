<?php
namespace Controller\OrdenServicio;
require_once __DIR__ . '/../../Lib/db.php';
require_once __DIR__ . '/../../Lib/helpers.php';

class CtrlOrdenServicio {
  public function index() {
    $sql = "SELECT os.os_id, os.os_fecha, os.os_valor_total, os.os_estado,
                   m.mas_nombre, v.vet_nombre
            FROM orden_servicio os
            JOIN mascota m ON m.mas_id = os.os_mas_id
            JOIN veterinario v ON v.vet_id = os.os_vet_id
            ORDER BY os.os_fecha DESC";
    $rows = db()->query($sql)->fetchAll();
    require __DIR__ . '/../../View/OrdenServicio/ViewOrdenServicio.php';
    \View\OrdenServicio\ViewOrdenServicio::list($rows);
  }

  public function create() {
    if ($_SERVER['REQUEST_METHOD'] === 'GET') {
      $mascotas = db()->query("SELECT mas_id, mas_nombre FROM mascota ORDER BY mas_nombre")->fetchAll();
      $veterinarios = db()->query("SELECT vet_id, vet_nombre FROM veterinario ORDER BY vet_nombre")->fetchAll();
      $examenes = db()->query("SELECT exa_id, exa_descripcion, exa_valor FROM examen WHERE exa_estado='Activo' ORDER BY exa_descripcion")->fetchAll();
      require __DIR__ . '/../../View/OrdenServicio/ViewOrdenServicio.php';
      \View\OrdenServicio\ViewOrdenServicio::createForm($mascotas, $veterinarios, $examenes);
      return;
    }

    $os_fecha  = $_POST['os_fecha'] ?? date('Y-m-d');
    $os_mas_id = (int)($_POST['os_mas_id'] ?? 0);
    $os_vet_id = (int)($_POST['os_vet_id'] ?? 0);
    $os_obs    = trim($_POST['os_observaciones'] ?? '');
    $os_prop   = trim($_POST['os_mas_propietario'] ?? '');

    $exa_ids    = $_POST['exa_id'] ?? [];
    $cantidades = $_POST['cantidad'] ?? [];

    if (!$os_mas_id || !$os_vet_id || empty($exa_ids)) {
      http_response_code(400);
      echo "Faltan datos obligatorios (mascota, veterinario o exámenes).";
      return;
    }

    $pdo = db();
    $pdo->beginTransaction();
    try {
      $insOS = $pdo->prepare("INSERT INTO orden_servicio
        (os_fecha, os_vet_id, os_mas_id, os_mas_propietario, os_estado, os_valor_total, os_abono, os_observaciones, os_observacionesResultados, os_usuResultado_crea)
        VALUES (?,?,?,?,?,?,?,?,?,?)");
      // Inicial total 0, abono 0, estado Pendiente, obsResultados '', usuResultado_crea ''
      $insOS->execute([$os_fecha, $os_vet_id, $os_mas_id, $os_prop, 'Pendiente', 0, 0, $os_obs, '', '']);
      $os_id = (int)$pdo->lastInsertId();

      $qExa   = $pdo->prepare("SELECT exa_valor FROM examen WHERE exa_id=?");
      $insDet = $pdo->prepare("INSERT INTO orden_servicio_detalle
        (dos_os_id, dos_exa_id, dos_exa_valor, dos_exa_cantidad, dos_exa_observaciones)
        VALUES (?,?,?,?,?)");

      $total = 0;
      foreach ($exa_ids as $i => $eid) {
        $eid  = (int)$eid;
        $cant = max(1, (int)($cantidades[$i] ?? 1));
        $qExa->execute([$eid]);
        $price = (int)($qExa->fetchColumn() ?: 0);
        $insDet->execute([$os_id, $eid, $price, (string)$cant, '']);
        $total += $cant * $price;
      }

      $upd = $pdo->prepare("UPDATE orden_servicio SET os_valor_total=? WHERE os_id=?");
      $upd->execute([$total, $os_id]);

      $pdo->commit();
      header("Location: " . \getUrl('OrdenServicio','OrdenServicio','show', ['os_id'=>$os_id]));
      return;
    } catch (\Exception $e) {
      $pdo->rollBack();
      http_response_code(500);
      echo "Error guardando la orden: " . htmlspecialchars($e->getMessage());
    }
  }

  public function show() {
    $os_id = (int)($_GET['os_id'] ?? 0);
    if (!$os_id) { http_response_code(400); echo "os_id requerido"; return; }

    $qh = db()->prepare("SELECT os.*, m.mas_nombre, v.vet_nombre
                         FROM orden_servicio os
                         JOIN mascota m ON m.mas_id=os.os_mas_id
                         JOIN veterinario v ON v.vet_id=os.os_vet_id
                         WHERE os_id=?");
    $qh->execute([$os_id]);
    $os = $qh->fetch();

    $qd = db()->prepare("SELECT d.dos_id, e.exa_descripcion, d.dos_exa_cantidad, d.dos_exa_valor,
                                (CAST(d.dos_exa_cantidad AS UNSIGNED) * d.dos_exa_valor) AS subtotal
                         FROM orden_servicio_detalle d
                         JOIN examen e ON e.exa_id = d.dos_exa_id
                         WHERE d.dos_os_id=?");
    $qd->execute([$os_id]);
    $detalle = $qd->fetchAll();

    require __DIR__ . '/../../View/OrdenServicio/ViewOrdenServicio.php';
    \View\OrdenServicio\ViewOrdenServicio::show($os, $detalle);
  }
}
