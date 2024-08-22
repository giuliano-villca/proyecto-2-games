// En el evento Step de obj_sword
// Determinar la posición del objetivo según la orientación del atacante
var target_x, target_y;
if (attack_type == "obj_player") {
    target_x = x + (global.panel_width * sword_range);
    target_y = y;
} else if (attack_type == "obj_enemy") {
    target_x = x - (global.panel_width * sword_range);
    target_y = y;
}

// Verificar colisión con el objetivo correcto
var colision;
if (attack_type == "obj_player") {
    colision = instance_place(target_x, target_y, obj_enemy);
} else if (attack_type == "obj_enemy") {
    colision = instance_place(target_x, target_y, obj_player);
}

if (colision != noone) {
	// Verificar si el objetivo está en estado de inmunidad
    if (!colision.inmunidad) {
    // Llamar al script para verificar la fila y aplicar daño
    fila_dano_melee(self, colision, sword_damage, 1 * room_speed);
} 
}
else {
    // Destruir la espada si no hay colisión (solo ataca una vez)
    instance_destroy();
}