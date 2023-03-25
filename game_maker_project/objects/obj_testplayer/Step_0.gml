

//sprite logic
if (weaponIndex == 0) {
	sprite_index = spr_player_pistol;
} else if (weaponIndex == 1){
	sprite_index = spr_player_rifle
} else {
	sprite_index = spr_player_knife;	
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


// Fire gun
gun.fire_gun(x, y, direction, mb_left);