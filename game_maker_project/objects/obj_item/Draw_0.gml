// Display the item only if it is on the ground
if (!in_inventory) {
	//Draw boxes around items
	//for(i = -2; i < 2; i++){
	//	draw_rectangle_colour(x-i-grnd_spr_scale*sprite_width/2, y-i-grnd_spr_scale*sprite_height/2, x+i+grnd_spr_scale*sprite_width/2, y+i+grnd_spr_scale*sprite_height/2, c_red, c_red, c_red, c_red, true);
	//}
	draw_sprite_ext(sprite_index, image_index, x, y, grnd_spr_scale, grnd_spr_scale, 0, -1, 1);
}