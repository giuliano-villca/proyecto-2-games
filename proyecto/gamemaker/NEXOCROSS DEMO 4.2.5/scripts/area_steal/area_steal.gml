function area_steal(entity_type) {
    var panel_robado = false; // Variable para verificar si algún panel fue robado
    var previous_col = floor((x - global.grid_offset_x) / global.panel_width);
    var previous_row = floor((y - global.grid_offset_y) / global.panel_height);

    // Definir los límites y parámetros según el tipo de entidad
    var start_col, end_col, step, target_propietario, own_propietario, original_propietario, entity_to_check;

    if (entity_type == "obj_player") {
        start_col = global.player_area_extension - 3;
        end_col = array_length(global.panels[0]);
        step = 1; // Avanzar de izquierda a derecha
        target_propietario = 2; // Panel del enemigo
        own_propietario = 1; // Panel del jugador
        original_propietario = 2; // Panel original que debe ser restaurado
        entity_to_check = obj_enemy; // Entidad a verificar (enemigo)
    } else if (entity_type == "obj_enemy") {
        start_col = global.player_area_extension + 2;
        end_col = -1; // Avanzar de derecha a izquierda
        step = -1;
        target_propietario = 1; // Panel del jugador
        own_propietario = 2; // Panel del enemigo
        original_propietario = 1; // Panel original que debe ser restaurado
        entity_to_check = obj_player; // Entidad a verificar (jugador)
    } else {
        return panel_robado; // Si el tipo de entidad no es válido, no hacer nada
    }

    // Buscar la primera columna que contenga paneles objetivos
    var found_col = -1;
    for (var j = start_col; (step == 1 ? j < end_col : j > end_col); j += step) {
        for (var i = 0; i < array_length(global.panels); i++) {
            if (global.panels[i][j].propietario == target_propietario) {
                found_col = j;
                break;
            }
        }
        if (found_col != -1) {
            break; // Salir del bucle una vez que se haya encontrado una columna con paneles objetivos
        }
    }

    // Si se encontró una columna con paneles objetivos, se la roba
    if (found_col != -1) {
        for (var i = 0; i < array_length(global.panels); i++) {
            // Verificar si hay una entidad en el panel actual
            var entity_x = global.grid_offset_x + found_col * global.panel_width + global.panel_width / 2;
            var entity_y = global.grid_offset_y + i * global.panel_height + global.panel_height / 2;
            var entity_instance = instance_position(entity_x, entity_y, entity_to_check);

            // Verificar si la instancia de entidad está presente en el panel actual
            var entity_grid_x = entity_instance != noone ? floor((entity_instance.x - global.grid_offset_x) / global.panel_width) : -1;
            var entity_grid_y = entity_instance != noone ? floor((entity_instance.y - global.grid_offset_y) / global.panel_height) : -1;

            // Si no hay una entidad en el panel, robar el panel
            if (global.panels[i][found_col].propietario == target_propietario && (entity_instance == noone || (entity_grid_x != found_col || entity_grid_y != i))) {
                global.panels[i][found_col].propietario = own_propietario;
                panel_robado = true; // Indica que se robó un panel
                var panel_info = {
                    row: i,
                    col: found_col,
                    prev_col: previous_col,
                    prev_row: previous_row,
                    original_propietario: original_propietario,
                    entity_type: entity_type
                };
                array_push(global.temporary_panels, panel_info); // Añadir a la lista de paneles temporales
            }
        }
        if (panel_robado) {
           // Reiniciar solo el temporizador de área robada si se robó un panel
        global.robo_panel_timer = global.robo_panel_duracion;
        }
    }

    return panel_robado; // Retorna verdadero si se robó al menos una columna completa
}
