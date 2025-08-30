<?php
// Web/router.php — Front Controller
require_once __DIR__ . '/../Lib/db.php';
require_once __DIR__ . '/../Lib/helpers.php';

$module = $_GET['mod']  ?? 'OrdenServicio';
$ctrl   = $_GET['ctrl'] ?? 'OrdenServicio';
$func   = $_GET['func'] ?? 'index';

$ctrlClass = "Controller\\{$module}\\Ctrl{$ctrl}";
$ctrlFile  = __DIR__ . "/../Controller/{$module}/Ctrl{$ctrl}.php";

if (!file_exists($ctrlFile)) { http_response_code(404); die("Controlador no encontrado: $ctrlFile"); }
require_once $ctrlFile;
if (!class_exists($ctrlClass)) { http_response_code(500); die("Clase no encontrada: $ctrlClass"); }

$controller = new $ctrlClass();
if (!method_exists($controller, $func)) { http_response_code(404); die("Método no encontrado: {$ctrlClass}::{$func}()"); }
$controller->$func();