<?php
include 'test.php';

mysqli_set_charset($conexion,"utf8");

$variable1 = $_GET['Codigo'];
$var2 = $_GET['Password'];
//2. Tomar los campos provenientes de la tabla
$consulta="SELECT * FROM usuario where Codigo='".$variable1."' and Password='".$var2."' ";
$resultado = mysqli_query($conexion, $consulta);
while($fila = mysqli_fetch_row($resultado))
 {
echo json_encode($fila);
}
mysqli_close($conexion);


?>
