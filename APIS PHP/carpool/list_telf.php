<?php
include 'test.php';

//1. Crear conexión a la Base de Datos
mysqli_set_charset($conexion,"utf8");
//2. Tomar los campos provenientes de la tabla
$variable1 = $_GET['Celular'];

$consulta="SELECT * FROM rutas where Celular='".$variable1."'";
$resultado = mysqli_query($conexion, $consulta);
 $json1=array();
 while($fila = mysqli_fetch_assoc($resultado))
 {
 array_push($json1,$fila);
 }
//Esta instrucción (print), envía la respuesta a la App de antroid.

//Aquí se le devuelve a la App de Android.
 print json_encode($json1);
 mysqli_close($conexion);
?>
