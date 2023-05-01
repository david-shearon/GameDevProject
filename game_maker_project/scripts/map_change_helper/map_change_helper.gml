// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function map_change_helper(movement_dir){
	switch (movement_dir) {
		case "UP":
			global.curr_tile_y -= 1;
			break;
		case "DOWN":
			global.curr_tile_y += 1;
			break;
		case "LEFT":
			global.curr_tile_x -= 1;
			break;
		case "RIGHT":
			global.curr_tile_x += 1;
			break;
	}
	
	if (global.curr_tile_x == 0 && global.curr_tile_y == 2 && global.difficulty == 1) {
		global.difficulty += 10;
	}
		
	// Check if the new tile has been visitied
	var curr_pos = new vector2(global.curr_tile_x, global.curr_tile_y);
	var isVisited = false;
	for (var i = 0; i < ds_list_size(global.visited_tiles); i++) {
		if (curr_pos.equals(global.visited_tiles[| i])) {
			isVisited = true;
			break;
		}
	}
	var is_boss = global.tile_map[global.curr_tile_x, global.curr_tile_y].tile == tileTypes.ALL_COBBLE;
	
	if (!isVisited) {
		ds_list_add(global.visited_tiles, curr_pos);
		global.difficulty++;
		spawn_items(global.difficulty, movement_dir);
		spawn_enemies(global.difficulty, movement_dir, is_boss);
	}
}