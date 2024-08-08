// Verificar colisión con objetivos en el radio de la explosión
var colision;
if (attack_type == "obj_player") {
    colision = collision_circle(x, y, explosion_radius, obj_enemy, false, true);
} else if (attack_type == "obj_enemy") {
    colision = collision_circle(x, y, explosion_radius, obj_player, false, true);
}

 // Verificar si el objetivo está en estado de inmunidad
            if (!colision.inmunidad) {
                // Aplicar daño directamente y establecer la inmunidad
                with (colision) {
                    if (variable_instance_exists(id, "vida")) {
                        vida -= other.explosion_damage; // Asegúrate de referenciar `sword_damage` correctamente
                        inmunidad = true;
                        inmunidad_tiempo = 1 * room_speed; // Duración de la inmunidad en steps, ajusta según sea necesario
                    }
                }
           }