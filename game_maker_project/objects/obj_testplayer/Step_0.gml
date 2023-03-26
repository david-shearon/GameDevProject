
//sprite logic
switch (gun.type) {
	case gun_types.pistol:
		sprite_index = spr_player_pistol;
		break;
	case gun_types.rifle:
		sprite_index = spr_player_rifle;
		break;
	case gun_types.shotgun:
		// TODO: Add shotgun
		sprite_index = spr_player_rifle;
		break;
}

//change weapon logic
if(keyboard_check(ord("1"))){
	weaponIndex = 0;	
	instance_destroy(gun);
}
if(keyboard_check(ord("2"))){
	weaponIndex = 1;
	instance_destroy(gun);
}
if(keyboard_check(ord("3"))){
	weaponIndex = 2;	
	instance_destroy(gun);
}

gun = weapons[weaponIndex]
instance_create_layer(x, y, "GunLayer", gun);

//turn player towards mouse cursor
if (instance_exists(obj_player)) {
	var dir = point_direction(x, y, mouse_x, mouse_y);
	direction = dir;
	image_angle = dir;
		
	//movement script
	player_move()
}

// Calculate end of the guns barrel
var gun_dir = point_direction(0, 0, 108, 15) + direction;
var gun_x = x + lengthdir_x(109, gun_dir);
var gun_y = y + lengthdir_y(109, gun_dir);

// Get direction to shoot
var shoot_dir = point_direction(gun_x, gun_y, mouse_x, mouse_y);

// Fire gun
gun.fire_gun(gun_x, gun_y, shoot_dir, mb_left);