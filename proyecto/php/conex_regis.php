<!-- <!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>

<body>

</body>

</html> -->

<?php

// include("conex_db.php");

// $conex = mysqli_connect("localhost", "root", "", "games_star");

// if (isset($_POST['registrarse'])) {
//     $email = mysqli_real_escape_string($conex, $_POST['email']);
//     $password = mysqli_real_escape_string($conex, $_POST['password']);
//     $name = mysqli_real_escape_string($conex, $_POST['name']);
//     //    $fechanac = date($_POST['fecha_nac']);

//     $salt = random_bytes(22); // Genera un salt aleatorio
//     $hashed_password = md5($password);



//         // Consulta para insertar el usuario
//         $consulta = "INSERT INTO usuarios (correo, contrasenia, name_user) VALUES ('$email', '$hashed_password', 
//         '$name')";
// /*, '$fechanac'*/
//         $resultado = mysqli_query($conex, $consulta);

//         if ($resultado) {
//             // El registro se realizó con éxito, puedes redirigir al usuario
//             header('Location: ../pagina_network.html');
//         }
//     }

include("conex_db.php");

$conex = mysqli_connect(HOST, USER, PASSWORD, DB);

if (isset($_POST['registrarse'])) {
    $email = mysqli_real_escape_string($conex, $_POST['email']);
    $password = mysqli_real_escape_string($conex, $_POST['password']);
    $name = mysqli_real_escape_string($conex, $_POST['name']);
    //    $fechanac = date($_POST['fecha_nac']);

    $hashed_password = password_hash($password, PASSWORD_BCRYPT);

    // Consulta para insertar el usuario
    $consulta = "INSERT INTO usuarios (correo, contrasenia, name_user) VALUES ('$email', '$hashed_password', '$name')";
    /*, '$fechanac'*/
    $resultado = mysqli_query($conex, $consulta);

    if ($resultado) {
        // El registro se realizó con éxito, puedes redirigir al usuario
        header('Location: ../pagina_network.html');
        exit();
    } else {
        // Manejo de error en la consulta
        echo "Error en el registro: " . mysqli_error($conex);
    }
}
?>