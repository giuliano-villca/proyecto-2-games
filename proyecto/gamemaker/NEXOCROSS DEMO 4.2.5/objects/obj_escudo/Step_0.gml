// Step Event en obj_escudo
// esto hace que el jugador o enemigo pueda moverse con el escudo puesto
if (entity_type == "obj_player") {
    x = obj_player.x + 45;
    y = obj_player.y;
} else if (entity_type == "obj_enemy") {
    x = obj_enemy.x;
    y = obj_enemy.y;
}