function terremoto() {
    // Obtener la posición del jugador
    var player_col = floor((obj_player.x - global.grid_offset_x) / global.panel_width);
    var player_row = floor((obj_player.y - global.grid_offset_y) / global.panel_height);

    // Obtener la posición del enemigo
    var enemy_col = floor((obj_enemy.x - global.grid_offset_x) / global.panel_width);
    var enemy_row = floor((obj_enemy.y - global.grid_offset_y) / global.panel_height);

    // Recorrer todos los paneles
    for (var i = 0; i < array_length(global.panels); i++) {
        for (var j = 0; j < array_length(global.panels[i]); j++) {
            // Si el panel es la posición del jugador, cambiar el tipo a agrietado
            if (i == player_row && j == player_col) {
                global.panels[i][j].tipo = 5; // Cambiar tipo a agrietado
            }
            // Si el panel es la posición del enemigo, cambiar el tipo a agrietado
            else if (i == enemy_row && j == enemy_col) {
                global.panels[i][j].tipo = 5; // Cambiar tipo a agrietado
            }
            // De lo contrario, cambiar el tipo a roto
            else {
                global.panels[i][j].tipo = 6; // Cambiar tipo a roto
            }
        }
    }
}