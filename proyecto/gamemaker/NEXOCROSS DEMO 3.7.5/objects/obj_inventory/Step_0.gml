// Evento Step de obj_inventory

// control player
if (keyboard_check_pressed(ord("W"))) {
    selected_habilidad = max(0, selected_habilidad - 1);
    if (selected_habilidad < scroll_offset + 5) {
        scroll_offset = max(0, scroll_offset - 1);
    }
}
if (keyboard_check_pressed(ord("S"))) {
    selected_habilidad = min(max_disponibles - 1, selected_habilidad + 1);
    if (selected_habilidad >= scroll_offset + 6) {  // Ajustar el valor aquí para cambiar el comportamiento del desplazamiento
        scroll_offset = min(max_scroll, scroll_offset + 1);
    }
}
if (keyboard_check_pressed(ord("R"))) {
    for (var i = 0; i < 12; i++) {
        if (equipadas_habilidades[i] == -1) {
            equipadas_habilidades[i] = selected_habilidad;
            break;
        }
    }
}
if (keyboard_check_pressed(ord("T"))) {
    for (var i = 0; i < 12; i++) {
        if (equipadas_habilidades[i] == selected_habilidad) {
            equipadas_habilidades[i] = -1;
            break;
        }
    }
}
// control enemy
if (keyboard_check_pressed(vk_up)) {
    selected_habilidad_enemy = max(0, selected_habilidad_enemy - 1);
    if (selected_habilidad_enemy < scroll_offset_enemy + 5) {
        scroll_offset_enemy = max(0, scroll_offset_enemy - 1);
    }
}
if (keyboard_check_pressed(vk_down)) {
    selected_habilidad_enemy = min(max_disponibles_enemy - 1, selected_habilidad_enemy + 1);
    if (selected_habilidad_enemy >= scroll_offset_enemy + 6) {   // Ajustar el valor aquí para cambiar el comportamiento del desplazamiento
        scroll_offset_enemy = min(max_scroll_enemy, scroll_offset_enemy + 1);
    }
}
if (keyboard_check_pressed(ord("I"))) {
    for (var i = 0; i < 12; i++) {
        if (equipadas_habilidades_enemy[i] == -1) {
            equipadas_habilidades_enemy[i] = selected_habilidad_enemy;
            break;
        }
    }
}
if (keyboard_check_pressed(ord("O"))) {
    for (var i = 0; i < 12; i++) {
        if (equipadas_habilidades_enemy[i] == selected_habilidad_enemy) {
            equipadas_habilidades_enemy[i] = -1;
            break;
        }
    }
}

if (keyboard_check_pressed(vk_left)) {
    selected_fondo = (selected_fondo - 1 + max_fondos) mod max_fondos;
}
if (keyboard_check_pressed(vk_right)) {
    selected_fondo = (selected_fondo + 1) mod max_fondos;
}

// Guardar el índice del sprite en la variable global
global.fondo_seleccionado = fondos_disponibles[selected_fondo]; // Actualizar el fondo seleccionado globalmente
global.sprite_fondo_combate = asset_get_index(global.fondo_seleccionado);

// Detectar clic en el botón de combate unificado
if (mouse_check_button_pressed(mb_left)) {
    if (mouse_x > boton_combate_x && mouse_x < boton_combate_x + boton_combate_ancho && mouse_y > boton_combate_y && mouse_y < boton_combate_y + boton_combate_alto) {
        // Guardar habilidades seleccionadas del jugador en global.habilidades_seleccionadas
        for (var i = 0; i < 12; i++) {
            if (equipadas_habilidades[i] != -1) {
                global.habilidades_seleccionadas[i] = habilidades_disponibles[equipadas_habilidades[i]];
            } else {
                global.habilidades_seleccionadas[i] = -1;
            }
        }
        
        // Guardar habilidades seleccionadas del enemigo en global.habilidades_seleccionadas_enemy
        for (var i = 0; i < 12; i++) {
            if (equipadas_habilidades_enemy[i] != -1) {
                global.habilidades_seleccionadas_enemy[i] = habilidades_disponibles_enemy[equipadas_habilidades_enemy[i]];
            } else {
                global.habilidades_seleccionadas_enemy[i] = -1;
            }
        }
		
        room_goto(Room_combate); // Cambiar al room de combate
		
    }
}
