// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function manage_map_change(){
	player = instance_find(obj_player, 0);
	tile = instance_find(obj_generic_map, 0);
	var movement_dir = "";
	map_change = false;

	if(player.y <= -10 && tile.up_avail){
		//player.y = room_height - 30;
		global.curr_tile_y -= 1;	
		map_change = true;
		movement_dir = "UP";
		
		// Check if the new tile has been visitied
		var curr_pos = new vector2(global.curr_tile_x, global.curr_tile_y);
		var isVisited = false;
		for (var i = 0; i < ds_list_size(global.visited_tiles); i++) {
			if (curr_pos.equals(global.visited_tiles[| i])) {
				isVisited = true;
				break;
			}
		}
		
		if (!isVisited) {
			ds_list_add(global.visited_tiles, curr_pos);
			spawn_items(1);
		}
	}
	else if(player.y > room_height + 10 && tile.down_avail){
		//player.y = 30;
		global.curr_tile_y += 1;
		map_change = true;
		movement_dir = "DOWN";	
		
		// Check if the new tile has been visitied
		var curr_pos = new vector2(global.curr_tile_x, global.curr_tile_y);
		var isVisited = false;
		for (var i = 0; i < ds_list_size(global.visited_tiles); i++) {
			if (curr_pos.equals(global.visited_tiles[| i])) {
				isVisited = true;
				break;
			}
		}
		
		if (!isVisited) {
			ds_list_add(global.visited_tiles, curr_pos);
			spawn_items(1);
		}
	}
	else if(player.x < -10 && tile.left_avail){
		//player.x = room_width - 30;
		global.curr_tile_x -= 1;
		map_change = true;
		movement_dir = "LEFT";
		
		// Check if the new tile has been visitied
		var curr_pos = new vector2(global.curr_tile_x, global.curr_tile_y);
		var isVisited = false;
		for (var i = 0; i < ds_list_size(global.visited_tiles); i++) {
			if (curr_pos.equals(global.visited_tiles[| i])) {
				isVisited = true;
				break;
			}
		}
		
		if (!isVisited) {
			ds_list_add(global.visited_tiles, curr_pos);
			spawn_items(1);
		}
	}
	else if(player.x > room_width + 10 && tile.right_avail){
		//player.x = 30;
		global.curr_tile_x += 1;
		map_change = true;
		movement_dir = "RIGHT";
		
		// Check if the new tile has been visitied
		var curr_pos = new vector2(global.curr_tile_x, global.curr_tile_y);
		var isVisited = false;
		for (var i = 0; i < ds_list_size(global.visited_tiles); i++) {
			if (curr_pos.equals(global.visited_tiles[| i])) {
				isVisited = true;
				break;
			}
		}
		
		if (!isVisited) {
			ds_list_add(global.visited_tiles, curr_pos);
			spawn_items(1);
		}
	}

	if(map_change){
		map_draw_current(global.curr_tile_x, global.curr_tile_y, movement_dir);
		map_change = false;
	}
	
}