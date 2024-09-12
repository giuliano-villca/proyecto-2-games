// Configurar la vida de la torreta create event
max_health = 50; // Vida máxima de la ballesta
current_health = max_health; // Vida actual
damage_received = 0; // Daño recibido por la ballesta
// Indicar que esta instancia es una estructura
estructura = true; 

shoot_timer = 2 * room_speed; // Temporizador para disparar flechas cada 2 segundos

// Configurar la escala de la imagen
image_xscale = -3.0;
image_yscale = 3.0;
launch_type = argument0;
// Configurar la orientación de la bola de fuego
if (launch_type == "obj_enemy") {
		sprite_index = spr_torreta_ballesta_izquierdo; // Asignar sprite mirando a la izquierda

}
// Configurar cualquier otra propiedad necesaria