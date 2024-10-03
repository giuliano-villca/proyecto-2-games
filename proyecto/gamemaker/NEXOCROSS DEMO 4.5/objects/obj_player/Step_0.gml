// Lógica de movimiento del jugador en el evento Step de obj_player
var new_x = x;
var new_y = y;

var previous_x = x;
var previous_y = y;

var previous_col = floor((x - global.grid_offset_x) / global.panel_width);
var previous_row = floor((y - global.grid_offset_y) / global.panel_height);

// Función interna para obtener la dirección de movimiento según la tecla presionada
var obtener_direccion = function() {
    var dir_x = 0;
    var dir_y = 0;

    if (keyboard_check_pressed(ord("A"))) {
        dir_x = -global.panel_width;
    } else if (keyboard_check_pressed(ord("D"))) {
        dir_x = global.panel_width;
    } else if (keyboard_check_pressed(ord("W"))) {
        dir_y = -global.panel_height;
    } else if (keyboard_check_pressed(ord("S"))) {
        dir_y = global.panel_height;
    }

    return [dir_x, dir_y];
};
// Comprobamos el estado del jugador
if (estado_actual != estado_paralizado) {
    sprite_index = spr_player_futurista;

    // Usamos la función para obtener la dirección de movimiento
    var direccion = obtener_direccion();
    new_x += direccion[0];
    new_y += direccion[1];
}
// Si está paralizado, quizás reducir movimiento o evitarlo por completo
if (estado_actual == estado_paralizado) {
    // Aquí puedes hacer que el jugador no se mueva o alguna penalización.
		sprite_index = spr_player_paralizado;
		
          if (estado_duracion > 0) {
            estado_duracion--;
        } else {
            estado_actual = estado_normal;  // Vuelve al estado normal después de la parálisis
        }	
    new_x = x;
    new_y = y;
}

// Calcular las nuevas coordenadas de la columna y la fila
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
    } 
    else if (global.panels[new_row][new_col].estructura) { 
        // Impedir movimiento si hay una estructura en el panel
        x = previous_x;
        y = previous_y;
      
    }
    else {
        // Permitir el movimiento a los paneles del jugador (propietario 1)
        if (global.panels[new_row][new_col].propietario == 1) {
            x = new_x;
            y = new_y;

            // Solo cambiar el tipo del panel anterior si la posición cambió
            if ((new_col != previous_col || new_row != previous_row) && 
                previous_col >= 0 && previous_row >= 0 &&
                global.panels[previous_row][previous_col].tipo == 5) {
                // Cambiar el panel a roto (tipo 6) y reiniciar el temporizador
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

if (estado_actual != estado_paralizado && global.panels[current_row][current_col].tipo == 2) { // Tipo 2 es panel de hielo
    var sliding = true;
    while (sliding) {
        // Usamos la misma función para obtener la dirección de deslizamiento
        var direccion = obtener_direccion();
        var next_x = x + direccion[0];
        var next_y = y + direccion[1];

        if (direccion[0] == 0 && direccion[1] == 0) {
            sliding = false;
            break;
        }
        
        var next_col = floor((next_x - global.grid_offset_x) / global.panel_width);
        var next_row = floor((next_y - global.grid_offset_y) / global.panel_height);
        
        // Verificar si la nueva posición está dentro de los límites del área del jugador y dentro de los límites del tablero
        if (next_col >= 0 && next_col < array_length(global.panels[0]) &&
            next_row >= 0 && next_row < array_length(global.panels) &&
            global.panels[next_row][next_col].propietario == 1) {

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


// Evento Step en obj_player para el manejo automático de retroceso
var current_col = floor((x - global.grid_offset_x) / global.panel_width);
var current_row = floor((y - global.grid_offset_y) / global.panel_height);


for (var i = 0; i < array_length(global.habilidades_seleccionadas); i++) {
    var habilidad = global.habilidades_seleccionadas[i];
    if (habilidad != -1 && global.habilidad_estado[? habilidad] > 0) {
        global.habilidad_estado[? habilidad]--;
    }
}


// Verificar si el jugador está sobre un panel de lava (tipo 4)
if (global.panels[current_row][current_col].tipo == 4) {
    if (!inmunidad) {
        // Aplicar daño al jugador
        vida -= 10; // Puedes ajustar la cantidad de daño según sea necesario

        // Activar inmunidad
        inmunidad = true;
        inmunidad_tiempo = 1 * room_speed; // Duración de la inmunidad en segundos, ajustable

        // Cambiar el panel de lava a uno normal (tipo 1)
        global.panels[current_row][current_col].tipo = 1;
    }
}



// Asegúrate de definir offset en algún punto antes de esta línea
var offset = grupo_habilidades_activo * 4; // o donde sea necesario calcular el offset

//paralisis
if (estado_actual != estado_paralizado) {
if (keyboard_check_pressed(ord("R")) && global.habilidades_seleccionadas[offset + 0] != -1) {
    ejecutar_habilidad(global.habilidades_seleccionadas[offset + 0], "obj_player");
}
if (keyboard_check_pressed(ord("T")) && global.habilidades_seleccionadas[offset + 1] != -1) {
    ejecutar_habilidad(global.habilidades_seleccionadas[offset + 1], "obj_player");
}
if (keyboard_check_pressed(ord("F")) && global.habilidades_seleccionadas[offset + 2] != -1) {
    ejecutar_habilidad(global.habilidades_seleccionadas[offset + 2], "obj_player");
}
if (keyboard_check_pressed(ord("G")) && global.habilidades_seleccionadas[offset + 3] != -1) {
    ejecutar_habilidad(global.habilidades_seleccionadas[offset + 3], "obj_player");
}
}
//---------------------------------

/*
if (keyboard_check_pressed(ord("P"))) {
    grupo_habilidades_activo = 1 - grupo_habilidades_activo; // Cambia entre 0 y 1
}
*/

if (keyboard_check_pressed(ord("Y"))) {
    grupo_habilidades_activo++;
    if (grupo_habilidades_activo > 2) { // Regresa al primer grupo si se pasa del último grupo
        grupo_habilidades_activo = 0; // Regresa al último grupo si se pasa del primer grupo
    }
}

if (keyboard_check_pressed(ord("H"))) { //para que funcione la tecla Ñ
    grupo_habilidades_activo--;       // Regresa al último grupo si se pasa del primer grupo
    if (grupo_habilidades_activo < 0) {
        grupo_habilidades_activo = 2;
    }
}
//--------------------------------------------------------------------------------

// inmunidad
if (inmunidad) {
    inmunidad_tiempo--;
    if (inmunidad_tiempo <= 0) {
        inmunidad = false;
    }
}
// Manejar el tiempo de inmunidad
if (bloqueo_activo) {
    if (bloqueo_duracion > 0) {
        bloqueo_duracion--;
    } else {
        // Desactivar escudo e inmunidad cuando el tiempo termine
        bloqueo_activo = false;
        inmunidad = false;

        // Destruir el escudo si existe
        with (obj_escudo) {
            if (entity_type == other.entity_type) {
                instance_destroy();
            }
        }
    }
}

// Decrease the shoot timer if it's greater than 0
if (shoot_timer > 0) {
    shoot_timer -= 1;
}

// En obj_player, evento Step
if (vida <= 0) {
    show_message("¡Ganó el enemigo!");
    instance_destroy(); // Eliminar al jugador
}


