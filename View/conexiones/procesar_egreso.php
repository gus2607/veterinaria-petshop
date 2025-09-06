<?php
include("conexion.php");

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $no_egreso   = $_POST['no_egreso'];
    $tercero     = $_POST['tercero_identificacion'];
    $detalle     = $_POST['detalle'];
    $fp_id       = $_POST['fp_id'];
    $concepto    = $_POST['conceptoEgreso_codigo'];
    $no_doc      = $_POST['no_documento'];
    $valor       = $_POST['valor_egreso'];
    $estado      = "Activo";

    $sql = "INSERT INTO encabezado_egresos 
            (no_egreso, tercero_identificacion, detalle, fp_id, conceptoEgreso_codigo, no_documento, valor_egreso, estado) 
            VALUES ('$no_egreso', '$tercero', '$detalle', '$fp_id', '$concepto', '$no_doc', '$valor', '$estado')";

    if ($conn->query($sql) === TRUE) {
        echo " Egreso guardado correctamente";
    } else {
        echo " Error: " . $conn->error;
    }
}
?>