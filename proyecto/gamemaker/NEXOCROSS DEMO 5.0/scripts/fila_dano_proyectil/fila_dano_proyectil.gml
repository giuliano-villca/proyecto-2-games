
function fila_dano_proyectil(){
// script para proyectiles como bola de fuego, balleta, pistola, etc
// Argumentos: 
// argument0: habilidad (objeto que causa daño)
// argument1: objetivo (enemigo)
// argument2: cantidad de daño
// argument3: duración de la inmunidad


var habilidad = argument0;
var objetivo = argument1;
var dano = argument2;
var inmunidad_duracion = argument3;

// Obtener la fila del objeto que causa el daño
var habilidad_fila = habilidad.y div global.panel_height;

// Obtener la fila del objetivo
var objetivo_fila = objetivo.y div global.panel_height;

// Verificar si están en la misma fila
 if (habilidad_fila == objetivo_fila) {
   // Aplicar daño al objetivo si no está en estado de inmunidad
       with (objetivo) {
          if (!inmunidad && variable_instance_exists(id, "vida")) {
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
    // Destruir la habilidad o realizar otras acciones necesarias
    with (habilidad) {
        instance_destroy();
    }
}
}