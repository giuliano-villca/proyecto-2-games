//event steal
// Disminuir el temporizador
// Código de destrucción de la torreta
if (damage_received > 0) {
    current_health -= damage_received;
    damage_received = 0; // Reiniciar el daño recibido

    // Verificar si la ballesta ha sido destruida
    if (current_health <= 0) {
        // Marcar el panel como libre de estructuras antes de destruir la torreta
        if (instance_exists(self)) {
            var col = start_col; // Usar las coordenadas guardadas
            var row = start_row;

            if (row >= 0 && row < array_length(global.panels) &&
                col >= 0 && col < array_length(global.panels[0])) {
                global.panels[row][col].estructura = false;
                show_debug_message("Panel at (" + string(col) + ", " + string(row) + ") updated to free.");
            }
        }

        instance_destroy(); // Destruir la ballesta si su vida llega a 0
    }
}
// Disminuir el temporizador
shoot_timer--;

// Verificar si es tiempo de disparar
if (shoot_timer <= 0) {
    // Disparar una flecha
    var flecha = instance_create_layer(x + (global.panel_width / 2), y + 30, "AbovePanels", obj_flecha);
    
    // Configurar la dirección y el tipo de la flecha
    if (entity_type == "obj_player") {
        flecha.direction = 0; // Dirección hacia la derecha para el jugador
    } else if (entity_type == "obj_enemy") {
        flecha.direction = 180; // Dirección hacia la izquierda para el enemigo
    }
    
    flecha.entity_type = entity_type; // Hereda el tipo de entidad de la torreta
    flecha.launch_type = "obj_torreta_ballesta"; // Especifica que fue lanzada por la torreta
            // Ajustar la orientación de la torreta según la entidad
        if (entity_type == "obj_player") {
            flecha.image_xscale = 2.3; // Orientar hacia la derecha
		 
        } else if (entity_type == "obj_enemy") {
            flecha.image_xscale = -2.3; // Orientar hacia la izquierda

        }
    // Reiniciar el temporizador
    shoot_timer = 2 * room_speed;
}
