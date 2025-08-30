<?php
namespace View\OrdenServicio;
class ViewOrdenServicio {
  public static function list(array $rows){ ?>
<!doctype html><html lang="es"><head><?php require __DIR__ . '/../Partials/Headphp.php'; ?></head><body>
<?php require __DIR__ . '/../Partials/sb-topnav.php'; ?>
<div class="container">
  <h2>Órdenes de Servicio</h2>
  <p><a class="btn btn-primary" href="<?= \getUrl('OrdenServicio','OrdenServicio','create'); ?>">+ Nueva Orden</a></p>
  <table class="table"><thead><tr><th>#</th><th>Fecha</th><th>Mascota</th><th>Veterinario</th><th>Estado</th><th>Total</th><th>Ver</th></tr></thead><tbody>
  <?php foreach($rows as $r): ?><tr>
    <td><?= (int)$r['os_id'] ?></td>
    <td><?= htmlspecialchars($r['os_fecha']) ?></td>
    <td><?= htmlspecialchars($r['mas_nombre']) ?></td>
    <td><?= htmlspecialchars($r['vet_nombre']) ?></td>
    <td><span class="badge"><?= htmlspecialchars($r['os_estado']) ?></span></td>
    <td><?= number_format($r['os_valor_total'],0) ?></td>
    <td><a class="btn" href="<?= \getUrl('OrdenServicio','OrdenServicio','show',['os_id'=>(int)$r['os_id']]); ?>">Abrir</a></td>
  </tr><?php endforeach; ?>
  </tbody></table>
</div>
<?php require __DIR__ . '/../Partials/footer.php'; ?>
</body></html>
<?php }

  public static function createForm(array $mascotas, array $veterinarios, array $examenes){ ?>
<!doctype html><html lang="es"><head><?php require __DIR__ . '/../Partials/Headphp.php'; ?></head><body>
<?php require __DIR__ . '/../Partials/sb-topnav.php'; ?>
<div class="container">
  <h2>Crear Orden de Servicio</h2>
  <form method="post" action="<?= \getUrl('OrdenServicio','OrdenServicio','create'); ?>" id="osForm">
    <div>
      <label>Fecha</label><br>
      <input type="date" name="os_fecha" value="<?= date('Y-m-d') ?>" class="form-control" required>
    </div>
    <div>
      <label>Mascota</label><br>
      <select name="os_mas_id" class="form-select" required>
        <option value="">-- Selecciona --</option>
        <?php foreach($mascotas as $m): ?>
          <option value="<?= $m['mas_id'] ?>"><?= htmlspecialchars($m['mas_nombre']) ?></option>
        <?php endforeach; ?>
      </select>
    </div>
    <div>
      <label>Propietario</label><br>
      <input name="os_mas_propietario" class="form-control" placeholder="Nombre del propietario">
    </div>
    <div>
      <label>Veterinario</label><br>
      <select name="os_vet_id" class="form-select" required>
        <option value="">-- Selecciona --</option>
        <?php foreach($veterinarios as $v): ?>
          <option value="<?= $v['vet_id'] ?>"><?= htmlspecialchars($v['vet_nombre']) ?></option>
        <?php endforeach; ?>
      </select>
    </div>
    <div>
      <label>Observaciones</label><br>
      <textarea name="os_observaciones" rows="3" class="form-control"></textarea>
    </div>

    <h3>Exámenes</h3>
    <button type="button" id="addRow" class="btn">+ Agregar examen</button>
    <table id="detTable" class="table">
      <thead><tr><th>Examen</th><th>Cantidad</th><th>Valor (ref.)</th><th>Subtotal</th><th>Quitar</th></tr></thead>
      <tbody>
        <tr>
          <td>
            <select name="exa_id[]" class="form-select exa" required>
              <option value="">-- Selecciona --</option>
              <?php foreach($examenes as $e): ?>
                <option value="<?= $e['exa_id'] ?>" data-valor="<?= (int)$e['exa_valor'] ?>"><?= htmlspecialchars($e['exa_descripcion']) ?></option>
              <?php endforeach; ?>
            </select>
          </td>
          <td><input type="number" name="cantidad[]" class="form-control cant" min="1" value="1" required></td>
          <td><input type="number" name="valor[]" class="form-control valor" step="1" min="0" value="0"></td>
          <td class="subtotal">0</td>
          <td><button type="button" class="btn delRow">X</button></td>
        </tr>
      </tbody>
      <tfoot>
        <tr><td colspan="3" style="text-align:right">TOTAL:</td><td id="totalCell">0</td><td></td></tr>
      </tfoot>
    </table>

    <div style="margin-top:12px">
      <button class="btn btn-primary">Guardar Orden</button>
      <a class="btn" href="<?= \getUrl('OrdenServicio','OrdenServicio','index'); ?>">Cancelar</a>
    </div>
  </form>
</div>
<?php require __DIR__ . '/../Partials/footer.php'; ?>
<script>
const tbody=document.querySelector('#detTable tbody');
const totalCell=document.getElementById('totalCell');
document.getElementById('addRow').addEventListener('click',()=>{
  const tr=document.createElement('tr');
  tr.innerHTML=`
    <td>
      <select name="exa_id[]" class="form-select exa" required>
        <option value="">-- Selecciona --</option>
        <?php foreach($examenes as $e): ?>
          <option value="<?= $e['exa_id'] ?>" data-valor="<?= (int)$e['exa_valor'] ?>"><?= htmlspecialchars($e['exa_descripcion']) ?></option>
        <?php endforeach; ?>
      </select>
    </td>
    <td><input type="number" name="cantidad[]" class="form-control cant" min="1" value="1" required></td>
    <td><input type="number" name="valor[]" class="form-control valor" step="1" min="0" value="0"></td>
    <td class="subtotal">0</td>
    <td><button type="button" class="btn delRow">X</button></td>`;
  tbody.appendChild(tr); bindRow(tr); recalc();
});
function bindRow(tr){
  const exa=tr.querySelector('.exa'), cant=tr.querySelector('.cant'), valor=tr.querySelector('.valor'), del=tr.querySelector('.delRow');
  exa.addEventListener('change',()=>{ const opt=exa.options[exa.selectedIndex]; const ref=parseInt(opt.getAttribute('data-valor')||'0'); valor.value=ref; recalc(); });
  cant.addEventListener('input',recalc); valor.addEventListener('input',recalc);
  del.addEventListener('click',()=>{ tr.remove(); recalc(); });
}
function recalc(){
  let total=0;
  tbody.querySelectorAll('tr').forEach(tr=>{
    const c=parseInt(tr.querySelector('.cant').value||'0'), v=parseInt(tr.querySelector('.valor').value||'0');
    const sub=c*v; tr.querySelector('.subtotal').textContent=sub; total+=sub;
  });
  totalCell.textContent=total;
}
tbody.querySelectorAll('tr').forEach(bindRow);
</script>
</body></html>
<?php }

