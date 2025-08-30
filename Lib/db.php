<?php
// Cambia $db si importas con otro nombre
function db(): PDO {
    static $pdo = null;
    if ($pdo) return $pdo;
    $host = '127.0.0.1';
    $db   = 'labpets'; // usa el nombre de tu BD (p.ej., labpets)
    $user = 'root';
    $pass = '';
    $dsn = "mysql:host=$host;dbname=$db;charset=utf8mb4";
    $opt = [
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
    ];
    $pdo = new PDO($dsn, $user, $pass, $opt);
    return $pdo;
}
