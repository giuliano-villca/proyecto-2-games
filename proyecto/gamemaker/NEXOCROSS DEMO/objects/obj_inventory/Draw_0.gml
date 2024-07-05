// Evento Draw de obj_inventory
draw_self();

for (var i = 0; i < max_disponibles; i++) {
    if (i == selected_habilidad) {
        draw_set_color(c_yellow); // Selección
    } else {
        draw_set_color(c_white);
    }
    draw_text(x_start, y_start + i * spacing, habilidades_disponibles[i]);
}

for (var i = 0; i < 4; i++) {
    if (equipadas_habilidades[i] != -1) {
        draw_set_color(c_green); // Habilidad equipada
        draw_text(equipado_x, equipado_y + i * spacing, habilidades_disponibles[equipadas_habilidades[i]]);
    }
}

// Dibujar el botón de combate
draw_set_color(c_red);
draw_rectangle(boton_combate_x, boton_combate_y, boton_combate_x + boton_combate_ancho, boton_combate_y + boton_combate_alto, false);
draw_text(boton_combate_x + 10, boton_combate_y + 10, "Combate");