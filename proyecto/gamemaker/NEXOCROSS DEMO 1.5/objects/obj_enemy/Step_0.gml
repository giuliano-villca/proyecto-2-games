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

grid_x = floor(x / panel_width); // Actualiza según la lógica de movimiento del enemigo
grid_y = floor(y / panel_height); // Actualiza según la lógica de movimiento del enemigo

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
// Actualizar el estado de inmunidad
if (inmune) {
    inmunidad_tiempo -= 2;
    if (inmunidad_tiempo <= 0) {
        inmune = false;
    }
}

if (shoot_timer > 0) {
    shoot_timer -= 1;
}

if (keyboard_check_pressed(ord("G"))){
area_steal(entity_type);
}
if (keyboard_check_pressed(ord("H"))){
jardin();
}
if (keyboard_check_pressed(ord("F"))){
bola_de_fuego(entity_type);
}
