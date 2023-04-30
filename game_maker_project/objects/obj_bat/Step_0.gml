event_inherited();

if (is_charging) {
	// Charge
	speed = spd;
	
	// Check if we are at the end of the charge
	if (point_distance(charge_x, charge_y, x, y) > charge_dist) {
		// Reset
		is_charging = false;
		alarm[0] = room_speed*random_range(1, 2);
		speed = 0;
	}
} else {
	// Look at player
	if (instance_exists(obj_player)) {
		direction = point_direction(x, y, obj_player.x, obj_player.y);
		image_angle = direction;
	}
}