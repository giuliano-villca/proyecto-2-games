// En el evento Step de fireball
if (direction == 0) {
    x += speed;
} else if (direction == 180) {
    x -= speed;
}

// Verificar colisión con el objetivo correcto
var colision;
if (entity_type == "obj_player") {
    colision = instance_place(x, y, obj_enemy);
} else if (entity_type == "obj_enemy") {
    colision = instance_place(x, y, obj_player);
}

if (colision != noone) {
    // Llamar al script para verificar la fila y aplicar daño
    fila_dano_proyectil(self, colision, fireball_damage);
}

// Destruir la bola de fuego si sale de la pantalla
if (x > room_width || x < 0) {
    instance_destroy();
}