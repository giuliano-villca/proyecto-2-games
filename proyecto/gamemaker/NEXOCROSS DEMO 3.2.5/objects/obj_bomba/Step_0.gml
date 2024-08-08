// Movimiento de la bomba
x += lengthdir_x(move_speed, direction);

// Verificar si la bomba ha recorrido un panel
if (abs(x - initial_x) >= global.panel_width) {
    panels_traveled += 1;
    initial_x = x; // Actualizar la posición inicial al alcanzar un nuevo panel
}

// Si la bomba ha recorrido la distancia requerida, explota
if (panels_traveled >= panel_distance) {
    // Crear la explosión en la posición de la bomba
    var explosion = instance_create_layer(x, y, "AbovePanels", obj_explosion);
    // Pasar el tipo de entidad que ataca a la explosión
    explosion.attack_type = attack_type;
    // Destruir la bomba
    instance_destroy();
}