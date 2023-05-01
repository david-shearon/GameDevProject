// For testing
draw_set_font(fnt_hud);
draw_set_color(c_white);
draw_text(40, room_height - 70, "Health: " + string(playerHp));
draw_text(450, room_height - 70, "Gun:");
draw_sprite_ext(gun.sprite_index, 0, 750, room_height - 35, gun.grnd_spr_scale*1.5, gun.grnd_spr_scale*1.5, 0, -1, 1);

if (gun.is_reloading) {
	draw_text(900, room_height - 70, "Ammo:   /Inf");
	draw_sprite_ext(spr_reloading, 0, 1125, room_height - 35, .3, .3, degtorad(get_timer()/(room_speed)),-1, 1);
} else {
	draw_text(900, room_height - 70, "Ammo: " + string(gun.mag_count) + "/Inf");
}


draw_text(1360, room_height - 70, "Stamina: " + string(stamina));

//// For testing
//draw_set_font(-1);
//draw_set_color(c_white);
//draw_text(40, 40, "guns: " + string(instance_number(obj_gun)));