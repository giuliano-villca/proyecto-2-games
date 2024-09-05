// Código de destrucción de la torreta
if (damage_received > 0) {
    current_health -= damage_received;
    damage_received = 0; // Reiniciar el daño recibido

    // Verificar si la ballesta ha sido destruida
    if (current_health <= 0) {
        // Marcar el panel como libre de estructuras antes de destruir la torreta
        if (instance_exists(self)) {
            var col = start_col; // Usar las coordenadas guardadas
            var row = start_row;

            if (row >= 0 && row < array_length(global.panels) &&
                col >= 0 && col < array_length(global.panels[0])) {
                global.panels[row][col].estructura = false;
                show_debug_message("Panel at (" + string(col) + ", " + string(row) + ") updated to free.");
            }
        }

        instance_destroy(); // Destruir la ballesta si su vida llega a 0
    }
}