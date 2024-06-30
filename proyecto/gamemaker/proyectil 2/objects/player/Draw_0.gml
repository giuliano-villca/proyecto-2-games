// Draw event of obj_player

// Call the default draw event to draw the player sprite
draw_self();

// Draw the cooldown timer in seconds
var time_left_seconds = max(shoot_timer, 0) / room_speed; // Convert timer to seconds
draw_text(x - 10, y - 20, string(time_left_seconds) + "s");