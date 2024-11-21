// En el evento Step de fireball
if (direction == 0) {
    x += speed;
} else if (direction == 180) {
    x -= speed;
}

// Step Event en obj_fireball

var colision_bloqueo;
var colision_objetivo;

// Verificar colisión con el escudo primero
if (entity_type == "obj_player") {
    colision_bloqueo = instance_place(x, y, obj_escudo);
    colision_objetivo = instance_place(x, y, obj_enemy);
} else if (entity_type == "obj_enemy") {
    colision_bloqueo = instance_place(x, y, obj_escudo);
    colision_objetivo = instance_place(x, y, obj_player);
}

// Si colisiona con el escudo
if (colision_bloqueo != noone && colision_bloqueo.entity_type != entity_type) {
    // Destruir la bola de fuego al impactar con el escudo
    instance_destroy();
} 

var colision_invocacion = instance_place(x, y, all); 

if (colision_invocacion != noone && variable_instance_exists(colision_invocacion, "estructura")) {
    if (colision_invocacion.entity_type != entity_type) {
        // Aplicar daño a la invocación
        colision_invocacion.damage_received = flecha_damage;
        instance_destroy(); // Destruir la bola de fuego
    }
}

// Si no colisiona con un escudo, verificar colisión con el objetivo
else if (colision_objetivo != noone) {
    // Verificar si el objetivo tiene inmunidad
    if (!colision_objetivo.inmunidad) {
        // Aplicar daño si no tiene inmunidad
        fila_dano_proyectil(self, colision_objetivo, flecha_damage, 0.75 * room_speed);
    }
}

// Destruir la bola de fuego si sale de la pantalla
if (x > room_width || x < 0) {
    instance_destroy();
}