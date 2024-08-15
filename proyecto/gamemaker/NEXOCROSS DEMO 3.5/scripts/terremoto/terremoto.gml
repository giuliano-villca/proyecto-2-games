//este se llamaba antes chile
function terremoto() {
    var player_col = floor((obj_player.x - global.grid_offset_x) / global.panel_width);
    var player_row = floor((obj_player.y - global.grid_offset_y) / global.panel_height);
    var enemy_col = floor((obj_enemy.x - global.grid_offset_x) / global.panel_width);
    var enemy_row = floor((obj_enemy.y - global.grid_offset_y) / global.panel_height);

    for (var i = 0; i < array_length(global.panels); i++) {
        for (var j = 0; j < array_length(global.panels[i]); j++) {
            if (i == player_row && j == player_col) {
                global.panels[i][j].tipo = 5; // agrietado
            } else if (i == enemy_row && j == enemy_col) {
                global.panels[i][j].tipo = 5; // agrietado
            } else {
                global.panels[i][j].tipo = 6; // roto
                global.panels[i][j].timer = global.panel_return_time; // Inicializar el temporizador
            }
        }
    }
}