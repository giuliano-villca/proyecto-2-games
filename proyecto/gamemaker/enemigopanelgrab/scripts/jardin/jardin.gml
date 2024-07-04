function cambiar_paneles_a_pasto() {
    for (var i = 0; i < array_length(global.panels); i++) {
        for (var j = 0; j < array_length(global.panels[i]); j++) {
            global.panels[i][j].tipo = 3; // Cambiar tipo a pasto
        }
    }
}