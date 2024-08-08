// Draw GUI event of obj_player

// Dibujar la barra de vida en la esquina superior izquierda de la pantalla
draw_set_color(c_white); // Establecer el color en blanco
draw_rectangle(1, -10, 110, 50, false); // Dibujar un rectángulo para el fondo de la barra de vida
draw_set_color(c_red); // Establecer el color en rojo para el indicador de vida
draw_rectangle(1, -10, 10 + vida, 50, false); // Dibujar la barra de vida basada en la variable player_health

// Dibujar el texto de la vida
draw_set_color(c_black); // Establecer el color en negro para el texto
draw_text(15, 15, "Vida: " + string(vida)); // Dibujar el texto de la vida