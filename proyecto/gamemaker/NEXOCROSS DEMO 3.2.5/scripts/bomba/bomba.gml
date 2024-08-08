// Los recursos de Script han cambiado para la v2.3.0 Consulta
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para más información
function bomba(entity_type){
var bomb_x, bomb_direction;
    if (entity_type == "obj_player") {
        bomb_x = x + global.panel_width; // Posición inicial para el jugador
        bomb_direction = 0; // Dirección a la derecha
    } else if (entity_type == "obj_enemy") {
        bomb_x = x - global.panel_width; // Posición inicial para el enemigo
        bomb_direction = 180; // Dirección a la izquierda
    } else {
        return; // Si el tipo de entidad no es válido, no hacer nada
    }

    // Crear la bomba en la capa "AbovePanels"
    var bomb = instance_create_layer(bomb_x, y, "AbovePanels", obj_bomba);
    // Establecer el tipo de entidad que usa la bomba
    bomb.attack_type = entity_type;
}