// En el evento Create de obj_espada_lunar
sword_damage = 25; // Daño de la espada
panel_height = global.panel_height; // Altura del panel
panel_width = global.panel_width; // Ancho del panel
sword_range = 0; // Rango de un panel adelante
attack_type = argument0; // Tipo de entidad que ataca


launch_type = argument0;
// Configurar la orientación de la espada
if (launch_type == "obj_player") {
    image_xscale = 2;
    image_yscale = 2;
} else if (launch_type == "obj_enemy") {
    image_xscale = 2; // Orientar a la derecha
    image_yscale = 2;
}