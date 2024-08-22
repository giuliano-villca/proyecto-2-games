// En el evento Create de obj_sword
sword_damage = 15; // Daño de la espada
panel_height = global.panel_height; // Altura del panel
sword_range = 0; // Rango de un panel adelante
attack_type = argument0; // Tipo de entidad que ataca

launch_type = argument0;
// Configurar la orientación de la bola de fuego
if (launch_type == "obj_player") {
    image_xscale = 2; // Orientar a la derecha
} else if (launch_type == "obj_enemy") {
    image_xscale = 23; // Orientar a la izquierda
}
