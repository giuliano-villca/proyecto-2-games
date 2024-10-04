if (room == Room_combate) {
    if (global.sprite_fondo_combate != undefined) {
        draw_self(); // Dibuja la instancia en la capa "solo_fondos"
        draw_sprite(global.sprite_fondo_combate, 0, 0, 0);
    }
	else {
        draw_self(); // Dibuja la instancia en la capa "solo_fondos"
        draw_sprite(estadio, 0, 0, 0); // Dibujar un fondo por defecto
    }
	/*
  if (global.fondo_seleccionado == "estadio") {
         var publicidad = megadibu; // Aquí coloca el nombre del sprite que deseas dibujar
         draw_sprite(publicidad, 0, 593, 147); // Dibuja el sprite adicional en la posición deseada
        }
	*/
}