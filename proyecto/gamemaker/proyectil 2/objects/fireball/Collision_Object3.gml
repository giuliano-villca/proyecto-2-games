// Check for shooting input (spacebar as an example)
if (keyboard_check_pressed(vk_space)) {
    var shot = instance_create_layer(x, y, "Instances", fireball);
    // Set the direction of the shot if needed
    shot.direction = 0; // Right direction
}