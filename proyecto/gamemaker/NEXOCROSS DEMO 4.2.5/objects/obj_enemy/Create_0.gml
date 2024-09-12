// Create Event
entity_type = "obj_enemy";
enemy_row = 1;
enemy_col = 4;
x = global.grid_offset_x + (enemy_col * global.panel_width);
y = global.grid_offset_y + (enemy_row * global.panel_height);

// Inicializar las posiciones anteriores
previous_col = -1;
previous_row = -1;

panel_width = 104;  // Ancho de cada panel
panel_height = 68; // Alto de cada panel

grid_x = floor(x / panel_width); // La posición x del enemigo en la cuadrícula
grid_y = floor(y / panel_height); // La posición y del enemigo en la cuadrícula

grupo_habilidades_activo_enemy = 0; // Inicializar para mostrar las primeras 4 habilidades

if (global.habilidades_seleccionadas_enemy == undefined) {
    global.habilidades_seleccionadas_enemy = array_create(4, -1); // Inicializar array de habilidades seleccionadas si no está definido
}

// Inicializar el estado de cooldown para cada habilidad
global.habilidad_estado_enemy = ds_map_create();
for (var i = 0; i < array_length(global.habilidades_seleccionadas_enemy); i++) {
    if (global.habilidades_seleccionadas_enemy[i] != -1) {
        var habilidad = global.habilidades_seleccionadas_enemy[i];
        global.habilidad_estado_enemy[? habilidad] = 0; // 0 indica que la habilidad está lista para usarse
    }
}

//estados del jugador 
estado_actual = "normal";
estado_duracion = 0;
//lista de estado
estado_normal = "normal";
estado_paralizado = "paralizado";
estado_congelado = "congelado";


vida = 200; // Vida inicial del personaje
vidamaxima = 200;// vida maxima del personaje

// Variables de inmunidad
inmunidad = false;
inmunidad_tiempo = 0;
bloqueo_activo = false;

// obj_player tiempo para disparar
//(posdata: para hacer el codigo el general del enemigo, es copiar y pegar del codigo del jugador ya que son lo mismo, solo cambiando con un enemy o cambiando un valor que encaje con la posicion del enemigo la posicion)
shoot_timer = 0;
shoot_cooldown = 30; // Set the cooldown period (e.g., 30 steps)

