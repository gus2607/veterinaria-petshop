<?php
namespace View\Parametro;
class ViewParametro {
  public static function list(array $rows){ ?>
<!doctype html><html lang="es"><head><?php require __DIR__ . '/../Partials/Headphp.php'; ?></head><body>
<?php require __DIR__ . '/../Partials/sb-topnav.php'; ?>
<div class="container">
  <h2>Parámetros</h2>
  <p><a class="btn btn-primary" href="<?= \getUrl('Parametro','Parametro','create'); ?>">+ Nuevo</a></p>
  <table class="table"><thead><tr><th>ID</th><th>Descripción</th><th>Unidad</th><th>Estado</th><th>Fórmula</th><th>R1</th><th>R2</th></tr></thead><tbody>
  <?php foreach($rows as $r): ?><tr>
    <td><?= (int)$r['para_id'] ?></td>
    <td><?= htmlspecialchars($r['para_descripcion']) ?></td>
    <td><?= htmlspecialchars($r['para_unidad']) ?></td>
    <td><?= htmlspecialchars($r['para_estado']) ?></td>
    <td><?= htmlspecialchars($r['para_formula']) ?></td>
    <td><?= htmlspecialchars($r['para_referencia1']) ?></td>
    <td><?= htmlspecialchars($r['para_referencia2']) ?></td>
  </tr><?php endforeach; ?>
  </tbody></table>
</div>
<?php require __DIR__ . '/../Partials/footer.php'; ?>
</body></html>
<?php }
  public static function createForm(){ ?>
<!doctype html><html lang="es"><head><?php require __DIR__ . '/../Partials/Headphp.php'; ?></head><body>
<?php require __DIR__ . '/../Partials/sb-topnav.php'; ?>
<div class="container">
  <h2>Crear Parámetro</h2>
  <form method="post" action="<?= \getUrl('Parametro','Parametro','create'); ?>">
    <div><label>Descripción</label><br><input name="para_descripcion" class="form-control" required></div>
    <div><label>Unidad</label><br><input name="para_unidad" class="form-control" placeholder="mg/dL, %, etc."></div>
    <div><label>Estado</label><br><select name="para_estado" class="form-select"><option>Activo</option><option>Inactivo</option></select></div>
    <div><label>Fórmula</label><br><input name="para_formula" class="form-control" placeholder=""></div>
    <div><label>Rango Ref. 1</label><br><input name="para_referencia1" class="form-control"></div>
    <div><label>Rango Ref. 2</label><br><input name="para_referencia2" class="form-control"></div>
    <div style="margin-top:10px">
      <button class="btn btn-primary">Guardar</button>
      <a class="btn" href="<?= \getUrl('Parametro','Parametro','index'); ?>">Cancelar</a>
    </div>
  </form>
</div>
<?php require __DIR__ . '/../Partials/footer.php'; ?>
</body></html>
<?php } }