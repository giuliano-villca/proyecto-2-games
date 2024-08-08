// Evento Draw de obj_inventory
draw_self();
//selecion player
for (var i = scroll_offset; i < min(scroll_offset + 11, max_disponibles); i++) { // Ajustar para dibujar habilidades desplazadas
    if (i == selected_habilidad) {
        draw_set_color(c_red); // Selección
    } else {
        draw_set_color(c_white);
    }
    draw_text(x_start, y_start + (i - scroll_offset) * spacing, habilidades_disponibles[i]);
}


for (var i = 0; i < 4; i++) {
    if (equipadas_habilidades[i] != -1) {
        draw_set_color(c_green); // Habilidad equipada
        draw_text(equipado_x, equipado_y + i * spacing, habilidades_disponibles[equipadas_habilidades[i]]);
    }
}
//selecion enemy
for (var i = 0; i < max_disponibles_enemy; i++) {
    if (i == selected_habilidad_enemy) {
        draw_set_color(c_blue); // Selección
    } else {
        draw_set_color(c_white);
    }
    draw_text(x_start_enemy, y_start_enemy + i * spacing_enemy, habilidades_disponibles_enemy[i]);
}

for (var i = 0; i < 4; i++) {
    if (equipadas_habilidades_enemy[i] != -1) {
        draw_set_color(c_green); // Habilidad equipada
        draw_text(equipado_x_enemy, equipado_y_enemy + i * spacing_enemy, habilidades_disponibles_enemy[equipadas_habilidades_enemy[i]]);
    }
}

// Dibujar el botón de combate
draw_set_color(c_red);
draw_rectangle(boton_combate_x, boton_combate_y, boton_combate_x + boton_combate_ancho, boton_combate_y + boton_combate_alto, false);
draw_set_color(c_black);
draw_text(boton_combate_x + 10, boton_combate_y + 10, "Combate");