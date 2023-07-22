<?php
include 'test.php';

$celular = $_GET["Celular"];
$Origen = $_GET["Origen"];
$Destino = $_GET["Destino"];
$Cupos =$_GET["Cupo"];


$insertar = "Delete FROM rutas WHERE Celular='$celular' AND Origen='$Origen' AND Destino='$Destino' AND Cupo='$Cupos'";

$resultado = mysqli_query($conexion, $insertar);

if (!$resultado){
  echo 'WRONG';
}else{
  echo 'Ruta registred';
}
mysqli_close($conexion);
?>