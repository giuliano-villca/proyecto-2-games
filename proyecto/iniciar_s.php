<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="img/logo.jpeg" type="image/x-icon">
    <link rel="stylesheet" href="class/iniciar_s.css">
    <title> Iniciar Sesion</title>
</head>

<body>
    <header>
        <div class="logo">
            <img src="../proyecto/img/logo.jpeg" class="logo-img">

        </div>
        <nav class="menu">
            <a href=""></a>
            <a href=""></a>
            <a href=""></a>
        </nav>
    </header>

    <div class="div1">
        <div class="div2" type="container">

            <h3 id="correo"> Correo Electrónico </h3>
            <input type="text" class="correo" id="gmail" placeholder="Ingresa tu correo electrónico">

            <br>

            <h3 id="correo"> Contraseña </h3>
            <input type="password" class="contrasenia" id="contrasenia" placeholder="Ingresa tu contraseña">

            <br>

            <div class="div3">
                <a href="registrarse.html"> Si no tienes cuenta, haz click aquí </a>
                <br>
                <a href="#"> Si olvidaste la contrasña, haz click aquí </a>
            </div>
        </div>
    </div>

    <br>
    <form action="pag_inicio" method="post">
        <input type="submit" class="Iniciar_S" value="INICIAR SESION">
    </form>
</body>

</html>