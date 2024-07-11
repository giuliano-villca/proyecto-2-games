// Evento Step en obj_control para manejar el retorno de paneles robados y el retroceso
if (global.panel_timer > 0) {
    global.panel_timer -= 1;
} else {
    // Devolver todos los paneles robados al estado original
    for (var i = array_length(global.temporary_panels) - 1; i >= 0; i--) {
        var panel_info = global.temporary_panels[i];
        
        // Restaurar el propietario original del panel
        global.panels[panel_info.row][panel_info.col].propietario = panel_info.original_propietario;

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
            // Mover la entidad hacia atrás hasta que esté en un panel propio
            while (true) {
                entity_col = floor((entity.x - global.grid_offset_x) / global.panel_width);
                entity_row = floor((entity.y - global.grid_offset_y) / global.panel_height);

                // Si la entidad es el jugador, se mueve a la izquierda
                if (panel_info.entity_type == "obj_player" && entity_col > 0 && global.panels[entity_row][entity_col - 1].propietario == 1) {
                    entity.x -= global.panel_width;
                } 
                // Si la entidad es el enemigo, se mueve a la derecha
                else if (panel_info.entity_type == "obj_enemy" && entity_col < array_length(global.panels[0]) - 1 && global.panels[entity_row][entity_col + 1].propietario == 2) {
                    entity.x += global.panel_width;
                } 
                else {
                    break;
                }
            }
        }

        array_delete(global.temporary_panels, i, 1); // Eliminar de la lista de paneles temporales
    }

    // Reiniciar el temporizador global
    global.panel_timer = global.panel_return_time;
}