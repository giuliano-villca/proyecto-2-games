//event draw obj_list 
//lista del jugador
draw_set_color(c_yellow);
draw_rectangle(lista_combate_x, lista_combate_y, 
lista_combate_x + lista_combate_ancho, 
lista_combate_y + lista_combate_alto, false);

var teclas = ["R", "T", "F", "G"];
var posiciones = [
    {x: lista_combate_x + 10, y: lista_combate_y + 50}, // Primera columna, primera fila
    {x: lista_combate_x + 370, y: lista_combate_y + 50}, // Segunda columna, primera fila
    {x: lista_combate_x + 10, y: lista_combate_y + 110}, // Primera columna, segunda fila
    {x: lista_combate_x + 370, y: lista_combate_y + 110} // Segunda columna, segunda fila
];

var offset = 0; // Valor predeterminado si obj_player no existe
if (instance_exists(obj_player)) {
    offset = obj_player.grupo_habilidades_activo * 4; // Acceder correctamente a la variable en obj_player
    // Cambiar el texto según el grupo activo
    switch (obj_player.grupo_habilidades_activo) {
        case 0:
            grupo_texto = "Equipamiento 1";
			texto_izquierda = "grupo 3 (Y)";
            texto_derecha = "grupo 2 (H)";
            break;
        case 1:
            grupo_texto = "Equipamiento 2";
			texto_izquierda = "grupo 1 (Y)";
            texto_derecha = "grupo 3 (H)";
            break;
        case 2:
            grupo_texto = "Equipamiento 3";
			texto_izquierda = "grupo 2 (Y)";
            texto_derecha = "grupo 1 (H)";
            break;
    }
}

// Dibujar el texto del grupo activo
draw_set_color(c_black);
draw_text(lista_combate_x + 280, lista_combate_y + 15, grupo_texto);
draw_text(lista_combate_x + 10, lista_combate_y + 15, texto_izquierda);
draw_text(lista_combate_x + 560, lista_combate_y + 15, texto_derecha);
// Dibujar el texto "cambia (P)" en la esquina superior
/*
draw_set_color(c_black);
draw_text(lista_combate_x + 600, lista_combate_y + 15, "cambia (P)");
*/

for (var i = 0; i < 4; i++) {
    var habilidad_indice = i + offset;
    if (global.habilidades_seleccionadas[habilidad_indice] != -1) {
        var habilidad_nombre = global.habilidades_seleccionadas[habilidad_indice];
        var tecla = teclas[i];

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

// Dibujar el botón de cambio de grupo
/*
draw_set_color(c_black);
draw_text(lista_combate_x + 210, lista_combate_y + 15, "Cambiar Grupo (P / e-nye)");
*/
/*
//lista del enemigo
draw_set_color(c_green);
draw_rectangle(lista_combate_x_enemy, lista_combate_y_enemy, 
lista_combate_x_enemy + lista_combate_ancho_enemy, 
lista_combate_y_enemy + lista_combate_alto_enemy, false);

var teclas = ["R", "T", "F", "G"];
var posiciones = [
    {x: lista_combate_x_enemy + 10, y: lista_combate_y_enemy + 50}, // Primera columna, primera fila
    {x: lista_combate_x_enemy + 370, y: lista_combate_y_enemy + 50}, // Segunda columna, primera fila
    {x: lista_combate_x_enemy + 10, y: lista_combate_y_enemy + 110}, // Primera columna, segunda fila
    {x: lista_combate_x_enemy + 370, y: lista_combate_y_enemy + 110} // Segunda columna, segunda fila
];

var offset_enemy = 0; // Valor predeterminado si obj_enemy no existe
if (instance_exists(obj_enemy)) {
    offset_enemy = obj_enemy.grupo_habilidades_activo_enemy * 4; // Acceder correctamente a la variable en obj_player
    // Cambiar el texto según el grupo activo
    switch (obj_enemy.grupo_habilidades_activo_enemy) {
        case 0:
            grupo_texto_enemy = "Equipamiento 1";
			texto_izquierda_enemy = "grupo 3 (H)";
            texto_derecha_enemy = "grupo 2 (Y)";
            break;
        case 1:
            grupo_texto_enemy = "Equipamiento 2";
			texto_izquierda_enemy = "grupo 1 (H)";
            texto_derecha_enemy = "grupo 3 (Y)";
            break;
        case 2:
            grupo_texto_enemy = "Equipamiento 3";
			texto_izquierda_enemy = "grupo 2 (Y)";
            texto_derecha_enemy = "grupo 1 (H)";
            break;
    }
}

// Dibujar el texto del grupo activo
draw_set_color(c_black);
draw_text(lista_combate_x_enemy + 300, lista_combate_y_enemy + 15, grupo_texto_enemy);
draw_text(lista_combate_x_enemy + 10, lista_combate_y_enemy + 15, texto_izquierda_enemy);
draw_text(lista_combate_x_enemy + 560, lista_combate_y_enemy + 15, texto_derecha_enemy);


for (var i = 0; i < 4; i++) {
    var habilidad_indice = i + offset_enemy;
    if (global.habilidades_seleccionadas_enemy[habilidad_indice] != -1) {
        var habilidad_nombre = global.habilidades_seleccionadas_enemy[habilidad_indice];
        var tecla = teclas[i];

        var x_pos = posiciones[i].x;
        var y_pos = posiciones[i].y;

        draw_set_color(c_black);
        draw_text(x_pos, y_pos, habilidad_nombre + " (" + tecla + ")");

        // Dibujar el tiempo de cooldown
		var cooldown_enemy = global.habilidad_estado_enemy[? habilidad_nombre];
		if (cooldown_enemy > 0) {
			var tiempo_restante_enemy = string_format((cooldown_enemy / room_speed), 0, 2); // Convertir a segundos
			draw_text(x_pos + 150, y_pos, tiempo_restante_enemy + "s");
		}
    }
}