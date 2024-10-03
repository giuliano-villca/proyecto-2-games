// En el evento Create de obj_aro_electrico
aro_electrico_damage = 10;
damage_type = "electrico";  // Puede ser "fuego", "agua", "planta", etc.
panel_height = global.panel_height; // Asegúrate de que panel_height esté definido
speed = 6; // Ajusta la velocidad según sea necesario
// Ajustar la escala de la imagen

// direccion del proyectil
direction = 0; 


launch_type = argument0;
// Configurar la orientación de aro_electrico
if (launch_type == "obj_player") {
    image_xscale = 1.3; // Orientar a la derecha
	image_yscale = 1.3;
} else if (launch_type == "obj_enemy") {
    image_xscale = -1.3; // Orientar a la derecha
	image_yscale = -1.3;
}
