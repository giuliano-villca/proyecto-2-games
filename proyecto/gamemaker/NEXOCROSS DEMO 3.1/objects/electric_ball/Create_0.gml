// En el evento Create de obj_electric_ball
electricball_damage = 50;
panel_height = global.panel_height; // Asegúrate de que panel_height esté definido
speed = 6; // Ajusta la velocidad según sea necesario
// Ajustar la escala de la imagen

// velocidad del proyectil
direction = 0; // direccion


launch_type = argument0;
// Configurar la orientación de la bola electrica
if (launch_type == "obj_player") {
    image_xscale = 1; // Orientar a la derecha
} else if (launch_type == "obj_enemy") {
    image_xscale = -1; // Orientar a la izquierda
}
