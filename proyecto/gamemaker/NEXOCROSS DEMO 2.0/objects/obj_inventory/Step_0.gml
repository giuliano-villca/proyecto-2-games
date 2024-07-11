// Evento Step de obj_inventory
// control player
if (keyboard_check_pressed(vk_up)) {
    selected_habilidad = (selected_habilidad - 1 + max_disponibles) mod max_disponibles;
}
if (keyboard_check_pressed(vk_down)) {
    selected_habilidad = (selected_habilidad + 1) mod max_disponibles;
}
if (keyboard_check_pressed(ord("U"))) {
    for (var i = 0; i < 4; i++) {
        if (equipadas_habilidades[i] == -1) {
            equipadas_habilidades[i] = selected_habilidad;
            break;
        }
    }
}
if (keyboard_check_pressed(ord("I"))) {
    for (var i = 0; i < 4; i++) {
        if (equipadas_habilidades[i] == selected_habilidad) {
            equipadas_habilidades[i] = -1;
            break;
        }
    }
}
// control enemy
if (keyboard_check_pressed(ord("W"))) {
    selected_habilidad_enemy = (selected_habilidad_enemy - 1 + max_disponibles_enemy) mod max_disponibles_enemy;
}
if (keyboard_check_pressed(ord("S"))) {
    selected_habilidad_enemy = (selected_habilidad_enemy + 1) mod max_disponibles_enemy;
}
if (keyboard_check_pressed(ord("F"))) {
    for (var i = 0; i < 4; i++) {
        if (equipadas_habilidades_enemy[i] == -1) {
            equipadas_habilidades_enemy[i] = selected_habilidad_enemy;
            break;
        }
    }
}
if (keyboard_check_pressed(ord("G"))) {
    for (var i = 0; i < 4; i++) {
        if (equipadas_habilidades_enemy[i] == selected_habilidad_enemy) {
            equipadas_habilidades_enemy[i] = -1;
            break;
        }
    }
}
// Detectar clic en el botón de combate unificado
if (mouse_check_button_pressed(mb_left)) {
    if (mouse_x > boton_combate_x && mouse_x < boton_combate_x + boton_combate_ancho && mouse_y > boton_combate_y && mouse_y < boton_combate_y + boton_combate_alto) {
        // Guardar habilidades seleccionadas del jugador en global.habilidades_seleccionadas
        for (var i = 0; i < 4; i++) {
            if (equipadas_habilidades[i] != -1) {
                global.habilidades_seleccionadas[i] = habilidades_disponibles[equipadas_habilidades[i]];
            } else {
                global.habilidades_seleccionadas[i] = -1;
            }
        }
        
        // Guardar habilidades seleccionadas del enemigo en global.habilidades_seleccionadas_enemy
        for (var i = 0; i < 4; i++) {
            if (equipadas_habilidades_enemy[i] != -1) {
                global.habilidades_seleccionadas_enemy[i] = habilidades_disponibles_enemy[equipadas_habilidades_enemy[i]];
            } else {
                global.habilidades_seleccionadas_enemy[i] = -1;
            }
        }
        
        room_goto(Room_combate); // Cambiar al room de combate
    }
}