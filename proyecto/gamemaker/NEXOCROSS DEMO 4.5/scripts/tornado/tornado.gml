function tornado(entity_type){
    var tornado_x, tornado_y ,tornado_direction;
    
    if (entity_type == "obj_player") {
        tornado_x = x + 2 * global.panel_width; // Dos paneles adelante para el jugador
        tornado_direction = 0; // Dirección hacia adelante (a la derecha)
    } else if (entity_type == "obj_enemy") {
        tornado_x = x - 2 * global.panel_width; // Dos paneles adelante para el enemigo (a la izquierda)
		
        tornado_direction = 180; // Dirección hacia la izquierda
    } else {
        return; // Si el tipo de entidad no es válido, no hacer nada
    }

    // Crear el tornado en la capa "AbovePanels"
    var tornado_insta = instance_create_layer(tornado_x, y, "AbovePanels", obj_tornado);
    // Establecer la dirección del tornado
    tornado_insta.direction = tornado_direction;
    tornado_insta.attack_type = entity_type; // Guardar el tipo de entidad que lanza el tornado
}