<?php
namespace Controller\Examen;
require_once __DIR__ . '/../../Lib/db.php';
require_once __DIR__ . '/../../Lib/helpers.php';

class CtrlExamen {
  public function index() {
    $rows = db()->query("SELECT exa_id, exa_descripcion, exa_valor, exa_tipo, exa_estado FROM examen ORDER BY exa_descripcion")->fetchAll();
    require __DIR__ . '/../../View/Examen/ViewExamen.php';
    \View\Examen\ViewExamen::list($rows);
  }
  public function create() {
    if ($_SERVER['REQUEST_METHOD']==='GET') {
      require __DIR__ . '/../../View/Examen/ViewExamen.php';
      \View\Examen\ViewExamen::createForm();
      return;
    }
    $desc = $_POST['exa_descripcion'] ?? '';
    $val  = (int)($_POST['exa_valor'] ?? 0);
    $tipo = $_POST['exa_tipo'] ?? '';
    $est  = $_POST['exa_estado'] ?? 'Activo';
    if(!$desc){ echo "Descripción requerida"; return; }
    $sql = "INSERT INTO examen (exa_descripcion, exa_valor, exa_tipo, exa_estado) VALUES (?,?,?,?)";
    db()->prepare($sql)->execute([$desc, $val, $tipo, $est]);
    header("Location: " . \getUrl('Examen','Examen','index'));
  }
}
