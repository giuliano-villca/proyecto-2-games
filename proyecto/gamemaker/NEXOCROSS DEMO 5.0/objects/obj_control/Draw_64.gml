// Dibujar pantalla de victoria
if (global.victoria_jugador) {
    draw_sprite(spr_ganador_1, 0, 425, 150);
	draw_sprite(spr_volver_selecionar, 0, 575, 425);
	
	// Configurar el color del borde
draw_set_color(c_white);

// Dibujar el borde del texto (desplazado en las 8 direcciones)
draw_text(575 - 1, 550, "Presiona R para continuar"); // Izquierda
draw_text(575 + 1, 550, "Presiona R para continuar"); // Derecha
draw_text(575, 550 - 1, "Presiona R para continuar"); // Arriba
draw_text(575, 550 + 1, "Presiona R para continuar"); // Abajo

draw_text(575 - 1, 550 - 1, "Presiona R para continuar"); // Esquina superior izquierda
draw_text(575 + 1, 550 - 1, "Presiona R para continuar"); // Esquina superior derecha
draw_text(575 - 1, 550 + 1, "Presiona R para continuar"); // Esquina inferior izquierda
draw_text(575 + 1, 550 + 1, "Presiona R para continuar"); // Esquina inferior derecha

	
	draw_set_color(c_red);
	draw_text(575, 550, "Presiona R para continuar");

} if (global.victoria_enemigo) {
    draw_sprite(spr_ganador_2, 0, 425, 150);
	draw_sprite(spr_volver_selecionar, 0, 575, 425);
	
draw_set_color(c_white);
// Dibujar el borde del texto (desplazado en las 8 direcciones)
draw_text(575 - 1, 550, "Presiona I para continuar"); // Izquierda
draw_text(575 + 1, 550, "Presiona I para continuar"); // Derecha
draw_text(575, 550 - 1, "Presiona I para continuar"); // Arriba
draw_text(575, 550 + 1, "Presiona I para continuar"); // Abajo

draw_text(575 - 1, 550 - 1, "Presiona I para continuar"); // Esquina superior izquierda
draw_text(575 + 1, 550 - 1, "Presiona I para continuar"); // Esquina superior derecha
draw_text(575 - 1, 550 + 1, "Presiona I para continuar"); // Esquina inferior izquierda
draw_text(575 + 1, 550 + 1, "Presiona I para continuar"); // Esquina inferior derecha

    draw_set_color(c_red); 
	draw_text(575, 550, "Presiona I para continuar");
}
