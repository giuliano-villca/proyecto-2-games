// Evento Step en obj_enemy
var new_x = x;
var new_y = y;

// Detectar entradas del teclado y ajustar la posición del enemigo en consecuencia
if (keyboard_check_pressed(ord("A"))) {
    new_x -= global.panel_width;
} else if (keyboard_check_pressed(ord("D"))) {
    new_x += global.panel_width;
} else if (keyboard_check_pressed(ord("W"))) {
    new_y -= global.panel_height;
} else if (keyboard_check_pressed(ord("S"))) {
    new_y += global.panel_height;
}

// Verificar si la nueva posición está dentro de los límites del grid
var new_col = floor((new_x - global.grid_offset_x) / global.panel_width);
var new_row = floor((new_y - global.grid_offset_y) / global.panel_height);

if (new_col >= 0 && new_col < array_length(global.panels[0]) &&
    new_row >= 0 && new_row < array_length(global.panels) &&
    global.panels[new_row][new_col].propietario == 2) {
    // Permitir el movimiento a los paneles del enemigo (propietario 2)
    x = new_x;
    y = new_y;

    // Actualizar la fila y columna del enemigo
    enemy_col = new_col;
    enemy_row = new_row;
}
// Habilidad PanelGrab (presionando la tecla 'f')
if (keyboard_check_pressed(ord("F"))) {
    panel_grab("obj_enemy"); // Llama a la función panel_grab para robar la columna entera de paneles enemigos
}
if (keyboard_check_pressed(ord("G"))) {
    realpanel_grab("obj_enemy") ; // Llama a la función panel_grab para robar la columna entera de paneles enemigos
}
if (keyboard_check_pressed(ord("H"))) {
    heladera();
}