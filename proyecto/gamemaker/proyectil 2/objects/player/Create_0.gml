// Create event of obj_player tiempo para disparar
shoot_timer = 0;
shoot_cooldown = 60; // Set the cooldown period (e.g., 30 steps)




// Tamaño de la cuadrícula
grid_size = 94;

// Posición inicial del jugador en la cuadrícula
grid_x = 8.13;
grid_y = 3.8;

// Posición inicial en píxeles
x = grid_x * grid_size;
y = grid_y * grid_size;

// Tiempo entre movimientos
move_delay = 10;
move_timer = 0;


// Create Event
vida = 100; // Vida inicial del personaje


// Variables de inmunidad
inmune = false; // Estado de inmunidad
inmunidad_tiempo = 0; // Tiempo de inmunidad
inmunidad_duracion = 90; // Duración de la inmunidad en frames (1.5 segundo a 60 FPS)
