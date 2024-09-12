// En el evento Step de fireball
if (direction == 0) {
    x += speed;
} else if (direction == 180) {
    x -= speed;
}

var colision_bloqueo;
var colision_objetivo;

// Detectar si la bola de fuego está en la misma fila que un objetivo
var fireball_row = floor((y - global.grid_offset_y) / global.panel_height);

// Verificar colisión con el escudo primero
if (entity_type == "obj_player") {
    colision_bloqueo = instance_place(x, y, obj_escudo);
    colision_objetivo = instance_place(x, y, obj_enemy);
} else if (entity_type == "obj_enemy") {
    colision_bloqueo = instance_place(x, y, obj_escudo);
    colision_objetivo = instance_place(x, y, obj_player);
}


// Si colisiona con el escudo
if (colision_bloqueo != noone && colision_bloqueo.entity_type != entity_type) {
    // Destruir la bola de fuego al impactar con el escudo
    instance_destroy();
} 


// Detectar colisión con cualquier objeto invocado que tenga la variable 'estructura'
var colision_invocacion = instance_place(x, y, all); 

if (colision_invocacion != noone && variable_instance_exists(colision_invocacion, "estructura")) {
    if (colision_invocacion.entity_type != entity_type) {
        // Aplicar daño a la invocación
        colision_invocacion.damage_received = fireball_damage;
        instance_destroy(); // Destruir la bola de fuego
    }
}


// Si no colisiona con un escudo, verificar colisión con el objetivo
else if (colision_objetivo != noone) {
       // Calcular la fila del objetivo usando su coordenada 'y'
		var objetivo_row = floor((colision_objetivo.y - global.grid_offset_y) / global.panel_height);	
		 // Verificar si el objetivo está en la misma fila que la bola de fuego
 if (objetivo_row == fireball_row) {
			        // Verificar inmunidad y aplicar daño
	if (!colision_objetivo.inmunidad) {
		 var objetivo_col = floor((colision_objetivo.x - global.grid_offset_x) / global.panel_width);
	
        // Obtener el tipo de panel en el que está el objetivo
        var tipo_panel = global.panels[objetivo_row][objetivo_col].tipo;

        // Si el tipo de daño es eléctrico y el objetivo está en un panel de hielo (tipo 3)
        if (damage_type == "fuego" && tipo_panel == 3) {
            // Aplicar el doble de daño
            fireball_damage *= 2;
        }
	    // Si el tipo de daño es fuego y el objetivo está en un panel de pasto (tipo 3)
        if (damage_type == "fuego" && tipo_panel == 3) {
            // Cambiar el panel de pasto a un panel normal (tipo 1)
            global.panels[objetivo_row][objetivo_col].tipo = 1;
        }
		
        // Aplicar daño si no tiene inmunidad
        fila_dano_proyectil(self, colision_objetivo, fireball_damage, 1 * room_speed);
    }
  }
}

// Detectar si la bola de fuego pasa por un panel de pasto (tipo 3)
var fireball_col = floor((x - global.grid_offset_x) / global.panel_width);

// Verificar si las coordenadas están dentro de los límites de la cuadrícula
if (fireball_row >= 0 && fireball_row < array_length(global.panels) &&
    fireball_col >= 0 && fireball_col < array_length(global.panels[0])) {
    
    // Verificar si el panel en el que está la bola de fuego es de tipo pasto (tipo 3)
    if (global.panels[fireball_row][fireball_col].tipo == 3) {
        // Cambiar el panel de pasto a un panel normal (tipo 1)
        global.panels[fireball_row][fireball_col].tipo = 1;
    } 
}

// Destruir la bola de fuego si sale de la pantalla
if (x > room_width || x < 0) {
    instance_destroy();
}