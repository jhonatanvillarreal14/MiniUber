<?php
include 'test.php';

$Origen = $_GET["Origen"];
$Destino = $_GET["Destino"];
$Cupos =$_GET["Cupo"];
$celular = $_GET["phone"];

$insertar = "INSERT INTO rutas(Id, Celular, Origen, Destino, Cupo) VALUES ('null','$celular','".$Origen."','".$Destino."','$Cupos')";

$resultado = mysqli_query($conexion, $insertar);

if (!$resultado){
  echo 'WRONG';
}else{
  echo 'Ruta registred';
}
mysqli_close($conexion);
?>
