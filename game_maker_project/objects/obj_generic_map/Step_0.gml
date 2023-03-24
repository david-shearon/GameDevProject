/// @description Insert description here
// You can write your code in this editor

switch(dir){
	case MoveDir.LEFT:
		x -= transition_speed;
		if(move_to == MoveTo.CENTER && x - transition_speed <= room_width / 2){
			move_to = MoveTo.NONE;
			dir = MoveDir.NONE;
		}
		else if(move_to == MoveTo.LEFT && x - transition_speed <= -room_width / 2){ //left
			instance_destroy();
		}
		break;
	case MoveDir.RIGHT:
		x += transition_speed;
		if(move_to == MoveTo.CENTER && x + transition_speed >= room_width / 2){
			move_to = MoveTo.NONE;
			dir = MoveDir.NONE;			
		}
		else if(move_to == MoveTo.RIGHT && x + transition_speed >= 3*room_width / 2){ //right
			instance_destroy();	
		}
		break;
	case MoveDir.UP:
		y -= transition_speed;
		if(move_to == MoveTo.CENTER && y - transition_speed <= room_width / 2){
			move_to = MoveTo.NONE;
			dir = MoveDir.NONE;			
		}
		else if(move_to == MoveTo.UP && y - transition_speed <= -room_width / 2){ //up
			instance_destroy();		
		}
		break;
	case MoveDir.DOWN:
		y += transition_speed;
		if(move_to == MoveTo.CENTER && y + transition_speed >= room_width / 2){
			move_to = MoveTo.NONE;
			dir = MoveDir.NONE;			
		}
		else if(move_to == MoveTo.DOWN && y + transition_speed >= 3*room_width / 2){ //down
			instance_destroy();
		}
		break;
}		
			

