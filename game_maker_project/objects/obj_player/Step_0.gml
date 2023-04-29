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

// Check item pick up
if (keyboard_check_pressed(ord("E"))) {	
	var item = find_object(x, y, pickupRad, obj_item, gun);
	if (item != noone) {
		gun.x = x;
		gun.y = y;
		gun.in_inventory = false;
		gun = item;
		gun.in_inventory = true;
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

// Calculate end of the guns barrel
var bullet_x = x + lengthdir_x(gun_x, direction);
var bullet_y = y + lengthdir_y(gun_x, direction);

// Get direction to shoot
var shoot_dir = point_direction(x, y, mouse_x, mouse_y);

// Fire gun
gun.fire_gun(bullet_x, bullet_y, shoot_dir, mb_left);

// Death Logic
if(playerHp <= 0) {
	room_goto(GameOver)
}