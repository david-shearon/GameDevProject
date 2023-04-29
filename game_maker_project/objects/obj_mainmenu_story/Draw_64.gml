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
	draw_text(room_width/8, room_height - 300, "Move - (WASD) | Sprint - (LShift) | Aim - (Mouse) | Shoot - (Left Click)");
	draw_set_font(fnt_menu);
	draw_text(room_width/4, room_height - 200, "Press Enter To Survive");
}
if(room == GameOver) {
	draw_set_font(fnt_menu);
	draw_text(room_width/4, room_height/2, "You Were Never Seen Again");
}