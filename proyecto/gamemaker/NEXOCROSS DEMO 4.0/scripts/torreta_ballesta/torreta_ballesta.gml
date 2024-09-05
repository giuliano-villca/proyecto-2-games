function torreta_ballesta(entity_type) {
    // Determinar la posición inicial de la torreta según el tipo de entidad
    var pos_x, pos_y, start_col, start_row;

    if (entity_type == "obj_player") {
        start_col = floor((obj_player.x - global.grid_offset_x) / global.panel_width) + 1;
        start_row = floor((obj_player.y - global.grid_offset_y) / global.panel_height);
    } else if (entity_type == "obj_enemy") {
        start_col = floor((obj_enemy.x - global.grid_offset_x) / global.panel_width) - 1;
        start_row = floor((obj_enemy.y - global.grid_offset_y) / global.panel_height);
	} 
else {
        return; // Si el tipo de entidad no es válido, no hacer nada
    }

    // Asegurarse de que las coordenadas están dentro de los límites del tablero
    if (start_col < 0 || start_col >= array_length(global.panels[0]) ||
        start_row < 0 || start_row >= array_length(global.panels)) {
        return; // Si está fuera del tablero, no crear la torreta
    }

    // Verificar si el panel está libre de estructuras
    if (global.panels[start_row][start_col].estructura) {
        show_message("No puedes colocar una torreta aquí. El panel ya está ocupado.");
        return; // No colocar la torreta si ya hay una estructura
    }

    // Calcular la posición en píxeles
    pos_x = global.grid_offset_x + (start_col * global.panel_width);
    pos_y = global.grid_offset_y + (start_row * global.panel_height) - 40;

    // Crear la torreta en la capa "AbovePanels"
    var torreta_inst = instance_create_layer(pos_x, pos_y, "AbovePanels", obj_torreta_ballesta);

    // Configurar la torreta
    if (torreta_inst != noone) {
        torreta_inst.entity_type = entity_type; // Guardar el tipo de entidad que invoca la torreta
        torreta_inst.start_col = start_col; // Guardar la columna de la torreta
        torreta_inst.start_row = start_row; // Guardar la fila de la torreta

        // Ajustar la orientación de la torreta según la entidad
        if (entity_type == "obj_player") {
            torreta_inst.image_xscale = 3.5; // Orientar hacia la derecha
		 
        } else if (entity_type == "obj_enemy") {
            torreta_inst.image_xscale = 3.3; // Orientar hacia la izquierda

        }

        // Marcar el panel como ocupado por una estructura
        global.panels[start_row][start_col].estructura = true;
    }
}