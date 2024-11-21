// Configuración inicial de la explosión
tornado_damage = 20; // Daño de la explosión
explosion_radius = global.panel_width / 2; // Radio de la explosión (un panel)
damage_applied = false;
damage_type = "";
animation_duration = 2 * room_speed; // 2 segundos
animation_timer = 0; // Contador para controlar el tiempo del tornado

// ajustar la velocidad de la animación
image_speed = 1.5; // ajustar el valor de la velocidad de la animación
    image_xscale = 2.3; // Orientar a la derecha
	image_yscale = 2.3;