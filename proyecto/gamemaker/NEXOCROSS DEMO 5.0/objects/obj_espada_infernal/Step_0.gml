
// Detectar colisión con el objetivo correcto
var colision;
if (attack_type == "obj_player") {
    colision = instance_place(x, y, obj_enemy);
} else if (attack_type == "obj_enemy") {
    colision = instance_place(x, y, obj_player);
}

// Detectar colisión con cualquier objeto que tenga la variable 'estructura'
var colision_invocacion = instance_place(x, y, all);

if (!damage_applied && colision_invocacion != noone && variable_instance_exists(colision_invocacion, "estructura")) {
    if (colision_invocacion.entity_type != attack_type) {
        // Ajustar para calcular la fila y columna de la base de la estructura
        var invocacion_row = floor((colision_invocacion.y - global.grid_offset_y) / global.panel_height);
        var invocacion_col = floor((colision_invocacion.x - global.grid_offset_x) / global.panel_width);

        // Obtener el tipo de panel en el que está la invocación
        var tipo_panel_invocacion = global.panels[invocacion_row][invocacion_col].tipo;

        // Si el tipo de daño es fuego y la base de la estructura está en un panel de pasto (tipo 3)
        if (damage_type == "fuego" && tipo_panel_invocacion == 3) {
            sword_damage *= 2; // Aplicar el doble de daño
        }

        // Aplicar daño a la invocación
        colision_invocacion.damage_received = sword_damage;
        damage_applied = true;
    }
}

if (colision != noone) {
    if (!colision.inmunidad) {
        // Calcular la fila y columna del objetivo
        var objetivo_row = floor((colision.y - global.grid_offset_y) / global.panel_height);
        var objetivo_col = floor((colision.x - global.grid_offset_x) / global.panel_width);

        // Obtener el tipo de panel en el que está el objetivo
        var tipo_panel = global.panels[objetivo_row][objetivo_col].tipo;

        // Si el tipo de daño es fuego y el objetivo está en un panel de pasto (tipo 3)
        if (damage_type == "fuego" && tipo_panel == 3) {
            sword_damage *= 2; // Aplicar el doble de daño

        }

        // Aplicar daño al objetivo
        fila_dano_melee(self, colision, sword_damage, 1 * room_speed, 1, 2);
        damage_applied = true;
    }
}
// Determinar la posición inicial y fila de la espada 
var sword_row = floor((y - global.grid_offset_y) / global.panel_height); // Fila actual del jugador
var sword_col_start = floor((x - global.grid_offset_x) / global.panel_width); // Columna inicial de la espada

// Ajustar la fila afectada para considerar un desplazamiento de +1 fila
var sword_effect_row = sword_row + 1;

// Asegurar que las filas estén dentro de los límites de la cuadrícula
if (sword_effect_row >= 0 && sword_effect_row < array_length(global.panels)) {
    // Determinar el rango de columnas afectadas según la orientación
    var sword_col_end;
    if (attack_type == "obj_player") {
        sword_col_start -= 0; // Expandir rango una columna hacia la izquierda
        sword_col_end = sword_col_start + sword_range + 1; // Rango hacia adelante (+2 columnas)
    } else if (attack_type == "obj_enemy") {
        sword_col_start += 0; // Expandir rango una columna hacia la derecha
        sword_col_end = sword_col_start - sword_range - 1; // Rango hacia atrás (-2 columnas)
    }

    // Asegurar que las columnas estén dentro de los límites de la cuadrícula
    sword_col_start = clamp(sword_col_start, 0, array_length(global.panels[sword_effect_row]) - 1);
    sword_col_end = clamp(sword_col_end, 0, array_length(global.panels[sword_effect_row]) - 1);

    // Iterar sobre las columnas dentro del rango en la fila desplazada
    for (var col = min(sword_col_start, sword_col_end); col <= max(sword_col_start, sword_col_end); col++) {
        if (global.panels[sword_effect_row][col].tipo == 3 && damage_type == "fuego") {
			
			
            global.panels[sword_effect_row][col].tipo = 1; // Cambiar panel a normal
        }
    }
}

// Destruir la espada después de que la animación ha terminado
if (image_index >= image_number - 1) {
    instance_destroy();
}
