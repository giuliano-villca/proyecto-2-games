// Los recursos de Script han cambiado para la v2.3.0 Consulta
//esta habilidad se llamaba antes africa
function zona_volcanica(){
    for (var i = 0; i < array_length(global.panels); i++) {
        for (var j = 0; j < array_length(global.panels[i]); j++) {
            global.panels[i][j].tipo = 4; // Cambiar tipo a lava
        }
    }
}