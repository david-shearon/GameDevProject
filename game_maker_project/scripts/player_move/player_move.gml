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

	//determining movement speed & direction
	hsp = movSpd * move;
	vsp = movSpd * vmove;

	//moving player x and y
	x += hsp;
	y += vsp;

	// Make the gun be at the same position and direction as the player
	gun.direction = direction;
	gun.image_angle = direction;
	gun.x = x;
	gun.y = y;
}