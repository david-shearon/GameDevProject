/// @description Insert description here
// You can write your code in this editor
if(room == MainMenu) {
	draw_set_font(fnt_menu);
	//draw_text(room_width/4, room_height/3, "ЯЭДСТФЯ ZЭЯФ");
	draw_text(room_width/4, room_height/2, "Press Enter To Survive");
}
if(room == StoryIntro) {
	draw_set_font(fnt_story);
	draw_text_ext(room_width/6, 65, story_text, 65, width_text);
	draw_text(room_width/8, room_height - 400, "Move - (WASD) | Sprint - (LShift) | Aim - (Mouse) | Shoot - (Left Click)");
	draw_text(room_width/8, room_height - 300, "                 Swap Weapons (E) | Manual Reload (R)                   ");
	draw_set_font(fnt_menu);
	draw_text(room_width/8, room_height - 200, "      Press Enter To Survive       ");
}
if(room == GameOver) {
	audio_stop_sound(snd_footsteps)
	draw_set_font(fnt_menu);
	draw_set_color(c_white);
	draw_text(room_width - 1375, room_height - 1000, "You Were Never Seen Again");
	draw_text(room_width - 1350, room_height - 850,  "Press Enter To Try Again");
}