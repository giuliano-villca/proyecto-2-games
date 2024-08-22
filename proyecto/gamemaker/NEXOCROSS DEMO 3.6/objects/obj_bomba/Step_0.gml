// movimiento de la bomba
x += lengthdir_x(move_speed, direction);

// verificar si la bomba ha recorrido un panel
if (abs(x - initial_x) >= global.panel_width) {
    panels_traveled += 1;
    initial_x = x; // Actualizar la posición inicial al alcanzar un nuevo panel
}

// posicionar la explosion de la bomba
if (panels_traveled >= panel_distance) {
     var explosion_x, explosion_y;
    if (attack_type == "obj_player") {
        explosion_x = x - 125 + global.panel_width / 2; // ajustar la posición para el jugador
        explosion_y = y;
    } else if (attack_type == "obj_enemy") {
        explosion_x = x + 25 - global.panel_width / 2; // ajustar la posición para el enemigo
        explosion_y = y;
    }
	else {
        return; // si el tipo de entidad no es válido, no hacer nada
	}
	
	// crear la explosión en la posición de la bomba
    var explosion = instance_create_layer(explosion_x, explosion_y, "AbovePanels", obj_explosion);
    // pasar el tipo de entidad que ataca a la explosión
    explosion.attack_type = attack_type;
    // destruir la bomba (otra palabras, hiroshima y nagasaki)
    instance_destroy();
}

// Destruir la bomba si sale de la pantalla
if (x > room_width || x < 0) {
    instance_destroy();
}