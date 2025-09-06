<?php
$host = "localhost";   // servidor
$user = "root";        // usuario de MySQL
$pass = "";            // contraseña de MySQL
$db   = "petshop";     // nombre de tu base de datos

$conn = new mysqli($host, $user, $pass, $db);

if ($conn->connect_error) {
    die("Error de conexión: " . $conn->connect_error);
}
?>