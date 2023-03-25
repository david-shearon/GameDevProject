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