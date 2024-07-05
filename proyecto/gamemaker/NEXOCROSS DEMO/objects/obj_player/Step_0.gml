// Lógica de movimiento del jugador en el evento Step de obj_player
var new_x = x;
var new_y = y;

if (keyboard_check_pressed(vk_left)) {
    new_x -= global.panel_width;
} else if (keyboard_check_pressed(vk_right)) {
    new_x += global.panel_width;
} else if (keyboard_check_pressed(vk_up)) {
    new_y -= global.panel_height;
} else if (keyboard_check_pressed(vk_down)) {
    new_y += global.panel_height;
}

// Verificar si la nueva posición está dentro de los límites del grid
var new_col = floor((new_x - global.grid_offset_x) / global.panel_width);
var new_row = floor((new_y - global.grid_offset_y) / global.panel_height);



// Verificar si la nueva posición está dentro de los límites del tablero y es un panel válido para moverse
if (new_col >= 0 && new_col < array_length(global.panels[0]) &&
    new_row >= 0 && new_row < array_length(global.panels) &&
    global.panels[new_row][new_col].propietario == 1) {
    // Permitir el movimiento a los paneles del jugador (propietario 1)
    x = new_x;
    y = new_y;
}
// Evento Step en obj_player para el manejo automático de retroceso
var current_col = floor((x - global.grid_offset_x) / global.panel_width);
var current_row = floor((y - global.grid_offset_y) / global.panel_height);

// Verificar si el jugador está sobre un panel robado y su tiempo se ha agotado
if (global.panel_timer <= 0 && global.panels[current_row][current_col].tipo == 4) {
    // Retroceder automáticamente en la misma fila del panel robado
    if (global.panels[current_row][current_col].propietario == 1) {
        // Si el panel robado es del jugador, retrocede hacia la izquierda si es posible
        if (current_col > 0 && (global.panels[current_row][current_col - 1].propietario == 1 || global.panels[current_row][current_col - 1].tipo == 4)) {
            x -= global.panel_width;
        }
    } else if (global.panels[current_row][current_col].propietario == 2) {
        // Si el panel robado es del enemigo, retrocede hacia la derecha si es posible
        if (current_col < array_length(global.panels[0]) - 1 && (global.panels[current_row][current_col + 1].propietario == 2 || global.panels[current_row][current_col + 1].tipo == 4)) {
            x += global.panel_width;
        }
    }
}

// Evento Step de obj_player (en el room de combate)
if (keyboard_check_pressed(ord("Z")) && global.habilidades_seleccionadas[0] != -1) {
    ejecutar_habilidad(global.habilidades_seleccionadas[0], "obj_player");
}
if (keyboard_check_pressed(ord("X")) && global.habilidades_seleccionadas[1] != -1) {
    ejecutar_habilidad(global.habilidades_seleccionadas[1], "obj_player");
}
if (keyboard_check_pressed(ord("C")) && global.habilidades_seleccionadas[2] != -1) {
    ejecutar_habilidad(global.habilidades_seleccionadas[2], "obj_player");
}
if (keyboard_check_pressed(ord("V")) && global.habilidades_seleccionadas[3] != -1) {
    ejecutar_habilidad(global.habilidades_seleccionadas[3], "obj_player");
}
// Decrease the shoot timer if it's greater than 0
if (shoot_timer > 0) {
    shoot_timer -= 1;
}
if (inmune) {
    inmunidad_tiempo -= 1;
    if (inmunidad_tiempo <= 0) {
        inmune = false;
    }
}
