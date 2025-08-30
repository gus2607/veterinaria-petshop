<?php
require_once __DIR__ . "/../../Controller/ResultadoOrden/CtrlResultadoOrden.php";

$ctrl = new CtrlResultadoOrden();

// Crear nuevo resultado (si se envió el formulario)
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['orden_id'], $_POST['descripcion'])) {
    $ctrl->crear($_POST['orden_id'], $_POST['descripcion'], $_POST['estado'] ?? 'Pendiente');
}

// Obtener lista de resultados
$resultados = $ctrl->listar();
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Resultados de Órdenes</title>
</head>
<body>
    <h1>Resultados de Órdenes</h1>

    <h2>Nuevo Resultado</h2>
    <form method="post">
        <label>ID Orden:</label>
        <input type="number" name="orden_id" required>
        <br>
        <label>Descripción:</label>
        <textarea name="descripcion" required></textarea>
        <br>
        <label>Estado:</label>
        <select name="estado">
            <option value="Pendiente">Pendiente</option>
            <option value="Completado">Completado</option>
        </select>
        <br>
        <button type="submit">Guardar</button>
    </form>

    <h2>Listado de Resultados</h2>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Orden</th>
            <th>Descripción</th>
            <th>Fecha</th>
            <th>Estado</th>
        </tr>
        <?php foreach ($resultados as $res): ?>
        <tr>
            <td><?= htmlspecialchars($res['res_id']) ?></td>
            <td><?= htmlspecialchars($res['orden_id']) ?></td>
            <td><?= htmlspecialchars($res['descripcion']) ?></td>
            <td><?= htmlspecialchars($res['fecha_resultado']) ?></td>
            <td><?= htmlspecialchars($res['estado']) ?></td>
        </tr>
        <?php endforeach; ?>
    </table>

</body>
</html>
