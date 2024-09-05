function espada_lunar(entity_type) {
// Determinar la posición inicial de la espada según el tipo de entidad
    var sword_x, sword_direction;
    if (entity_type == "obj_player") {
        sword_x = x + 135; // Posición inicial para el jugador
        sword_direction = 0; // Dirección a la derecha
    } else if (entity_type == "obj_enemy") {
        sword_x = x - +10; // Posición inicial para el enemigo
        sword_direction = 180; // Dirección a la izquierda
    } else {
        return; // Si el tipo de entidad no es válido, no hacer nada
    }

    // Crear la espada en la capa "AbovePanels"
    var sword = instance_create_layer(sword_x, y, "capa_primera", obj_espada_lunar_efecto);
    // Establecer el tipo de entidad que usa la espada

    sword.attack_type = entity_type;
	// Ajustar la orientación de la espada según la dirección
    if (entity_type == "obj_player") {
        sword.image_xscale = 2; // Mirando a la derecha
    } else if (entity_type == "obj_enemy") {
        sword.image_xscale = -2; // Mirando a la izquierda
    }
}


