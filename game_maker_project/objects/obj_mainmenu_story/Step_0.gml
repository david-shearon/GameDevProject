/// @description Insert description here
// You can write your code in this editor

if(room == MainMenu && keyboard_check_pressed(vk_enter)) {
	//moving to story room
	room_goto(StoryIntro)
}
if(room == StoryIntro && keyboard_check_pressed(vk_enter)) {
	//moving to main game room
	room_goto(MainGame)
}