var colision_objetivo;
var colision_invocacion;

// Verificar colisión con el enemigo o jugador según el tipo de entidad que causa la explosión
if (attack_type == "obj_player") {
    colision_objetivo = collision_circle(x, y, explosion_radius, obj_enemy, false, true);
} else if (attack_type == "obj_enemy") {
    colision_objetivo = collision_circle(x, y, explosion_radius, obj_player, false, true);
}


// Determinar la columna y fila del panel donde ocurre la explosión
var explosion_col = floor((x - global.grid_offset_x) / global.panel_width);
var explosion_row = floor((y - global.grid_offset_y) / global.panel_height);

// Verificar si ya se ha aplicado daño
if (!damage_applied) {
    // Verificar si hay una estructura en el panel de la explosión
    if (explosion_col >= 0 && explosion_col < array_length(global.panels[0]) &&
        explosion_row >= 0 && explosion_row < array_length(global.panels)) {
        
        var check_panel = global.panels[explosion_row][explosion_col];
        if (check_panel.estructura) {
            // Buscar la instancia de la estructura en el panel
            var estructura_inst = instance_place(global.grid_offset_x + explosion_col * global.panel_width,
                                                 global.grid_offset_y + explosion_row * global.panel_height,
                                                 all);
            
            if (estructura_inst != noone && variable_instance_exists(estructura_inst, "estructura")) {
                if (estructura_inst.entity_type != attack_type) {
                    // Aplicar daño a la estructura
                    estructura_inst.damage_received = explosion_damage;
                    damage_applied = true; // Marcar que el daño fue aplicado
                }
            }
        }
    }
}
if (colision_objetivo != noone) {
    // Verificar si el objetivo está en estado de inmunidad
    if (!colision_objetivo.inmunidad) {
        // Llamar al script para verificar la fila y aplicar daño con rango dinámico
        fila_dano_melee(self, colision_objetivo, explosion_damage, 1 * room_speed, 1, 0);
        damage_applied = true; // Marcar que el daño fue aplicado
    } 
}


// Destruir la explosión después de que la animación finalice
if (image_index >= image_number - 1) {
    instance_destroy();
}
