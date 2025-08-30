<?php
// Web/index.php - muestra index.html y agrega barra de gestión sin tocar el HTML original
$path = __DIR__ . '/index.html';
if (!file_exists($path)) { http_response_code(404); die('Falta index.html'); }
$html = file_get_contents($path);
$bar = <<<HTML
<!-- Barra de gestión inyectada -->
<div class="admin-bar" style="position:sticky;top:0;background:#1f2937;color:#fff;padding:8px;text-align:center;z-index:9999;font-family:Arial,Helvetica,sans-serif">
  <strong>Gestión:</strong>
  <a href="router.php?mod=OrdenServicio&ctrl=OrdenServicio&func=index" style="color:#ffd54f;margin:0 10px;text-decoration:none">Órdenes</a>
  <a href="router.php?mod=Examen&ctrl=Examen&func=index" style="color:#ffd54f;margin:0 10px;text-decoration:none">Exámenes</a>
  <a href="router.php?mod=Parametro&ctrl=Parametro&func=index" style="color:#ffd54f;margin:0 10px;text-decoration:none">Parámetros</a>
</div>
HTML;
$html = preg_replace('/<body[^>]*>/i', '$0' . $bar, $html, 1);
echo $html;