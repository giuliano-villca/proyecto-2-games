/*
// Evento Step de obj_inventory
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

// Detectar clic en el botón de combate
if (mouse_check_button_pressed(mb_left)) {
        if (mouse_x > boton_combate_x_enemy && mouse_x < boton_combate_x_enemy + boton_combate_ancho_enemy && mouse_y > boton_combate_y_enemy && mouse_y < boton_combate_y_enemy + boton_combate_alto_enemy) {
        // Guardar habilidades seleccionadas en global.habilidades_seleccionadas
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
