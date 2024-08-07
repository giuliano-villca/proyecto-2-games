//event draw obj_list
draw_set_color(c_yellow);
draw_rectangle(lista_combate_x, lista_combate_y, 
lista_combate_x + lista_combate_ancho, 
lista_combate_y + lista_combate_alto, false);

// Dibujar las habilidades seleccionadas en el orden especificado
var teclas = ["U", "I", "O", "P"];
var posiciones = [
    {x: lista_combate_x + 10, y: lista_combate_y + 40},          // Primera columna, primera fila
    {x: lista_combate_x + 370, y: lista_combate_y + 40},         // Segunda columna, primera fila
    {x: lista_combate_x + 10, y: lista_combate_y + 100},          // Primera columna, segunda fila
    {x: lista_combate_x + 370, y: lista_combate_y + 100}          // Segunda columna, segunda fila
];

for (var i = 0; i < 4; i++) {
    if (global.habilidades_seleccionadas[i] != -1) {
        var habilidad_nombre = global.habilidades_seleccionadas[i];
        var tecla = teclas[i];

        // Calcular la posición de dibujo
        var x_pos = posiciones[i].x;
        var y_pos = posiciones[i].y;
		draw_set_color(c_black);
        draw_text(x_pos, y_pos, habilidad_nombre + " (" + tecla + ")");
		
 // Dibujar el tiempo de cooldown
        var cooldown = global.habilidad_estado[? habilidad_nombre];
        if (cooldown > 0) {
            var tiempo_restante = string_format((cooldown / room_speed), 0, 2); // Convertir a segundos
            draw_text(x_pos + 150, y_pos, tiempo_restante + "s");
        }
    }
}