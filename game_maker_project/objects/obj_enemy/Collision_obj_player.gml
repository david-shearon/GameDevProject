/// @description Insert description here
// You can write your code in this editor
/// @description Insert description here
// You can write your code in this editor
if (alarm[1] < 0) {
	audio_play_sound(snd_damage, 0, false);
	other.playerHp -= atk*(1-other.armor);
	alarm[1] = cld*room_speed;
};