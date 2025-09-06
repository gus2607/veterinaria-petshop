<?php
// index.php

include("conexion.php");

// Inyectar barra de gestión
$bar = <<<HTML
<!-- Barra de gestión inyectada -->
<div class="admin-bar" style="position:sticky;top:0;background:#1f2937;color:#fff;padding:8px;text-align:center;z-index:9999;font-family:Arial,Helvetica,sans-serif">
  <strong>Gestión:</strong>
  <a href="router.php?mod=OrdenServicio&ctrl=OrdenServicio&func=index" style="color:#ffd54f;margin:0 10px;text-decoration:none">Órdenes</a>
  <a href="router.php?mod=Examen&ctrl=Examen&func=index" style="color:#ffd54f;margin:0 10px;text-decoration:none">Exámenes</a>
  <a href="router.php?mod=Parametro&ctrl=Parametro&func=index" style="color:#ffd54f;margin:0 10px;text-decoration:none">Parámetros</a>
</div>
HTML;
?>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Pet Shop - Registrar Egreso</title>
  <link href="css/style.css" rel="stylesheet" type="text/css">
  <!--[if IE 6]><link href="css/ie6.css" rel="stylesheet" type="text/css"><![endif]-->
  <!--[if IE 7]><link href="css/ie7.css" rel="stylesheet" type="text/css"><![endif]-->
</head>
<body>
  <?= $bar ?>

  <!-- Cabecera y banner -->
  <?php include_once '../View/partials/header.php'; ?>
  <?php include_once '../View/partials/banner.php'; ?> 
  
  <!-- Formulario de registro -->
  <?php include_once '../View/partials/registroe.php'; ?> 

  <!-- Listado de productos -->
  <h2>Productos destacados</h2>
  <ul>
  <?php
  $sql = "SELECT nombre, descripcion, imagen FROM productos LIMIT 4";
  $result = $conn->query($sql);

  if ($result && $result->num_rows > 0) {
      while ($row = $result->fetch_assoc()) {
          echo "<li>";
          echo "<a href='#'><img src='images/".htmlspecialchars($row['imagen'])."' width='114' height='160' alt=''></a>";
          echo "<h2>".htmlspecialchars($row['nombre'])."</h2>";
          echo "<p>".htmlspecialchars($row['descripcion'])." <a class='more' href='#'>View all</a></p>";
          echo "</li>";
      }
  } else {
      echo "<li>No hay productos disponibles</li>";
  }
  ?>
  </ul>

  <?php include_once '../View/partials/footer.php'; ?>
</body>
</html>
