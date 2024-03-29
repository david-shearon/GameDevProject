event_inherited();

// Variable to track the cooldown of the weapon
cld = 0;

// Type of bullet, should match whether the gun is hit scan or projectile based
bullet = obj_testhitscanbullet

// Number of bullets fired in this spray
spray_count = 0;

// Number of bullets in the current magazine
mag_count = mag_size;

// Can be replaced in the future if we want guns to have a max range
max_dist = point_distance(0, 0, room_width, room_height);

type = gun_types.pistol;

in_inventory = false;

gun_snd = snd_rifle;

is_reloading = false;

// Create reload function
function reload() {
	if (mag_count != mag_size) {
		// Initiate reload
		alarm[0] = reload_dur*room_speed;
		mag_count = mag_size;
		is_reloading = true;
	}
}

// Create fire function
function fire_gun(x_start, y_start, shoot_direction, fire_key) {
	// Reset bullet_count if this is a new spray
	if (mouse_check_button_pressed(fire_key)) {
		spray_count = 0;
	}
	
	// Check that the user is firing the gun
	if (isAuto && mouse_check_button(fire_key) || !isAuto && mouse_check_button_pressed(fire_key)) {

		// Check if currently reloading
		if (alarm[0] > 0) {
			//play empty gun noises
			if(!audio_is_playing(snd_empty)){
				audio_play_sound(snd_empty, 5, false);	
			}
			else{
				audio_resume_sound(snd_empty);
			}
			exit;
		}
		
		// Check the cooldown
		if (cld > 0) {
			exit;
		}
	
		// Reset the cooldown
		cld += (60/fire_rate)*room_speed;
	
		repeat (bullet_count) {
			// Create the bullet
			var currBullet = instance_create_layer(x_start, y_start, "BulletLayer", bullet);
	
			// Set the bullets stats
			currBullet.damage = damage;
			currBullet.pierce_count = pierce_count;
			currBullet.pierce_mult = pierce_mult;
	
			// Use accuracy to find direction
			var angleRange = ((1-accuracy)*45)*(min(spray_count/10, 1));
			var bullet_direction = shoot_direction + random_range(-angleRange, angleRange);
			
			if (hit_scan) {
				// Find collisions
				var endX = x_start + lengthdir_x(max_dist, bullet_direction);
				var endY = y_start + lengthdir_y(max_dist, bullet_direction);
				
				var hit_list = ds_list_create();
				var hit_num = collision_line_list(x_start, y_start, endX, endY, obj_target, false, false, hit_list, true);
				
				var endObj = currBullet.perform_collision(hit_list, hit_num);
				
				ds_list_destroy(hit_list);
				
				var endPos;
				if (is_undefined(endObj)) {
					endPos = [endX, endY];
				} else {
					endPos = find_collision(x_start, y_start, bullet_direction, max_dist, endObj);
				}
				
				// Fire the bullet
				currBullet.startX = x_start;
				currBullet.startY = y_start;
				currBullet.endX = endPos[0];
				currBullet.endY = endPos[1];
			} else {
				// Fire the bullet
				currBullet.direction = bullet_direction;
				currBullet.image_angle = bullet_direction;
			}
		
			// Increment spray_count
			spray_count++;
		}
		
		// Decrement mag_count
		mag_count--;
		
		audio_play_sound(gun_snd, 0, 0, 1);
		
		// Check if the mag is empty
		if (mag_count <= 0) {
			reload();
		}
	}
}