// For testing
draw_set_font(fnt_hud);
draw_set_color(c_white);
draw_text(40, room_height - 70, "Health: " + string(playerHp));
draw_text(500, room_height - 70, "Ammo: " + string(gun.mag_count));
draw_text(960, room_height - 70, "Stamina: " + string(stamina));

//// For testing
//draw_set_font(-1);
//draw_set_color(c_white);
//draw_text(40, 40, "Bullets: " + string(instance_number(obj_bullet)));