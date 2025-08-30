# Veterinaria (Backend con esquema de la profesora)
Este proyecto usa la plantilla en `Web/` y módulos de Gustavo conectados a MySQL **con las tablas del archivo de la profesora**.

## Archivos clave
- Web/index.html → intacto (plantilla)
- Web/index.php → muestra index.html e inyecta barra de Gestión
- Web/router.php → front-controller MVC
- Lib/db.php → conexión (cambia $db si tu BD tiene otro nombre)
- Controller/* y View/* → módulos (Examen, Parámetro, OrdenServicio)
- SQL/labpets_prof_original.sql → archivo tal cual de la profesora
- SQL/labpets_prof_fixed.sql → misma estructura con correcciones menores (comas finales)

## Pasos
1. En phpMyAdmin crea una BD, por ejemplo **labpets** (o el nombre que prefieras).
2. Importa **SQL/labpets_prof_fixed.sql** (si el original falla por comas finales).
3. Abre `Lib/db.php` y ajusta `$db` al nombre de tu BD.
4. Arranca servidor en Web:
   `C:\xampp\php\php.exe -S localhost:8000 -t Web`
5. Entra a:
   - Plantilla: `http://localhost:8000/index.php`
   - Órdenes: `http://localhost:8000/router.php?mod=OrdenServicio&ctrl=OrdenServicio&func=index`
   - Exámenes: `http://localhost:8000/router.php?mod=Examen&ctrl=Examen&func=index`
   - Parámetros: `http://localhost:8000/router.php?mod=Parametro&ctrl=Parametro&func=index`

> Nota: campos obligatorios adicionales del esquema (p.ej. `os_mas_propietario`, `os_observacionesResultados`, `os_usuResultado_crea`) ya están contemplados con valores por defecto al crear órdenes.
