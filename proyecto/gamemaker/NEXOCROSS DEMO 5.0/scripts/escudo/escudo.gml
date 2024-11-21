// Los recursos de Script han cambiado para la v2.3.0 Consulta
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para más información
function escudo(entity_type) {
    // Activar el escudo e inmunidad
    var escudo_x;
	var escudo_y;
    var escudo_duracion_frames = 2 * room_speed; // 5 segundos de duración

    if (entity_type == "obj_player") {
        inmunidad = true;
		inmunidad_tiempo = 2 * room_speed;
        obj_player.bloqueo_activo = true;
        obj_player.bloqueo_duracion = escudo_duracion_frames;
        escudo_x = obj_player.x + 45; // Posición inicial para el jugador
        escudo_y = obj_player.y;
        // Crear el escudo y asociarlo con el jugador
    } else if (entity_type == "obj_enemy") {
        inmunidad = true;
		inmunidad_tiempo = 2 * room_speed;
        obj_enemy.bloqueo_activo = true;
        obj_enemy.bloqueo_duracion = escudo_duracion_frames;
		escudo_x = obj_enemy.x;
		escudo_y = obj_enemy.y;
    }
	else {
          return; // Si el tipo de entidad no es válido, no hacer nada
   }
   
	    var bloqueo = instance_create_layer(escudo_x, escudo_y, "AbovePanels", obj_escudo);
        bloqueo.entity_type = entity_type;
}
