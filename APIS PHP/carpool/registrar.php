<?php
include 'test.php';
$codigo = $_GET["Codigo"];
$cel = $_GET["Celular"];
$nombre = $_GET["Nombre"];
$apellido =$_GET["Apellido"];
$carrera = $_GET["Cargo"];
$contrase = $_GET["Password"];
$discapacidad = $_GET["Discapacidad"];

$insertar = "INSERT INTO usuario(Codigo,Celular,Nombre,Apellido,Cargo,Password,Discapacidad)
            VALUES ('$codigo','$cel','".$nombre."','".$apellido."','".$carrera."','".$contrase."','".$discapacidad."')";
$resultado = mysqli_query($conexion, $insertar);
echo json_encode ($resultado);
//5. Cerrar la conexión a la Base de Datos
mysqli_close($conexion);
?>
