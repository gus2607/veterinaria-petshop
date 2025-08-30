<?php
namespace View\Examen;
class ViewExamen {
  public static function list(array $rows){ ?>
<!doctype html><html lang="es"><head><?php require __DIR__ . '/../Partials/Headphp.php'; ?></head><body>
<?php require __DIR__ . '/../Partials/sb-topnav.php'; ?>
<div class="container">
  <h2>Exámenes</h2>
  <p><a class="btn btn-primary" href="<?= \getUrl('Examen','Examen','create'); ?>">+ Nuevo</a></p>
  <table class="table"><thead><tr><th>ID</th><th>Descripción</th><th>Valor</th><th>Tipo</th><th>Estado</th></tr></thead><tbody>
  <?php foreach($rows as $r): ?><tr>
    <td><?= (int)$r['exa_id'] ?></td>
    <td><?= htmlspecialchars($r['exa_descripcion']) ?></td>
    <td><?= number_format($r['exa_valor'],0) ?></td>
    <td><?= htmlspecialchars($r['exa_tipo']) ?></td>
    <td><?= htmlspecialchars($r['exa_estado']) ?></td>
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
  <h2>Crear Examen</h2>
  <form method="post" action="<?= \getUrl('Examen','Examen','create'); ?>">
    <div><label>Descripción</label><br><input name="exa_descripcion" class="form-control" required></div>
    <div><label>Valor</label><br><input name="exa_valor" class="form-control" type="number" min="0" value="0"></div>
    <div><label>Tipo</label><br><input name="exa_tipo" class="form-control" placeholder="Laboratorio / Imagen / ..."></div>
    <div><label>Estado</label><br>
      <select name="exa_estado" class="form-select"><option>Activo</option><option>Inactivo</option></select>
    </div>
    <div style="margin-top:10px">
      <button class="btn btn-primary">Guardar</button>
      <a class="btn" href="<?= \getUrl('Examen','Examen','index'); ?>">Cancelar</a>
    </div>
  </form>
</div>
<?php require __DIR__ . '/../Partials/footer.php'; ?>
</body></html>
<?php } }