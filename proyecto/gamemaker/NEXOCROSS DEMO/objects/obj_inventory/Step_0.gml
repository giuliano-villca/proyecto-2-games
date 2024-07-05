// Evento Step de obj_inventory
if (keyboard_check_pressed(vk_up)) {
    selected_habilidad = (selected_habilidad - 1 + max_disponibles) mod max_disponibles;
}
if (keyboard_check_pressed(vk_down)) {
    selected_habilidad = (selected_habilidad + 1) mod max_disponibles;
}
if (keyboard_check_pressed(vk_space)) {
    for (var i = 0; i < 4; i++) {
        if (equipadas_habilidades[i] == -1) {
            equipadas_habilidades[i] = selected_habilidad;
            break;
        }
    }
}
if (keyboard_check_pressed(vk_backspace)) {
    for (var i = 0; i < 4; i++) {
        if (equipadas_habilidades[i] == selected_habilidad) {
            equipadas_habilidades[i] = -1;
            break;
        }
    }
}

// Detectar clic en el botón de combate
if (mouse_check_button_pressed(mb_left)) {
    if (mouse_x > boton_combate_x && mouse_x < boton_combate_x + boton_combate_ancho && mouse_y > boton_combate_y && mouse_y < boton_combate_y + boton_combate_alto) {
        // Guardar habilidades seleccionadas en global.habilidades_seleccionadas
        for (var i = 0; i < 4; i++) {
            if (equipadas_habilidades[i] != -1) {
                global.habilidades_seleccionadas[i] = habilidades_disponibles[equipadas_habilidades[i]];
            } else {
                global.habilidades_seleccionadas[i] = -1;
            }
        }
        room_goto(Room_combate); // Cambiar al room de combate
    }
}
