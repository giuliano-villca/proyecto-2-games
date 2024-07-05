function heladera(){
    for (var i = 0; i < array_length(global.panels); i++) {
        for (var j = 0; j < array_length(global.panels[i]); j++) {
            global.panels[i][j].tipo = 2; // Cambiar tipo a pasto
        }
    }
}