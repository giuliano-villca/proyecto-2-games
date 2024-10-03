function handle_ice_panel(entity, direction) {
    var entity_col = floor((entity.x - global.grid_offset_x) / global.panel_width);
    var entity_row = floor((entity.y - global.grid_offset_y) / global.panel_height);

    // Deslizar en la dirección especificada mientras el panel sea de tipo hielo (tipo 2)
    while (global.panels[entity_row][entity_col].tipo == 2) {
        var next_col = entity_col;
        var next_row = entity_row;

        // Determinar la siguiente posición basada en la dirección
        switch (direction) {
            case "up":
                next_row -= 1;
                break;
            case "down":
                next_row += 1;
                break;
            case "left":
                next_col -= 1;
                break;
            case "right":
                next_col += 1;
                break;
        }

        // Verificar si la nueva posición está dentro de los límites del tablero
        if (next_col >= 0 && next_col < array_length(global.panels[0]) &&
            next_row >= 0 && next_row < array_length(global.panels)) {

            // Verificar si el siguiente panel pertenece al mismo propietario
            if (global.panels[next_row][next_col].propietario == global.panels[entity_row][entity_col].propietario) {
                entity.x = global.grid_offset_x + next_col * global.panel_width;
                entity.y = global.grid_offset_y + next_row * global.panel_height;

                // Actualizar la posición de la entidad
                entity_col = next_col;
                entity_row = next_row;
            } else {
                // Detener el deslizamiento si el siguiente panel no pertenece al mismo propietario
                break;
            }
        } else {
            // Detener el deslizamiento si está fuera de los límites del tablero
            break;
        }
    }
}