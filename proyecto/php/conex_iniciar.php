<?php
include 'env.php';
$conn = mysqli_connect(HOST, USER, PASSWORD, DB);

if (!$conn) {
    die("No hay conexión: " . mysqli_connect_error());
}
$email = $_POST["email"];
$pass = md5($_POST["password"]);
$query = mysqli_query($conn, "SELECT*FROM usuarios WHERE correo = '" . $email . "' and contrasenia = '" . $password . "'");

$nr = mysqli_num_rows($query);

if ($nr == 1) {
    header("Location: ../pagina_network.html");
} else if ($nr == 0) {

    echo '<script type="text/javascript">
    window.location.href="../login.php";
    alert("La contraseña o el email son incorrectos, volver a revisarlos");
    </script>';
}

?>