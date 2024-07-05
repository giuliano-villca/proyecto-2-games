// movimiento del tiro
x += lengthdir_x(speed, direction);
y += lengthdir_y(speed, direction);

// Destruye el tiro si sale fuera de la habitación.
if (x < 0 || x > room_width || y < 0 || y > room_height) {
    instance_destroy();
}