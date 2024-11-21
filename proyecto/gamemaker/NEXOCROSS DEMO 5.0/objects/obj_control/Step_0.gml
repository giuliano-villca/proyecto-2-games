// Evento Step en obj_control para manejar el retorno de paneles robados y el retroceso
if (global.panel_regeneracion_timer > 0) {
    global.panel_regeneracion_timer -= 1;
} else {
// Restaurar los paneles rotos
for (var i = 0; i < array_length(global.panels); i++) {
    for (var j = 0; j < array_length(global.panels[i]); j++) {
        if (global.panels[i][j].tipo == 6 && global.panels[i][j].timer > 0) {
            global.panels[i][j].timer -= 1;
            if (global.panels[i][j].timer <= 0) {
                global.panels[i][j].tipo = 1;  // Restaurar el panel a normal
                global.panels[i][j].timer = -1; // Resetear el temporizador
            }
        }
    }
}
}
// Temporizador para robar paneles 
if (global.robo_panel_timer > 0) {
    global.robo_panel_timer -= 1;
} else {
    // Restaurar los paneles robados al propietario original
    for (var i = array_length(global.temporary_panels) - 1; i >= 0; i--) {
        var panel_info = global.temporary_panels[i];
        global.panels[panel_info.row][panel_info.col].propietario = panel_info.original_propietario;
        array_delete(global.temporary_panels, i, 1); // Eliminar de la lista de paneles temporales
	        // Verificar si el jugador o enemigo está encima del panel que está siendo devuelto
        var entity;
        if (panel_info.entity_type == "obj_player") {
            entity = obj_player;
        } else if (panel_info.entity_type == "obj_enemy") {
            entity = obj_enemy;
        } else {
            array_delete(global.temporary_panels, i, 1); // Eliminar de la lista de paneles temporales si el tipo de entidad no es válido
            continue;
        }

        var entity_col = floor((entity.x - global.grid_offset_x) / global.panel_width);
        var entity_row = floor((entity.y - global.grid_offset_y) / global.panel_height);

        if (entity_col == panel_info.col && entity_row == panel_info.row) {
            // mover la entidad hacia atrás hasta que esté en un panel propio
            while (true) {
                entity_col = floor((entity.x - global.grid_offset_x) / global.panel_width);
                entity_row = floor((entity.y - global.grid_offset_y) / global.panel_height);

                // si la entidad es el jugador, se mueve a la izquierda
                if (panel_info.entity_type == "obj_player" && entity_col > 0 && global.panels[entity_row][entity_col - 1].propietario == 1) {
                    entity.x -= global.panel_width;
                } 
                // si la entidad es el enemigo, se mueve a la derecha
                else if (panel_info.entity_type == "obj_enemy" && entity_col < array_length(global.panels[0]) - 1 && global.panels[entity_row][entity_col + 1].propietario == 2) {
                    entity.x += global.panel_width;
                } 
                else {
                    break;
                }
            }
        }
    }
    // Reiniciar el temporizador
    global.robo_panel_timer = global.robo_panel_duracion;
}

// Detectar si la tecla se presiona después de la victoria
if (global.tecla_activadora != -1 && keyboard_check_pressed(global.tecla_activadora)) {
    room_goto(room_inventory); // Cambiar al room correspondiente
}