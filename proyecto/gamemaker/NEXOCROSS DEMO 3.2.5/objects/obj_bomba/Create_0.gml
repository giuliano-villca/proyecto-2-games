// Configuración inicial de la bomba
move_speed = 5; // Velocidad de movimiento de la bomba
panel_distance = 2; // Distancia en paneles que la bomba debe viajar
panels_traveled = 0; // Paneles recorridos hasta ahora

// Determinar la dirección de la bomba
attack_type = argument0; // Tipo de entidad que lanza la bomba
direction = 0; // Dirección de movimiento (0 = derecha, 180 = izquierda)

if (attack_type == "obj_enemy") {
    direction = 180; // Cambiar dirección si es lanzada por el enemigo
}

// Guardar la posición inicial de la bomba
initial_x = x;