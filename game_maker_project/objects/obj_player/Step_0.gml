if (gun != noone) {
	//sprite logic
	switch (gun.type) {
		case gun_types.pistol:
			sprite_index = spr_player_pistol;
			gun_x = 73;
			break;
		case gun_types.shotgun:
			sprite_index = spr_player_shotgun;
			gun_x = 108;
			break;
		case gun_types.rifle:
			sprite_index = spr_player_rifle;
			gun_x = 108;
			break;
	}
	
	// Check for reload
	if (keyboard_check_pressed(ord("R"))) {
		gun.reload();
	}
	
	// Calculate end of the guns barrel
	var bullet_x = x + lengthdir_x(gun_x, direction);
	var bullet_y = y + lengthdir_y(gun_x, direction);

	// Get direction to shoot
	var shoot_dir = point_direction(x, y, mouse_x, mouse_y);

	// Fire gun
	gun.fire_gun(bullet_x, bullet_y, shoot_dir, mb_left);
}

// Check item pick up
if (keyboard_check_pressed(ord("E"))) {	
	var item = find_object(x, y, pickupRad, obj_item, gun);
	if (item != noone) {
		if (object_is_ancestor(item.object_index, obj_gun)) {
			if (gun != noone) {
				gun.x = x;
				gun.y = y;
				gun.in_inventory = false;
			}
			gun = item;
			gun.in_inventory = true;
		} else {
			item.item_effect(id);
			instance_destroy(item);
		}
	}
}

//turn player towards mouse cursor
if (instance_exists(obj_player)) {
	var dir = point_direction(x, y, mouse_x, mouse_y);
	direction = dir;
	image_angle = dir;
		
	//movement script
	player_move()
}

// Regen health
playerHp = min(maxHp, playerHp + health_regen/room_speed);

// Death Logic
if(playerHp <= 0) {
	room_goto(GameOver)
}

// Send data to shader
var health_percent = playerHp/maxHp;
shader_set_uniform_f(global.shd_health, health_percent);