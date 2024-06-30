// Evento Draw de obj_control
draw_self(); // Dibuja el objeto normalmente si tiene una sprite

// Ajustar la posición y formato del texto
var start_x = 700; // Posición X inicial
var start_y = 600; // Posición Y inicial, debajo del escenario
var spacing = 20; // Espacio entre cada habilidad
var rect_padding = 5; // Espacio de relleno alrededor del texto
var rect_width = 200; // Ancho del rectángulo de fondo
var rect_height = spacing * array_length(global.habilidades) + rect_padding * 2; // Altura del rectángulo de fondo

// Dibujar el rectángulo de fondo con color
draw_set_color(c_gray); // Color del fondo
draw_rectangle(start_x - rect_padding, start_y - rect_padding, start_x + rect_width, start_y + rect_height, false);


// Dibujar cada habilidad en la lista con su color
for (var i = 0; i < array_length(global.habilidades); i++) {
    var habilidad = global.habilidades[i];
    draw_set_color(habilidad.color);
    draw_text(start_x, start_y + i * spacing, habilidad.name);
}

// Restablecer el color a blanco para otros dibujos
draw_set_color(c_white);