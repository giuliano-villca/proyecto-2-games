// En el evento Step de obj_wide_sword
// Determinar la posición del objetivo según la orientación del atacante
var target_x;
if (attack_type == "obj_player") {
    target_x = x + (panel_width * sword_range);
} else if (attack_type == "obj_enemy") {
    target_x = x - (panel_width * sword_range);
}

// Crear una lista para rastrear los enemigos golpeados
var enemigos_golpeados = ds_list_create();

// Verificar colisión con los objetivos correctos en la columna completa
for (var i = 0; i < global.panel_rows; i++) {
    var target_y = global.grid_offset_y + (i * panel_height);
    var colision;
    if (attack_type == "obj_player") {
        colision = instance_place(target_x, target_y, obj_enemy);
    } else if (attack_type == "obj_enemy") {
        colision = instance_place(target_x, target_y, obj_player);
    }

    if (colision != noone) {
        // Verificar si el enemigo ya ha sido golpeado
        var ya_golpeado = false;
        for (var j = 0; j < ds_list_size(enemigos_golpeados); j++) {
            if (enemigos_golpeados[| j] == colision.id) {
                ya_golpeado = true;
                break;
            }
        }

        if (!ya_golpeado) {
            // Añadir el ID del enemigo a la lista
            ds_list_add(enemigos_golpeados, colision.id);

            // Aplicar daño directamente
            with (colision) {
                if (variable_instance_exists(id, "vida")) {
                    vida -= other.sword_damage; // Asegúrate de referenciar `sword_damage` correctamente
                }
            }
        }
    }
}

// Limpiar la lista después de su uso
ds_list_destroy(enemigos_golpeados);

// Destruir la espada después del ataque
instance_destroy();