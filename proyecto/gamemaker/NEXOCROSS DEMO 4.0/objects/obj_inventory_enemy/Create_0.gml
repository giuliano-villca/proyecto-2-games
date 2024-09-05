/*
max_habilidades_enemy = 12;
equipadas_habilidades_enemy = array_create(4, -1); // Inicializar las habilidades equipadas del enemigo
habilidades_disponibles_enemy = ["area_steal", "panel_grab", "heladera", "jardin", "bola_de_fuego", "jardin"]; // Habilidades disponibles para el enemigo

selected_habilidad_enemy = 0;
max_disponibles_enemy = array_length(habilidades_disponibles_enemy);

x_start_enemy = 866;
y_start_enemy = 100;
spacing_enemy = 64;

equipado_x_enemy = 1166;
equipado_y_enemy = 100;

// Variables para el botón de combate
boton_combate_x_enemy = 600;
boton_combate_y_enemy = 500;
boton_combate_ancho_enemy = 100;
boton_combate_alto_enemy = 50;

// Inicializar el array global para el enemigo
global.habilidades_seleccionadas_enemy = array_create(4, -1);