// Inicializar habilidades del jugador
max_habilidades = 12;
equipadas_habilidades = array_create(4, -1); // Inicializar las habilidades equipadas
habilidades_disponibles = ["area_steal", "panel_grab", "heladera", "jardin", "bola_de_fuego", "sanacion"]; // Habilidades disponibles

selected_habilidad = 0;
max_disponibles = array_length(habilidades_disponibles);

x_start = 100;
y_start = 100;
spacing = 64;

equipado_x = 400;
equipado_y = 100;

// Inicializar el array global del jugador
global.habilidades_seleccionadas = array_create(4, -1);

// Inicializar habilidades del enemigo
equipadas_habilidades_enemy = array_create(4, -1); // Inicializar las habilidades equipadas del enemigo
habilidades_disponibles_enemy = ["area_steal", "panel_grab", "heladera", "jardin", "bola_de_fuego", "sanacion"]; // Habilidades disponibles del enemigo

selected_habilidad_enemy = 0;
max_disponibles_enemy = array_length(habilidades_disponibles_enemy);

x_start_enemy = 866;
y_start_enemy = 100;
spacing_enemy = 64;

equipado_x_enemy = 1166;
equipado_y_enemy = 100;

// Inicializar el array global del enemigo
global.habilidades_seleccionadas_enemy = array_create(4, -1);

// Variables para el botón de combate
boton_combate_x = 600;
boton_combate_y = 500;
boton_combate_ancho = 100;
boton_combate_alto = 50;
