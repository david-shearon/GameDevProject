// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function manage_map_change(){
	player = instance_find(obj_player, 0);
	tile = instance_find(obj_generic_map, 0);
	var movement_dir = "";
	map_change = false;

	if(player.y <= 0 && tile.up_avail){
		player.y = room_height - 30;
		global.curr_tile_y -= 1;	
		map_change = true;
		movement_dir = "UP";	
	}
	else if(player.y > room_height && tile.down_avail){
		player.y = 30;
		global.curr_tile_y += 1;
		map_change = true;
		movement_dir = "DOWN";	
	}
	else if(player.x < 0 && tile.left_avail){
		player.x = room_width - 30;
		global.curr_tile_x -= 1;
		map_change = true;
		movement_dir = "LEFT";	
	}
	else if(player.x > room_width && tile.right_avail){
		player.x = 30;
		global.curr_tile_x += 1;
		map_change = true;
		movement_dir = "RIGHT";	
	}

	if(map_change){
		map_draw_current(global.curr_tile_x, global.curr_tile_y, movement_dir);
		map_change = false;
	}
}