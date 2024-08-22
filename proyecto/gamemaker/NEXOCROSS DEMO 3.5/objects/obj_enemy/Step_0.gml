// Evento Step en obj_enemy
var new_x = x;
var new_y = y;

var previous_x = x;
var previous_y = y;

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

// Verificar si la nueva posición está dentro de los límites del tablero
if (new_col >= 0 && new_col < array_length(global.panels[0]) &&
    new_row >= 0 && new_row < array_length(global.panels)) {

    // Verificar si el panel de destino está roto (tipo 6)
    if (global.panels[new_row][new_col].tipo == 6) {
        // Impedir movimiento al panel roto
        x = previous_x;  // Mantener la posición anterior
        y = previous_y;
    } else {
        // Permitir el movimiento a los paneles del jugador (propietario 1)
        if (global.panels[new_row][new_col].propietario == 2) {
            x = new_x;
            y = new_y;
			
			enemy_col = new_col;
			enemy_row = new_row;

            // Solo cambiar el tipo del panel anterior si la posición cambió
            if ((new_col != previous_col || new_row != previous_row) && 
                previous_col >= 0 && previous_row >= 0 &&
                global.panels[previous_row][previous_col].tipo == 5) {
                global.panels[previous_row][previous_col].tipo = 6;
				global.panels[previous_row][previous_col].timer = global.panel_return_time; // Reiniciar el temporizador
            }

            // Actualizar las posiciones anteriores
            previous_col = new_col;
            previous_row = new_row;
        } else {
            // Mantener la posición anterior si no es un panel del jugador
            x = previous_x;
            y = previous_y;
        }
    }
} else {
    // Mantener la posición anterior si está fuera de los límites
    x = previous_x;
    y = previous_y;
}

// Lógica de deslizamiento en paneles de hielo
current_col = floor((x - global.grid_offset_x) / global.panel_width);
current_row = floor((y - global.grid_offset_y) / global.panel_height);

if (global.panels[current_row][current_col].tipo == 2) { // Tipo 2 es panel de hielo
    var sliding = true;
    while (sliding) {
        var next_x = x;
        var next_y = y;
        
        if (keyboard_check(ord("A"))) {
            next_x -= global.panel_width;
        } else if (keyboard_check(ord("D"))) {
            next_x += global.panel_width;
        } else if (keyboard_check(ord("W"))) {
            next_y -= global.panel_height;
        } else if (keyboard_check(ord("S"))) {
            next_y += global.panel_height;
        } else {
            sliding = false;
            break;
        }
        
        var next_col = floor((next_x - global.grid_offset_x) / global.panel_width);
        var next_row = floor((next_y - global.grid_offset_y) / global.panel_height);
        
        // Verificar si la nueva posición está dentro de los límites del área del jugador y dentro de los límites del tablero
        if (next_col >= 0 && next_col < array_length(global.panels[0]) &&
            next_row >= 0 && next_row < array_length(global.panels) &&
            global.panels[next_row][next_col].propietario == 2) {

            if (global.panels[next_row][next_col].tipo == 2) {
                x = next_x;
                y = next_y;
            } else if (global.panels[next_row][next_col].tipo != 6) { // No es un panel roto
                x = next_x;
                y = next_y;
                sliding = false;
            } else {
                sliding = false;
            }
        } else {
            sliding = false;
        }
    }
}

if (keyboard_check_pressed(ord("F")) && global.habilidades_seleccionadas_enemy[0] != -1) {
    ejecutar_habilidad_enemy(global.habilidades_seleccionadas_enemy[0], "obj_enemy");
}
if (keyboard_check_pressed(ord("G")) && global.habilidades_seleccionadas_enemy[1] != -1) {
    ejecutar_habilidad_enemy(global.habilidades_seleccionadas_enemy[1], "obj_enemy");
}
if (keyboard_check_pressed(ord("H")) && global.habilidades_seleccionadas_enemy[2] != -1) {
    ejecutar_habilidad_enemy(global.habilidades_seleccionadas_enemy[2], "obj_enemy");
}
if (keyboard_check_pressed(ord("J")) && global.habilidades_seleccionadas_enemy[3] != -1) {
    ejecutar_habilidad_enemy(global.habilidades_seleccionadas_enemy[3], "obj_enemy");
}
//--------------------------------------------------------------------------------

// inmunidad
if (inmunidad) {
    inmunidad_tiempo--;
    if (inmunidad_tiempo <= 0) {
        inmunidad = false;
    }
}


if (shoot_timer > 0) {
    shoot_timer -= 1;
}

// gano el mal jajaaj, 
if (vida <= 0) {
    show_message("¡Ganó el jugador!");
    instance_destroy(); // Eliminar al enemigo
}