// Determinar la posición del objetivo según la orientación del atacante
var target_x, target_y;
if (attack_type == "obj_player") {
    target_x = x + (global.panel_width * sword_range);
    target_y = y;
} else if (attack_type == "obj_enemy") {
    target_x = x - (global.panel_width * sword_range);
    target_y = y;
}

// Detectar si la bola de fuego está en la misma fila que un objetivo
var sword_row = floor((y - global.grid_offset_y) / global.panel_height);


// Verificar colisión con el objetivo correcto
var colision;
if (attack_type == "obj_player") {
    colision = instance_place(target_x, target_y, obj_enemy);
} else if (attack_type == "obj_enemy") {
    colision = instance_place(target_x, target_y, obj_player);
}

// Detectar colisión con cualquier objeto que tenga la variable 'estructura'
var colision_invocacion = instance_place(target_x, target_y, all);

if (!damage_applied && colision_invocacion != noone && variable_instance_exists(colision_invocacion, "estructura")) {
    if (colision_invocacion.entity_type != attack_type) {
        // Ajustar para calcular la fila y columna de la base de la estructura
        var invocacion_row = floor((colision_invocacion.y - global.grid_offset_y) / global.panel_height);
        var invocacion_col = floor((colision_invocacion.x - global.grid_offset_x) / global.panel_width);

        // Obtener el tipo de panel en el que está la invocación
        var tipo_panel_invocacion = global.panels[invocacion_row][invocacion_col].tipo;

        // Si el tipo de daño es fuego y la base de la estructura está en un panel de pasto (tipo 3)
        if (damage_type == "fuego" && tipo_panel_invocacion == 3) {
            // Aplicar el doble de daño
            sword_damage *= 2;
            // Cambiar el panel de pasto a un panel normal (tipo 1)
            global.panels[invocacion_row][invocacion_col].tipo = 1;
        }

        // Aplicar daño a la invocación
        colision_invocacion.damage_received = sword_damage;
        damage_applied = true; // Marcar que el daño fue aplicado
    }
}

if (colision != noone) {
    // Verificar si el objetivo está en estado de inmunidad
    if (!colision.inmunidad) {
        // Calcular la fila y columna del objetivo
        var objetivo_row = floor((colision.y - global.grid_offset_y) / global.panel_height);
        var objetivo_col = floor((colision.x - global.grid_offset_x) / global.panel_width);

        // Obtener el tipo de panel en el que está el objetivo
        var tipo_panel = global.panels[objetivo_row][objetivo_col].tipo;

        // Si el tipo de daño es fuego y el objetivo está en un panel de pasto (tipo 3)
        if (damage_type == "fuego" && tipo_panel == 3) {
            // Aplicar el doble de daño
            sword_damage *= 2;
            // Cambiar el panel de pasto a un panel normal (tipo 1)
            global.panels[objetivo_row][objetivo_col].tipo = 1;
        }

        // Aplicar daño al objetivo
        fila_dano_melee(self, colision, sword_damage, 1 * room_speed, 1, 2);
        damage_applied = true; // Marcar que el daño fue aplicado
    }
}
// Detectar si la bola de fuego pasa por un panel de pasto (tipo 3)
var sword_col = floor((x - global.grid_offset_x) / global.panel_width);

// Verificar si las coordenadas están dentro de los límites de la cuadrícula
if (sword_row >= 0 && sword_row < array_length(global.panels) &&
    sword_col >= 0 && sword_col < array_length(global.panels[0])) {
    
    // Verificar si el panel en el que está la bola de fuego es de tipo pasto (tipo 3)
    if (global.panels[sword_row][sword_col].tipo == 3) {
        // Cambiar el panel de pasto a un panel normal (tipo 1)
        global.panels[sword_row][sword_col].tipo = 1;
    } 
}



// Destruir la espada después de que la animación ha terminado
if (image_index >= image_number - 1) {
    instance_destroy();
}