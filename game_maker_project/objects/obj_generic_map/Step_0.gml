/// @description Insert description here
// You can write your code in this editor

event_inherited();

player = instance_find(obj_player, 0);
switch(dir){
	case MoveDir.LEFT:
		player.x -= transition_speed / 2;
		break;
	case MoveDir.RIGHT:
		player.x += transition_speed / 2;
		break;
	case MoveDir.UP:
		player.y -= transition_speed / 2;
		break;
	case MoveDir.DOWN:
		player.y += transition_speed / 2;
		break;	
	default:
		if(move_to != MoveTo.CENTER){
			instance_destroy();	
		}
}	


	