// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function map_generation(){
	global.map_tile_width = 10;
	global.map_tile_height = 6;
	
	//create all tile types
	enum tileTypes{
		MAP_BORDER,
		CLAIMED,
		UNCLAIMED,
		
		UP_LEFT_TURN,
		UP_RIGHT_TURN,
		DOWN_LEFT_TURN,
		DOWN_RIGHT_TURN,
		
		LEFT_RIGHT_STRAIGHT,
		UP_DOWN_STRAIGHT,
		
		UP_T,				//no path down
		LEFT_T,				//no path right
		RIGHT_T,			//no path left
		DOWN_T,				//no path up	
		
		UP_END,				//path on top
		LEFT_END,			//path on left
		RIGHT_END,			//path on right
		DOWN_END,			//path on bottom
		
		FOUR_WAY
	}
	
	//initialize map
	for(var i = -1; i <= global.map_tile_width; i++){
		for(var j = -1; j <= global.map_tile_height; j++){
			if(i == -1 | j == -1 | i == global.map_tile_width | j == global.map_tile_height){
				//So you can't go off the map.
				tile_map[i, j] =
				{
					x_coord: i, //width
					y_coord: j,	//height
					tile: tileTypes.MAP_BORDER
				}	
			} else {
				//unclaimed map types
				tile_map[i, j] =
				{
					x_coord: i, //width
					y_coord: j,	//height
					tile: tileTypes.UNCLAIMED
				}
			}
		}
	}
	
	
	
	start_tile = tile_map[0, 2];
	current_tile = start_tile;
	
	while(current_tile.y_coord != global.map_tile_width - 1){
		//add available options to random list
		option_list = ds_list_create();
		//from_list = ds_list_create();

		if(tile_map[current_tile.x_coord - 1, current_tile.y_coord] == tileTypes.UNCLAIMED){ //left
			ds_list_add(option_list, "LEFT");
		}
		//else if(tile_map[current_tile.x_coord - 1, current_tile.y_coord] == tileTypes.UP_RIGHT_TURN |
		//	tile_map[current_tile.x_coord - 1, current_tile.y_coord] == tileTypes.DOWN_RIGHT_TURN | 
		//	tile_map[current_tile.x_coord - 1, current_tile.y_coord] == tileTypes.CLAIMED | 
		//	tile_map[current_tile.x_coord - 1, current_tile.y_coord] == tileTypes.LEFT_RIGHT_STRAIGHT | 
		//	tile_map[current_tile.x_coord - 1, current_tile.y_coord] == tileTypes.UP_T | 
		//	tile_map[current_tile.x_coord - 1, current_tile.y_coord] == tileTypes.RIGHT_T | 
		//	tile_map[current_tile.x_coord - 1, current_tile.y_coord] == tileTypes.DOWN_T | 
		//	tile_map[current_tile.x_coord - 1, current_tile.y_coord] == tileTypes.FOUR_WAY | 
		//	tile_map[current_tile.x_coord - 1, current_tile.y_coord] == tileTypes.RIGHT_END){
			
		//		ds_list_add(from_dir, "LEFT");
		//}
		
		if(tile_map[current_tile.x_coord + 1, current_tile.y_coord] == tileTypes.UNCLAIMED){ //right
			ds_list_add(option_list, "RIGHT");
		}
		//else if(tile_map[current_tile.x_coord - 1, current_tile.y_coord] == tileTypes.UP_LEFT_TURN |
		//	tile_map[current_tile.x_coord - 1, current_tile.y_coord] == tileTypes.DOWN_LEFT_TURN | 
		//	tile_map[current_tile.x_coord - 1, current_tile.y_coord] == tileTypes.CLAIMED | 
		//	tile_map[current_tile.x_coord - 1, current_tile.y_coord] == tileTypes.LEFT_RIGHT_STRAIGHT | 
		//	tile_map[current_tile.x_coord - 1, current_tile.y_coord] == tileTypes.UP_T | 
		//	tile_map[current_tile.x_coord - 1, current_tile.y_coord] == tileTypes.LEFT_T | 
		//	tile_map[current_tile.x_coord - 1, current_tile.y_coord] == tileTypes.DOWN_T | 
		//	tile_map[current_tile.x_coord - 1, current_tile.y_coord] == tileTypes.FOUR_WAY | 
		//	tile_map[current_tile.x_coord - 1, current_tile.y_coord] == tileTypes.LEFT_END){
			
		//		ds_list_add(from_dir, "RIGHT");
		//}
		
		if(tile_map[current_tile.x_coord, current_tile.y_coord - 1] == tileTypes.UNCLAIMED){ //up
			ds_list_add(option_list, "UP");			
		}
		//else if(tile_map[current_tile.x_coord - 1, current_tile.y_coord] == tileTypes.DOWN_LEFT_TURN |
		//	tile_map[current_tile.x_coord - 1, current_tile.y_coord] == tileTypes.DOWN_RIGHT_TURN | 
		//	tile_map[current_tile.x_coord - 1, current_tile.y_coord] == tileTypes.CLAIMED | 
		//	tile_map[current_tile.x_coord - 1, current_tile.y_coord] == tileTypes.UP_DOWN_STRAIGHT | 
		//	tile_map[current_tile.x_coord - 1, current_tile.y_coord] == tileTypes.DOWN_T | 
		//	tile_map[current_tile.x_coord - 1, current_tile.y_coord] == tileTypes.LEFT_T | 
		//	tile_map[current_tile.x_coord - 1, current_tile.y_coord] == tileTypes.RIGHT_T | 
		//	tile_map[current_tile.x_coord - 1, current_tile.y_coord] == tileTypes.FOUR_WAY | 
		//	tile_map[current_tile.x_coord - 1, current_tile.y_coord] == tileTypes.DOWN_END){
				
		//		ds_list_add(from_dir, "UP");			
		//}
		
		if(tile_map[current_tile.x_coord, current_tile.y_coord + 1] == tileTypes.UNCLAIMED){ //down
			ds_list_add(option_list, "DOWN");			
		} 
		//else if(tile_map[current_tile.x_coord - 1, current_tile.y_coord] == tileTypes.UP_LEFT_TURN |
		//	tile_map[current_tile.x_coord - 1, current_tile.y_coord] == tileTypes.UP_RIGHT_TURN | 
		//	tile_map[current_tile.x_coord - 1, current_tile.y_coord] == tileTypes.CLAIMED | 
		//	tile_map[current_tile.x_coord - 1, current_tile.y_coord] == tileTypes.UP_DOWN_STRAIGHT | 
		//	tile_map[current_tile.x_coord - 1, current_tile.y_coord] == tileTypes.UP_T | 
		//	tile_map[current_tile.x_coord - 1, current_tile.y_coord] == tileTypes.LEFT_T | 
		//	tile_map[current_tile.x_coord - 1, current_tile.y_coord] == tileTypes.RIGHT_T | 
		//	tile_map[current_tile.x_coord - 1, current_tile.y_coord] == tileTypes.FOUR_WAY | 
		//	tile_map[current_tile.x_coord - 1, current_tile.y_coord] == tileTypes.UP_END){
				
		//		ds_list_add(from_dir, "DOWN");			
		//}
		
		
		ds_list_shuffle(option_list);		
		
		for(var i = 0; i < ds_list_size(from_list); i++){
			show_debug_message("FROM: x:" + string(from_list[|i].x_coord) + " y: " + string(from_list[|i].y_coord));
		}
		
		show_debug_message("CURRENT: x:" + string(current_tile.x_coord) + " y: " + string(current_tile.y_coord));
		
		try{	
			next_tile = ds_list_find_value(id, 0);
			show_debug_message("TO: x:" + string(next_tile.x_coord) + " y: " + string(next_tile.y_coord + "\n"));
			current_tile.tile = tileTypes.CLAIMED;
			current_tile = tile_map[next_tile.x_coord, next_tile.y_coord];
		} catch(_exception){
			ds_list_destroy(option_list);
			show_debug_message(_exception.message);
		}
		
		ds_list_destroy(option_list);		
	}
	
}