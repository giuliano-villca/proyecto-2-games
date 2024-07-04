// Step event of obj_player

// Decrease the shoot timer if it's greater than 0
if (shoot_timer > 0) {
    shoot_timer -= 1;
}

// Check for shooting input (Z key as an example) and if the shoot timer is 0
if (keyboard_check_pressed(ord("Z")) && shoot_timer <= 0) {
    // Create the shot
    var shot = instance_create_layer(x, y, "Instances", fireball);
    // Set the direction of the shot if needed
    shot.direction = 0; // Right direction
    
    // Reset the shoot timer
    shoot_timer = shoot_cooldown;
}



// caminar
// Reducir el temporizador de movimiento
if (move_timer > 0) {
    move_timer -= 1;
}

// Verificar entrada del jugador y mover si el temporizador ha llegado a cero
if (move_timer == 0) {
    if (keyboard_check(vk_up) && grid_y > 0) {
        grid_y -= 1;
        move_timer = move_delay;
    }
    if (keyboard_check(vk_down) && grid_y < (room_height div grid_size) - 1) {
        grid_y += 1;
        move_timer = move_delay;
    }
    if (keyboard_check(vk_left) && grid_x > 0) {
        grid_x -= 1;
        move_timer = move_delay;
    }
    if (keyboard_check(vk_right) && grid_x < (room_width div grid_size) - 1) {
        grid_x += 1;
        move_timer = move_delay;
    }
}

// Actualizar la posición en píxeles del jugador
x = grid_x * grid_size;
y = grid_y * grid_size;



//VIDAaaaaaa------------------------------

// Actualizar el estado de inmunidad
if (inmune) {
    inmunidad_tiempo -= 1;
    if (inmunidad_tiempo <= 0) {
        inmune = false;
    }
}

//recuperar vida

if (keyboard_check_pressed(ord("X"))) {
	curar(20);
}