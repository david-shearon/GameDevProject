/// @description Insert description here
// You can write your code in this editor

x -= smoke_speed;	
max_alpha = (0.6 * global.curr_tile_x/global.map_tile_width) + 0.2;

if(fadeIn && image_alpha < max_alpha){
	image_alpha += 0.01;	
}

if(image_alpha > max_alpha){
	image_alpha -= 0.01;	
}

if(x <= room_width / 2){
	if(fadeIn == true){
		instance_create_layer(room_width, random(room_height), "SmokeLayer", obj_smoke);
	}
	fadeIn = false;
	image_alpha -= 0.005;
}

if(image_alpha <= 0){
	instance_destroy();	
}