var text_x = x + 25;
var text_y = y - sprite_height / 6 + 85; // Ajusta el desplazamiento vertical si es necesario
//------------------------------   Y

draw_set_color(c_white); // Establecer el color en negro para el texto

draw_text(text_x, text_y, string(current_health) + " / " + string(max_health));