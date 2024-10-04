
// Inicializar habilidades del jugador
max_habilidades = 12;
equipadas_habilidades = array_create(12, -1); // Inicializar las habilidades equipadas
habilidades_disponibles = ["area_steal", "panel_grab", "bomba", "jardin", "bola de fuego", "sanacion",
"zona volcanica", "temblores", "terremoto", "espada", "espada lunar", "heladera", "invisible",
"escudo", "reparacion", "torreta ballesta", "muro", "tornado", "aro electrico",
"espada infernal"]; // Habilidades disponibles


selected_habilidad = 0;
max_disponibles = array_length(habilidades_disponibles);

x_start = 100;
y_start = 100;
spacing = 64;

equipado_x = 400;
equipado_y = 100;

// Variables de desplazamiento del inventario
scroll_offset = 0;
max_scroll = max_disponibles - 11; // Ajusta según la cantidad de habilidades visibles en pantalla


// Inicializar el array global del jugador
global.habilidades_seleccionadas = array_create(12, -1);

// Inicializar habilidades del enemigo
equipadas_habilidades_enemy = array_create(12, -1); // Inicializar las habilidades equipadas del enemigo
habilidades_disponibles_enemy = ["area_steal", "panel_grab", "heladera", "jardin", "bola de fuego",
"sanacion", "zona volcanica", "temblores", "terremoto", "espada", "espada lunar", "bomba",
"invisible", "escudo", "reparacion", "torreta ballesta", "muro", "tornado", "aro electrico",
"espada infernal"]; // Habilidades disponibles del enemigo

selected_habilidad_enemy = 0;
max_disponibles_enemy = array_length(habilidades_disponibles_enemy);

x_start_enemy = 866;
y_start_enemy = 100;
spacing_enemy = 64;

equipado_x_enemy = 1166;
equipado_y_enemy = 100;

// Variables de desplazamiento del inventario
scroll_offset_enemy = 0;
max_scroll_enemy = max_disponibles_enemy - 11; // Ajusta según la cantidad de habilidades visibles en pantalla


// Inicializar el array global del enemigo
global.habilidades_seleccionadas_enemy = array_create(12, -1);

// Variables para el botón de combate
boton_combate_x = 600;
boton_combate_y = 500;
boton_combate_ancho = 100;
boton_combate_alto = 50;


// Evento Create
fondos_disponibles = ["estadio", "ciudad", "prision", "bosque"]; // Nombres de los fondos 
selected_fondo = 0;
max_fondos = array_length(fondos_disponibles);
global.fondo_seleccionado = fondos_disponibles[selected_fondo]; // Fondo seleccionado por defecto


