/// @description Insert description here
// You can write your code in this editor

event_inherited();

up_avail = false;
down_avail = false;
left_avail = false;
right_avail = false;

enum MoveTo {
	CENTER,
	RIGHT,
	LEFT,
	DOWN,	
	UP,
	NONE
}
move_to = MoveTo.NONE;