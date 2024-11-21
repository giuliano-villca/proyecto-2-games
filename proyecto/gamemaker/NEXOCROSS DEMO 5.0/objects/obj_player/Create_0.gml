// Evento Create en obj_player
entity_type = "obj_player";
player_row = 1;
player_col = 1;
x = global.grid_offset_x + (player_col * global.panel_width);
y = global.grid_offset_y + (player_row * global.panel_height);

// Inicializar las posiciones anteriores
previous_col = -1;
previous_row = -1;

panel_width = 104;  // Ancho de cada panel
panel_height = 68; // Alto de cada panel

grid_x = floor(x / panel_width); // La posición x del enemigo en la cuadrícula
grid_y = floor(y / panel_height); // La posición y del enemigo en la cuadrícula




if (global.habilidades_seleccionadas == undefined) {
    global.habilidades_seleccionadas = array_create(4, -1); // Inicializar array de habilidades seleccionadas si no está definido
}

grupo_habilidades_activo = 0; // Inicializar para mostrar las primeras 4 habilidades

// Inicializar el estado de cooldown para cada habilidad
global.habilidad_estado = ds_map_create();
for (var i = 0; i < array_length(global.habilidades_seleccionadas); i++) {
    if (global.habilidades_seleccionadas[i] != -1) {
        var habilidad = global.habilidades_seleccionadas[i];
        global.habilidad_estado[? habilidad] = 0; // 0 indica que la habilidad está lista para usarse
    }
}


damage_type = "";
//estados del jugador 
estado_actual = "normal";
estado_duracion = 0;
//lista de estado
estado_normal = "normal";
estado_paralizado = "paralizado";
estado_congelado = "congelado";

// Create Event
vida = 200; // Vida inicial del personaje
vidamaxima = 200;// vida maxima del personaje

// Variables de inmunidad
inmunidad = false;
inmunidad_tiempo = 0;
bloqueo_activo = false;
// Create event of obj_player tiempo para disparar
shoot_timer = 0;
shoot_cooldown = 30; // Set the cooldown period (e.g., 30 steps)


// Variables iniciales para gestionar daño y cambio de sprite
recibiendo_dano = false;  // Estado inicial
dano_duracion = 0;  // Tiempo restante del cambio de sprite
sprite_index = spr_player_futuristav2;  // Sprite inicial