  public static function show(?array $os, array $detalle){ ?>
<!doctype html><html lang="es"><head><?php require __DIR__ . '/../Partials/Headphp.php'; ?></head><body>
<?php require __DIR__ . '/../Partials/sb-topnav.php'; ?>
<div class="container">
<?php if(!$os): ?><div>No se encontró la orden.</div><?php else: ?>
<h2>Orden de Servicio #<?= (int)$os['os_id'] ?></h2>
<p>
  Fecha: <?= htmlspecialchars($os['os_fecha']) ?> |
  Mascota: <?= htmlspecialchars($os['mas_nombre']) ?> |
  Propietario: <?= htmlspecialchars($os['os_mas_propietario']) ?> |
  Vet: <?= htmlspecialchars($os['vet_nombre']) ?> |
  Estado: <span class="badge"><?= htmlspecialchars($os['os_estado']) ?></span>
</p>
<p><strong>Observaciones:</strong> <?= nl2br(htmlspecialchars($os['os_observaciones'] ?? '')) ?></p>
<table class="table"><thead><tr><th>Examen</th><th>Cantidad</th><th>Valor</th><th>Subtotal</th></tr></thead><tbody>
<?php foreach($detalle as $r): ?>
<tr>
  <td><?= htmlspecialchars($r['exa_descripcion']) ?></td>
  <td><?= htmlspecialchars($r['dos_exa_cantidad']) ?></td>
  <td><?= number_format($r['dos_exa_valor'],0) ?></td>
  <td><?= number_format($r['subtotal'],0) ?></td>
</tr>
<?php endforeach; ?>
</tbody><tfoot><tr><td colspan="3" style="text-align:right">TOTAL:</td><td><?= number_format($os['os_valor_total'],0) ?></td></tr></tfoot></table>
<p><a class="btn" href="<?= \getUrl('OrdenServicio','OrdenServicio','index'); ?>">Volver</a></p>
<?php endif; ?>
</div>
<?php require __DIR__ . '/../Partials/footer.php'; ?>
</body></html>
<?php } }