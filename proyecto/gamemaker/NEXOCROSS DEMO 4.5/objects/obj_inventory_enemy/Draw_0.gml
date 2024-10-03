/*
draw_self();

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
draw_rectangle(boton_combate_x_enemy, boton_combate_y_enemy, boton_combate_x_enemy + boton_combate_ancho_enemy, boton_combate_y_enemy + boton_combate_alto_enemy, false);
draw_text(boton_combate_x_enemy + 10, boton_combate_y_enemy + 10, "Combate");