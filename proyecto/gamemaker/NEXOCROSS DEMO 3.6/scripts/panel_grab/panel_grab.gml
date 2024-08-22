function panel_grab(entity_type) {
    var panel_robado = false; // Variable para verificar si algún panel fue robado
    var current_col = floor((x - global.grid_offset_x) / global.panel_width);
    var current_row = floor((y - global.grid_offset_y) / global.panel_height);

    // Definir los parámetros según el tipo de entidad
    var target_propietario, own_propietario, original_propietario, entity_to_check;

    if (entity_type == "obj_player") {
        target_propietario = 2; // Panel del enemigo
        own_propietario = 1; // Panel del jugador
        original_propietario = 2; // Panel original que debe ser restaurado
        entity_to_check = obj_enemy; // Entidad a verificar (enemigo)
    } else if (entity_type == "obj_enemy") {
        target_propietario = 1; // Panel del jugador
        own_propietario = 2; // Panel del enemigo
        original_propietario = 1; // Panel original que debe ser restaurado
        entity_to_check = obj_player; // Entidad a verificar (jugador)
    } else {
        return panel_robado; // Si el tipo de entidad no es válido, no hacer nada
    }

    // Verificar los paneles adyacentes (izquierda y derecha)
    var adjacents = [
        {row: current_row, col: current_col - 1}, // Izquierda
        {row: current_row, col: current_col + 1}, // Derecha
    ];

    for (var i = 0; i < array_length(adjacents); i++) {
        var adj = adjacents[i];

        // Verificar que la posición adyacente esté dentro de los límites del grid
        if (adj.row >= 0 && adj.row < array_length(global.panels) && adj.col >= 0 && adj.col < array_length(global.panels[0])) {
            var entity_x = global.grid_offset_x + adj.col * global.panel_width + global.panel_width / 2;
            var entity_y = global.grid_offset_y + adj.row * global.panel_height + global.panel_height / 2;
            var entity_instance = instance_position(entity_x, entity_y, entity_to_check);

            var entity_grid_x = entity_instance != noone ? floor((entity_instance.x - global.grid_offset_x) / global.panel_width) : -1;
            var entity_grid_y = entity_instance != noone ? floor((entity_instance.y - global.grid_offset_y) / global.panel_height) : -1;

            // Verificar si el panel adyacente tiene el propietario objetivo y no hay entidad en esa posición
            if (global.panels[adj.row][adj.col].propietario == target_propietario && 
                (entity_instance == noone || (entity_grid_x != adj.col || entity_grid_y != adj.row))) {
                // Robar el panel adyacente
                global.panels[adj.row][adj.col].propietario = own_propietario;
                panel_robado = true; // Indica que se robó un panel

                // Guardar información del panel robado en la lista de paneles temporales
                var panel_info = {
                    row: adj.row,
                    col: adj.col,
                    original_propietario: original_propietario,
                    entity_type: entity_type
                };
                array_push(global.temporary_panels, panel_info);
                break; // Salir del bucle una vez que se haya robado un panel
            }
        }
    }

    if (panel_robado) {
        // Reiniciar el temporizador global si se robó algún panel
        global.robo_panel_timer = global.robo_panel_duracion;
    }

    return panel_robado; // Retorna verdadero si se robó al menos un panel adyacente
}
