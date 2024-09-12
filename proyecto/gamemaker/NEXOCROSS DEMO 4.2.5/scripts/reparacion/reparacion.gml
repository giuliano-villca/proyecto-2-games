// Los recursos de Script han cambiado para la v2.3.0 Consulta
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para más información
function reparacion(entity_type){
 if (entity_type == "obj_player") {
        for (var i = 0; i < array_length(global.panels); i++) {
            for (var j = 0; j < array_length(global.panels[i]); j++) {
                if (global.panels[i][j].propietario == 1) { // Verificar que el panel pertenezca al jugador
                    global.panels[i][j].tipo = 1; // Cambiar tipo a normal
                }
            }
        }
    }
    if (entity_type == "obj_enemy") {
        for (var i = 0; i < array_length(global.panels); i++) {
            for (var j = 0; j < array_length(global.panels[i]); j++) {
                if (global.panels[i][j].propietario == 2) { // Verificar que el panel pertenezca al enemigo
                    global.panels[i][j].tipo = 1; // Cambiar tipo a normal
                }
            }
        }
    }
}