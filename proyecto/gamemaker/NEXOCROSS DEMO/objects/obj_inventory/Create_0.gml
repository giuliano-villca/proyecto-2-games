// Evento Create de obj_inventory
max_habilidades = 12;
equipadas_habilidades = array_create(4, -1); // Inicializar las habilidades equipadas
habilidades_disponibles = ["area_steal", "panel_grab", "heladera", "jardin", "bola_de_fuego", "jardin"]; // Habilidades disponibles

selected_habilidad = 0;
max_disponibles = array_length(habilidades_disponibles);

x_start = 100;
y_start = 100;
spacing = 64;

equipado_x = 400;
equipado_y = 100;

// Variables para el botón de combate
boton_combate_x = 500;
boton_combate_y = 500;
boton_combate_ancho = 100;
boton_combate_alto = 50;

// Inicializar el array global
global.habilidades_seleccionadas = array_create(4, -1);
