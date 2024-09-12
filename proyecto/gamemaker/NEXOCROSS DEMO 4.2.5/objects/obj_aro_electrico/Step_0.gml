// En el evento Step de aro_electrico
if (direction == 0) {
    x += speed;
} else if (direction == 180) {
    x -= speed;
}

// Step Event en aro_electrico

var colision_bloqueo;
var colision_objetivo;

// Verificar colisión con el escudo primero
if (entity_type == "obj_player") {
    colision_bloqueo = instance_place(x, y, obj_escudo);
    colision_objetivo = instance_place(x, y, obj_enemy);
} else if (entity_type == "obj_enemy") {
    colision_bloqueo = instance_place(x, y, obj_escudo);
    colision_objetivo = instance_place(x, y, obj_player);
}

// Si colisiona con el escudo
if (colision_bloqueo != noone && colision_bloqueo.entity_type != entity_type) {
    // Destruir la bola de fuego al impactar con el escudo
    instance_destroy();
} 

var colision_invocacion = instance_place(x, y, all); 

if (colision_invocacion != noone && variable_instance_exists(colision_invocacion, "estructura")) {
    if (colision_invocacion.entity_type != entity_type) {
        // Aplicar daño a la invocación
        colision_invocacion.damage_received = aro_electrico_damage;
        instance_destroy(); // Destruir la bola de fuego
    }
}

// Si no colisiona con un escudo, verificar colisión con el objetivo
else if (colision_objetivo != noone) {
    // Verificar si el objetivo tiene inmunidad
    if (!colision_objetivo.inmunidad) {
		var objetivo_row = floor((colision_objetivo.y - global.grid_offset_y) / global.panel_height);
        var objetivo_col = floor((colision_objetivo.x - global.grid_offset_x) / global.panel_width);

        // Obtener el tipo de panel en el que está el objetivo
        var tipo_panel = global.panels[objetivo_row][objetivo_col].tipo;

        // Si el tipo de daño es eléctrico y el objetivo está en un panel de hielo (tipo 2)
        if (damage_type == "electrico" && tipo_panel == 2) {
            // Aplicar el doble de daño
            aro_electrico_damage *= 2;
        }
		
        // Aplicar daño si no tiene inmunidad
        fila_dano_proyectil(self, colision_objetivo, aro_electrico_damage, 0 * room_speed);
            // Si el tipo de daño es eléctrico, aplicar parálisis
		        // Si el tipo de daño es eléctrico, aplicar parálisis
        if (damage_type == "electrico") {
            colision_objetivo.estado_actual = "paralizado";
            colision_objetivo.estado_duracion = 5 * room_speed;  // Parálisis por 2 segundos
        }
	}
}

// Destruir la bola de fuego si sale de la pantalla
if (x > room_width || x < 0) {
    instance_destroy();
}