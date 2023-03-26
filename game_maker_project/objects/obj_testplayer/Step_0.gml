//sprite logic
switch (gun.type) {
	case gun_types.pistol:
		sprite_index = spr_player_pistol;
		gun_x = 73;
		gun_y = 24;
		break;
	case gun_types.shotgun:
		// TODO: Add shotgun sprite
	case gun_types.rifle:
		sprite_index = spr_player_rifle;
		gun_x = 108;
		gun_y = 15;
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
var gun_dir = point_direction(0, 0, gun_x, gun_y) + direction;
var gun_length = point_distance(0, 0, gun_x, gun_y)
var bullet_x = x + lengthdir_x(gun_length, gun_dir);
var bullet_y = y + lengthdir_y(gun_length, gun_dir);

// Get direction to shoot
var shoot_dir = point_direction(bullet_x, bullet_y, mouse_x, mouse_y);

// Fire gun
gun.fire_gun(bullet_x, bullet_y, shoot_dir, mb_left);