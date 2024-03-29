// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function player_move(){
	//movement keys W,A,S,D
	var keyleft = keyboard_check(ord("A"));
	var keyright = keyboard_check(ord("D"));
	var keyup = keyboard_check(ord("W"));
	var keydown = keyboard_check(ord("S"));
	
	//move logic
	var move = keyright - keyleft;
	var vmove = keydown - keyup;
	var movedir = point_direction(0, 0, move, vmove);
	var spd = 0;

	//determining movement speed & direction
	//also checking if the user is sprinting
	if(keyboard_check(vk_shift) && sprintCD == false){
		spd = sprintSpd;
		stamina -= 2;
		audio_resume_sound(snd_footsteps);
		audio_sound_pitch(snd_footsteps, 1.8)
		
	} else {
		audio_sound_pitch(snd_footsteps, 1.3)
		spd = movSpd;
	}
	
	if (move == 0 && vmove == 0) {
		spd = 0;
	}

	//moving player x and y
	x += lengthdir_x(spd, movedir);
	y += lengthdir_y(spd, movedir);
	
	if(spd != 0){
		if(!audio_is_playing(snd_footsteps)){
			audio_play_sound(snd_footsteps, 1, true, 0.5);	
		}
		else{
		audio_resume_sound(snd_footsteps);
		}
	}
	else{
		audio_pause_sound(snd_footsteps);	
	}
	
	// Check to display walking animation
	if (move != 0 || vmove != 0) {
		image_speed = 1;
	} else {
		image_speed = 0;
	}
	
	sprint_logic()
}