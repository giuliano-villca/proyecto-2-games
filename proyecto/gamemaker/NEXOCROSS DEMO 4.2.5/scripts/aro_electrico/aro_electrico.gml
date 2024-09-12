// Los recursos de Script han cambiado para la v2.3.0 Consulta
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para más información
function aro_electrico(entity_type){
        var shot_x, shot_direction;
        if (entity_type == "obj_player") {
            shot_x = x + 104; // Posición inicial para el jugador
            shot_direction = 0; // Dirección a la derecha
        } else if (entity_type == "obj_enemy") {
            shot_x = x - -9; // Posición inicial para el enemigo
            shot_direction = 180; // Dirección a la izquierda
        } else {
            return; // Si el tipo de entidad no es válido, no hacer nada
        }
        
        // Crear el disparo en la capa "AbovePanels"
        var shot = instance_create_layer(shot_x, y+20, "AbovePanels", obj_aro_electrico);
        // Establecer la dirección del disparo
        shot.direction = shot_direction;
        shot.entity_type = entity_type; // Guardar el tipo de entidad que dispara
}