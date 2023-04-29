/// @description Insert description here
// You can write your code in this editor


switch(dir){
	case MoveDir.LEFT:
		movement_count += transition_speed;
		x -= transition_speed;
		break;
	case MoveDir.RIGHT:
		movement_count += transition_speed;
		x += transition_speed;
		break;
	case MoveDir.UP:
		movement_count += transition_speed;
		y -= transition_speed;
		break;
	case MoveDir.DOWN:
		movement_count += transition_speed;
		y += transition_speed;
		break;
}		

if(movement_count + transition_speed > room_width){
	dir = MoveDir.NONE;	
	movement_count = 0;		
}

