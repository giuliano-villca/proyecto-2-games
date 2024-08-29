//en la siguiente version te pondre en el techo, ya no sirve, asi que digale bye bye
function recibir_dano(){
// Script: recibir_dano
// Argumento 0: cantidad de daño recibido
var dano = argument0;

// Solo recibe daño si no está inmune
if (!inmune) {
    vida -= dano;

    // Asegurarse de que la vida no sea menor que 0
    if (vida < 0) {
        vida = 0;
    }

    // Verificar si el personaje ha muerto
    if (vida == 0) {
        // Aquí puedes poner el código para manejar la muerte del personaje
        show_message("¡Has muerto LOL!");
        // Ejemplo: puedes destruir el objeto del personaje
        instance_destroy();
    } else {
        // Activar inmunidad
        inmune = true;
        inmunidad_tiempo = inmunidad_duracion;
    }
}
}