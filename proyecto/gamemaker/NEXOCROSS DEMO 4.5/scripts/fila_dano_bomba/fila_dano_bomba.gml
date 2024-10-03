// Función para aplicar daño en el panel de la bomba
function fila_dano_bomba() {
	
	//creo que esta funcion ya no sirve
   var habilidad = argument0;
    var dano = argument1;
    var inmunidad_duracion = argument2;
    var rango_filas = argument3;
    var rango_columnas = argument4;	
	
    // Obtener la posición de la explosión
    var explosion_fila = y div global.panel_height;
    var explosion_columna = x div global.panel_width;

    // Obtener el objeto que está en ese panel
    var objetivo = instance_position(
        explosion_columna * global.panel_width + global.grid_offset_x,
        explosion_fila * global.panel_height + global.grid_offset_y,
        all
    );

    // Mostrar mensaje de depuración para verificar qué se ha detectado
    if (objetivo != noone) {
        show_debug_message("Objetivo detectado: " + string(objetivo));
    } else {
        show_debug_message("No se detectó ningún objetivo en el panel.");
    }

    // Si hay un objetivo en ese panel y no está en estado de inmunidad
    if (objetivo != noone && !objetivo.inmunidad) {
        with (objetivo) {
            if (variable_instance_exists(id, "vida")) {
                show_debug_message("Aplicando " + string(dano) + " de daño a " + string(id));
                vida -= dano;
                inmunidad = true;
                inmunidad_tiempo = inmunidad_duracion;
            } else {
                show_debug_message("Objetivo detectado no tiene variable 'vida'.");
            }
        }
    }
}