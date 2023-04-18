// Display the item only if it is on the ground
if (!in_inventory) {
	draw_sprite_ext(sprite_index, image_index, x, y, grnd_spr_scale, grnd_spr_scale, 0, -1, 1);
}