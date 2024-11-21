// Configurar la vida de la torreta create event
max_health = 100; // Vida máxima de la ballesta
current_health = max_health; // Vida actual
damage_received = 0; // Daño recibido por la ballesta
// Indicar que esta instancia es una estructura
estructura = true; 

launch_type = argument0;
// Configurar la orientación de la bola de fuego
if (launch_type == "obj_enemy") {
		sprite_index = spr_muro_izquierda; // Asignar sprite mirando a la izquierda

}