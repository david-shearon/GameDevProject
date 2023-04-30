// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function manage_map_change(){
	player = instance_find(obj_player, 0);
	tile = instance_find(obj_generic_map, 0);
	var movement_dir = "";
	map_change = false;

	if(player.y <= -10 && tile.up_avail){
		//player.y = room_height - 30;	
		map_change = true;
		movement_dir = "UP";
		
		map_change_helper(movement_dir);
	}
	else if(player.y > room_height + 10 && tile.down_avail){
		//player.y = 30;
		map_change = true;
		movement_dir = "DOWN";	
		
		map_change_helper(movement_dir);
	}
	else if(player.x < -10 && tile.left_avail){
		//player.x = room_width - 30;
		map_change = true;
		movement_dir = "LEFT";
		
		map_change_helper(movement_dir);
	}
	else if(player.x > room_width + 10 && tile.right_avail){
		//player.x = 30;
		map_change = true;
		movement_dir = "RIGHT";
		
		map_change_helper(movement_dir);
	}

	if(map_change){
		map_draw_current(global.curr_tile_x, global.curr_tile_y, movement_dir);
		map_change = false;
	}
	
}