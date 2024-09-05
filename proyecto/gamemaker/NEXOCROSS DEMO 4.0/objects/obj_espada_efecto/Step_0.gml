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

// Detectar colisión con cualquier objeto que tenga la variable 'estructura'
var colision_invocacion = instance_place(target_x, target_y, all); 

if (!damage_applied && colision_invocacion != noone && variable_instance_exists(colision_invocacion, "estructura")) {
    if (colision_invocacion.entity_type != attack_type) {
        // Aplicar daño a la invocación
        colision_invocacion.damage_received = sword_damage;
        damage_applied = true; // Marcar que el daño fue aplicado
    }
}

if (colision != noone) {
    // Verificar si el objetivo está en estado de inmunidad
    if (!colision.inmunidad) {
        // Llamar al script para verificar la fila y aplicar daño con rango dinámico
        fila_dano_melee(self, colision, sword_damage, 1 * room_speed, 1, sword_range);
        damage_applied = true; // Marcar que el daño fue aplicado
    } 
}

// Destruir la espada después de que la animación ha terminado
if (image_index >= image_number - 1) {
    instance_destroy();
}