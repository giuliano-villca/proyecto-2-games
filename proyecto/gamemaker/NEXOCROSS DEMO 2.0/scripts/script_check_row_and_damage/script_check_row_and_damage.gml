
function script_check_row_and_damage(){
// script_check_row_and_damage
// Argumentos: 
// argument0: habilidad (objeto que causa daño)
// argument1: objetivo (enemigo)
// argument2: cantidad de daño

var habilidad = argument0;
var objetivo = argument1;
var dano = argument2;

var habilidad_fila = habilidad.y div global.panel_height;
    var objetivo_fila = objetivo.y div global.panel_height;

    // Verificar si están en la misma fila
    if (habilidad_fila == objetivo_fila) {
        // Aplicar daño al objetivo
        with (objetivo) {
            vida -= dano;
        }
        // Destruir la habilidad o realizar otras acciones necesarias
        with (habilidad) {
            instance_destroy();
        }

} 
}