function espada_infernal(entity_type) {
        // Determinar la posición inicial de la espada según el tipo de entidad
        var sword_x, sword_direction, sword_y;
        if (entity_type == "obj_player") {
            sword_x = x + 135; // Posición inicial para el jugador
			sword_y = y - 25;
			sword_direction = 0; // Dirección a la derecha
 } else if (entity_type == "obj_enemy") {
			sword_x = x - +10; // Posición inicial para el enemigo
			sword_y = y - 30;
			sword_direction = 180; // Dirección a la izquierda
        } else {
            return; // Si el tipo de entidad no es válido, no hacer nada
        }

        // Crear la espada en la capa "AbovePanels"
        var sword = instance_create_layer(sword_x, sword_y, "capa_primera", obj_espada_infernal);
        // Establecer el tipo de entidad que usa la espada
        sword.attack_type = entity_type;
    if (entity_type == "obj_player") {
        sword.image_xscale = 3; // Mirando a la derecha
		sword.image_yscale = 2;
    } else if (entity_type == "obj_enemy") {
        sword.image_xscale = -3; // Mirando a la izquierda
		sword.image_yscale = 2;
    }
}