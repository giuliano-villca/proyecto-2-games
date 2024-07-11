// Create Event
entity_type = "obj_enemy";
enemy_row = 1;
enemy_col = 4;
x = global.grid_offset_x + (enemy_col * global.panel_width);
y = global.grid_offset_y + (enemy_row * global.panel_height);

panel_width = 104;  // Ancho de cada panel
panel_height = 68; // Alto de cada panel

grid_x = floor(x / panel_width); // La posición x del enemigo en la cuadrícula
grid_y = floor(y / panel_height); // La posición y del enemigo en la cuadrícula


if (global.habilidades_seleccionadas_enemy == undefined) {
    global.habilidades_seleccionadas_enemy = array_create(4, -1); // Inicializar array de habilidades seleccionadas si no está definido
}

vida = 100; // Vida inicial del personaje
vidamaxima = 100;// vida maxima del personaje

// Variables de inmunidad
inmune = false; // Estado de inmunidad
inmunidad_tiempo = 0; // Tiempo de inmunidad
inmunidad_duracion = 1 * room_speed; // Duración de la inmunidad en frames (1.5 segundo a 60 FPS)

// Create event of obj_player tiempo para disparar
shoot_timer = 0;
shoot_cooldown = 30; // Set the cooldown period (e.g., 30 steps)

