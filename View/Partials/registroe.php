<h1>Registrar Egreso</h1>
  <form action="procesar_egreso.php" method="POST">
    <label>No. Egreso:</label><br>
    <input type="text" name="no_egreso" required><br><br>

    <label>Identificación Tercero:</label><br>
    <input type="text" name="tercero_identificacion" required><br><br>

    <label>Detalle:</label><br>
    <input type="text" name="detalle" required><br><br>

    <label>Forma de pago (ID):</label><br>
    <input type="number" name="fp_id" required><br><br>

    <label>Concepto (ID):</label><br>
    <input type="number" name="conceptoEgreso_codigo" required><br><br>

    <label>No. Documento:</label><br>
    <input type="text" name="no_documento" required><br><br>

    <label>Valor del egreso:</label><br>
    <input type="number" name="valor_egreso" required><br><br>

    <button type="submit">Guardar</button>
  </form>