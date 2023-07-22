<?php
include 'test.php';

mysqli_set_charset($conexion,"utf8");

$variable1 = $_GET['Origen'];
$variable2 = $_GET['Destino'];
//2. Tomar los campos provenientes de la tabla
$consulta="SELECT * FROM rutas where Origen='".$variable1."' and Destino='".$variable2."'";
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