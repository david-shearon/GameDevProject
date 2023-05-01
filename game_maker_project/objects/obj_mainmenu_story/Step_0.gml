/// @description Insert description here
// You can write your code in this editor

if(room == MainMenu && keyboard_check_pressed(vk_enter)) {
	//moving to story room
	room_goto(StoryIntro);
}
if(room == StoryIntro && keyboard_check_pressed(vk_enter)) {
	//moving to main game room
	room_goto(MainGame);
}
if(room == GameOver && keyboard_check_pressed(vk_enter)) {
	//restarting the game so the player can try again
	shader_reset();
	game_restart();
}
if(room == Win && keyboard_check_pressed(vk_enter)) {
	//restart the game if the player wants to play again
	shader_reset();
	game_restart();
}