//sprite logic
switch (gun.type) {
	case gun_types.pistol:
		sprite_index = spr_player_pistol;
		gun_x = 73;
		gun_y = 24;
		break;
	case gun_types.shotgun:
		sprite_index = spr_player_shotgun;
		gun_x = 108;
		gun_y = 15;
		break;
	case gun_types.rifle:
		sprite_index = spr_player_rifle;
		gun_x = 108;
		gun_y = 15;
		break;
}

var change_weapon = false;
//change weapon logic
if(keyboard_check(ord("1"))){
	weaponIndex = 0;
	change_weapon = true;
}
if(keyboard_check(ord("2"))){
	weaponIndex = 1;
	change_weapon = true;
}
if(keyboard_check(ord("3"))){
	weaponIndex = 2;	
	change_weapon = true;
}

if (change_weapon) {
	instance_destroy(gun);
	gun = weapons[weaponIndex]
	instance_create_layer(x, y, "GunLayer", gun);
	gun.in_inventory = true;
}

//turn player towards mouse cursor
if (instance_exists(obj_player)) {
	var dir = point_direction(x, y, mouse_x, mouse_y);
	direction = dir;
	image_angle = dir;
		
	//movement script
	player_move()
}

// Fire gun
gun.fire_gun(x, y, direction, mb_left);


////movement script
//player_move()

////sprite logic
//if (weaponIndex == 0) {
//	sprite_index = spr_player_pistol;
//} else if (weaponIndex == 1){
//	sprite_index = spr_player_rifle
//} else {
//	sprite_index = spr_player_knife;	
//}

////change weapon logic
//if(keyboard_check(ord("1"))){
//	weaponIndex = 0;	
//}
//if(keyboard_check(ord("2"))){
//	weaponIndex = 1;
//}
//if(keyboard_check(ord("3"))){
//	weaponIndex = 2;	
//}

//gun = weapons[weaponIndex]

////turn player towards mouse cursor
//if (instance_exists(obj_player)) {
//	var dir = point_direction(x, y, mouse_x, mouse_y);
//	direction = dir;
//	image_angle = dir;
//}

//// Fire gun
//gun.fire_gun(x, y, direction, mb_left);