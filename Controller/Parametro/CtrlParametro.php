<?php
namespace Controller\Parametro;
require_once __DIR__ . '/../../Lib/db.php';
require_once __DIR__ . '/../../Lib/helpers.php';

class CtrlParametro {
  public function index() {
    $rows = db()->query("SELECT para_id, para_descripcion, para_unidad, para_referencia1, para_referencia2, para_estado, para_formula FROM parametros ORDER BY para_descripcion")->fetchAll();
    require __DIR__ . '/../../View/Parametro/ViewParametro.php';
    \View\Parametro\ViewParametro::list($rows);
  }
  public function create() {
    if ($_SERVER['REQUEST_METHOD']==='GET') {
      require __DIR__ . '/../../View/Parametro/ViewParametro.php';
      \View\Parametro\ViewParametro::createForm();
      return;
    }
    $d = $_POST['para_descripcion'] ?? '';
    $u = $_POST['para_unidad'] ?? '';
    $r1= $_POST['para_referencia1'] ?? '';
    $r2= $_POST['para_referencia2'] ?? '';
    $est = $_POST['para_estado'] ?? 'Activo';
    $form = $_POST['para_formula'] ?? '';
    if(!$d){ echo "Descripción requerida"; return; }
    $sql = "INSERT INTO parametros (para_descripcion, para_unidad, para_estado, para_formula, para_referencia1, para_referencia2) VALUES (?,?,?,?,?,?)";
    db()->prepare($sql)->execute([$d,$u,$est,$form,$r1,$r2]);
    header("Location: " . \getUrl('Parametro','Parametro','index'));
  }
}
