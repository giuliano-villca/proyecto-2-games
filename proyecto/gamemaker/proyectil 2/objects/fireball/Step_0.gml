// Move the shot
x += lengthdir_x(speed, direction);
y += lengthdir_y(speed, direction);

// Destroy the shot if it goes outside the room
if (x < 0 || x > room_width || y < 0 || y > room_height) {
    instance_destroy();
}