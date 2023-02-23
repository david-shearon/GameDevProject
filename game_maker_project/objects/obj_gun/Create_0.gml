// Variable to track the cooldown of the weapon
cld = (60/fire_rate)*room_speed;

// Type of bullet
bullet = obj_testbullet

// Number of bullets fired in this spray
bullet_count = 0;

// Create fire function
function fire_gun(x_start, y_start, shoot_direction, fire_key) {
	// Reset bullet_count if this is a new spray
	if (mouse_check_button_pressed(fire_key)) {
		bullet_count = 0;
	}
	
	// Check that the user is firing the gun
	if (isAuto && mouse_check_button(fire_key) || !isAuto && mouse_check_button_pressed(fire_key)) {
		// Check the cooldown
		if (cld > 0) {
			exit;
		}
	
		// Reset the cooldown
		cld += (60/fire_rate)*room_speed;
	
		// Create the bullet
		var currBullet = instance_create_layer(x_start, y_start, "BulletLayer", bullet);
	
		// TODO: Set the bullets stats
	
		// Use accuracy to find direction
		var angleRange = ((1-accuracy/100)*45)*(min(bullet_count/10, 1));
		shoot_direction = shoot_direction + random_range(-angleRange, angleRange);
	
		// Fire the bullet
		currBullet.direction = shoot_direction;
		currBullet.image_angle = shoot_direction;
		
		// Increment bullet_count
		bullet_count++;
	}
}