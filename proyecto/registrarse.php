<!-- <!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="img/logo.jpeg" type="image/x-icon">
    <link rel="stylesheet" href="class/registrarse.css">
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

    <form>
        <h2>STAR GAMES</h2>
        <h3>Registro </h3>



        <div name="form" class="form-group">
            <label for="email">Correo electronico:</label>
            <input type="text" id="email" name="email" placeholder="Ingresa tu correo electronico" required>
        </div>

        <div name="form" class="form-group">
            <label for="password">Contraseña:</label>
            <input type="text" id="password" name="password" placeholder="Ingresa una contraseña" required>
            <a href="iniciar_s.php"> Si ya tienes cuenta, haz click aquí </a>
        </div>

        <form action="php/conex_regis.php" method="post">
            <div class="form-group button-class">
                <button type="submit"><a href="">REGISTRARSE</a></button>
            </div>
        </form>
    </form>
</body>

</html> -->

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="img/logo.jpeg" type="image/x-icon">
    <link rel="stylesheet" href="class/registrarse.css">
    <title>Registrarse</title>
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

    <form action="php/conex_regis.php" method="post">
        <h2>STAR GAMES</h2>
        <h3>Registro</h3>

        <div name="form" class="form-group">
            <label for="name">Nombre de usuario:</label>
            <input type="text" id="name" name="name" placeholder="Ingresa un nombre de usuario" required>
        </div>
        
        <div name="form" class="form-group">
            <label for="email">Correo electronico:</label>
            <input type="text" id="email" name="email" placeholder="Ingresa tu correo electronico" required>
        </div>

        <div name="form" class="form-group">
            <label for="password">Contraseña:</label>
            <input type="text" id="password" name="password" placeholder="Ingresa una contraseña" required>
            <a href="iniciar_s.php"> Si ya tienes cuenta, haz click aquí </a>
        </div>
        
        <div class="form-group button-class">
            <button type="submit" name="registrarse">REGISTRARSE</button>
        </div>
    </form>

    <a href="iniciar_s.php">Si ya tienes cuenta, haz click aquí</a>
</body>

</html>