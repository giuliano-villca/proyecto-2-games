//obj_grid evento draw
for (var i = 0; i < array_length(global.panels); i++) {
    for (var j = 0; j < array_length(global.panels[i]); j++) {
        var panel = global.panels[i][j];
        var panel_x = global.grid_offset_x + (j * global.panel_width);
        var panel_y = global.grid_offset_y + (i * global.panel_height);
        var panel_width = global.panel_width;
        var panel_height = global.panel_height;

        // Establecer color del panel según su tipo y propietario
        switch(panel.tipo) {
            case 0: // Panel neutro
                draw_set_color(c_white);
                break;
            case 1: // Panel normal
                if (panel.propietario == 1) {
                    draw_set_color(c_blue); // Panel normal del jugador
                } else if (panel.propietario == 2) {
                    draw_set_color(c_red); // Panel normal del enemigo
                }
                break;
            case 2: // panel hielo
                if (panel.propietario == 1) {
                    draw_set_color(c_silver); // Panel tipo 2 del jugador
                } else if (panel.propietario == 2) {
                    draw_set_color(c_aqua); // Panel tipo 2 del enemigo
                }
                break;
            case 3: // Panel de pasto
                if (panel.propietario == 1) {
                    draw_set_color(c_green); // Panel de pasto del jugador
                } else if (panel.propietario == 2) {
                    draw_set_color(c_maroon); // Panel de pasto del enemigo
                }
                break;
            case 4: // Panel de lava
                if (panel.propietario == 1) {
                    draw_set_color(c_orange); // Panel de hielo del jugador
                } else if (panel.propietario == 2) {
                    draw_set_color(c_yellow); // Panel de hielo del enemigo
                }
                break;
            default:
                draw_set_color(c_gray); // Valor predeterminado para tipos desconocidos
                break;
        }

        draw_rectangle(panel_x, panel_y, panel_x + panel_width, panel_y + panel_height, false);

        // Dibujar línea verde alrededor del panel de pasto
        if (panel.tipo == 3) {
            draw_set_color(c_lime);
            draw_rectangle(panel_x, panel_y, panel_x + panel_width, panel_y + panel_height, true);
        }
        // Dibujar línea negra alrededor de otros tipos de paneles
        else {
            draw_set_color(c_black);
            draw_rectangle(panel_x, panel_y, panel_x + panel_width, panel_y + panel_height, true);
        }
    }
}