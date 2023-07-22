<?php
include 'test.php';

$Origen = $_GET["Origen"];
$Destino = $_GET["Destino"];
$Cupos =$_GET["Cupo"];
$celular = $_GET["Celular"];

$insertar = "UPDATE rutas SET Origen='$Origen',Destino='$Destino',Cupo='$Cupos' WHERE Celular='$celular'";

$resultado = mysqli_query($conexion, $insertar);

if (!$resultado){
  echo 'WRONG';
}else{
  echo 'Ruta registred';
}
mysqli_close($conexion);
?>