/// @description Insert description here
// You can write your code in this editor

enum MoveTo {
	CENTER,
	RIGHT,
	LEFT,
	DOWN,	
	UP,
	NONE
}

enum MoveDir {
	LEFT,
	RIGHT,
	UP,
	DOWN,
	NONE
}

dir = MoveDir.NONE;
move_to = MoveTo.NONE;
transition_speed = 90;

up_avail = false;
down_avail = false;
left_avail = false;
right_avail = false;