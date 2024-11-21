function fila_dano_melee(){ // tambien funcion con bombas
// Script para espada, melee y rangos específicos
// Argumentos: 
// argument0: habilidad (objeto que causa daño)
// argument1: objetivo (enemigo)
// argument2: cantidad de daño
// argument3: duración de la inmunidad
// argument4: rango de filas (número de filas que cubre la espada)
// argument5: rango de columnas (número de columnas que cubre la espada)

var habilidad = argument0;
var objetivo = argument1;
var dano = argument2;
var inmunidad_duracion = argument3;
var rango_filas = argument4;
var rango_columnas = argument5;

var habilidad_fila = habilidad.y div global.panel_height;
var habilidad_columna = habilidad.x div global.panel_width;

// Obtener la posición del objetivo
var objetivo_fila = objetivo.y div global.panel_height;
var objetivo_columna = objetivo.x div global.panel_width;

// Verificar si el objetivo está dentro del rango de filas y columnas
if (abs(habilidad_fila - objetivo_fila) < rango_filas && abs(habilidad_columna - objetivo_columna) <= rango_columnas) {
    // Aplicar daño al objetivo si no está en estado de inmunidad
    with (objetivo) {
        if (!inmunidad && variable_instance_exists(id, "vida")) {
                        if (vida - dano <= 0) {
                if (id == obj_player) {
                    global.victoria_enemigo = true;
                    global.room_siguiente = "room_enemigo_gano";
                    global.tecla_activadora = ord("I");
                } else if (id == obj_enemy) {
                    global.victoria_jugador = true;
                    global.room_siguiente = "room_jugador_gano";
                    global.tecla_activadora = ord("R");
                }
            }
			                // Cambiar el estado si el daño es eléctrico
           if (habilidad.damage_type == "electrico") {
                    estado_actual = estado_paralizado;
                    estado_duracion = room_speed * 2; // 2 segundos de parálisis
                    sprite_index = spr_player_futurista_paralizado; // Forzar sprite paralizado
           } else {
                    // Para otros tipos de daño
                    recibiendo_dano = true;
                    dano_duracion = 0.5 * room_speed; // Duración del daño
           }
			
			vida -= dano;
            inmunidad = true;
            inmunidad_tiempo = inmunidad_duracion;
        }
    }
} 
}