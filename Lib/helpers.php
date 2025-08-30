<?php
date_default_timezone_set("America/Bogota");
function baseUrl() {
  $isHttps = (!empty($_SERVER['HTTPS']) && $_SERVER['HTTPS'] !== 'off');
  $proto = $isHttps ? 'https' : 'http';
  $host = $_SERVER['HTTP_HOST'] ?? 'localhost';
  $path = rtrim(dirname($_SERVER['SCRIPT_NAME']), '/\\');
  return $proto . '://' . $host . $path . '/';
}
function getUrl($module, $controller, $function, $params = []) {
  $q = http_build_query(array_merge(['mod'=>$module,'ctrl'=>$controller,'func'=>$function], $params));
  return baseUrl() . 'router.php?' . $q;
}
