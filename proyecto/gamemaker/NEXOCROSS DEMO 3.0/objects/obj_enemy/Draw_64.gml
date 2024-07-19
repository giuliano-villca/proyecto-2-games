// Dibujar la barra de vida en la esquina superior derecha de la pantalla
draw_set_color(c_white); // Establecer el color en blanco
draw_rectangle(room_width + 110, -10,  1260, 50, false); // Dibujar un rectángulo para el fondo de la barra de vida
draw_set_color(c_yellow); // Establecer el color en rojo para el indicador de vida
draw_rectangle(room_width - 110, -10, 1270 + vida, 50, false); // Dibujar la barra de vida basada en la variable vida del enemigo

// Dibujar el texto de la vida
draw_set_color(c_black); // Establecer el color en negro para el texto
draw_text(room_width - 95, 15, "Vida: " + string(vida)); // Dibujar el texto de la vida