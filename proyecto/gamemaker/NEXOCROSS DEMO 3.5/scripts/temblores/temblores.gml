// Los recursos de Script han cambiado para la v2.3.0 Consulta
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para más información
function temblores(){
    for (var i = 0; i < array_length(global.panels); i++) {
        for (var j = 0; j < array_length(global.panels[i]); j++) {
            global.panels[i][j].tipo = 5; // Cambiar tipo a agrietado
        }
    }
}