// Función para disparar una bola de fuego
function bola_de_fuego(entity_type){
    if (shoot_timer <= 0) {
        // Determinar la posición inicial y dirección del disparo según el tipo de entidad
        var shot_x, shot_direction;
        if (entity_type == "obj_player") {
            shot_x = x + 114; // Posición inicial para el jugador
            shot_direction = 0; // Dirección a la derecha
        } else if (entity_type == "obj_enemy") {
            shot_x = x - -9; // Posición inicial para el enemigo
            shot_direction = 180; // Dirección a la izquierda
        } else {
            return; // Si el tipo de entidad no es válido, no hacer nada
        }
        
        // Crear el disparo en la capa "AbovePanels"
        var shot = instance_create_layer(shot_x, y, "AbovePanels", fireball);
        // Establecer la dirección del disparo
        shot.direction = shot_direction;
        shot.entity_type = entity_type; // Guardar el tipo de entidad que dispara
        
        // Reiniciar el temporizador de disparo
        shoot_timer = shoot_cooldown;
    }
}
