if (room == Room_combate) {
    if (global.sprite_fondo_combate != undefined) {
        draw_self(); // Dibuja la instancia en la capa "solo_fondos"
        draw_sprite(global.sprite_fondo_combate, 0, 0, 0);
    } else {
        draw_self(); // Dibuja la instancia en la capa "solo_fondos"
        draw_sprite(estadio, 0, 0, 0); // Dibujar un fondo por defecto
    }
}