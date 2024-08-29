// Configuración inicial de la bomba
move_speed = 5; // Velocidad de movimiento de la bomba
panel_distance = 3; // Distancia en paneles que la bomba debe viajar
panels_traveled = 0; // Paneles recorridos hasta ahora

// Determinar la dirección de la bomba
attack_type = argument0; // Tipo de entidad que lanza la bomba
if (attack_type == "obj_player") {
    direction = 0; // Mover hacia la derecha si la lanza el jugador
} else if (attack_type == "obj_enemy") {
    direction = 180; // Mover hacia la izquierda si la lanza el enemigo
}

// Guardar la posición inicial de la bomba
initial_x = x;