// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function map_generation(){
	randomize();
	
	global.map_tile_width = 10;
	global.map_tile_height = 6;
	
	//create all tile types
	enum tileTypes{
		UNCLAIMED,
		MAP_BORDER,
		CLAIMED,
		
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
	for(var i = 0; i <= global.map_tile_width + 1; i++){
		for(var j = 0; j <= global.map_tile_height + 1; j++){
			if(i == 0 || j == 0 || i == global.map_tile_width + 1 || j == global.map_tile_height + 1){
				//So you can't go off the map.
				global.tile_map[i, j] =
				{
					x_coord: i, //width
					y_coord: j,	//height
					tile: tileTypes.MAP_BORDER
				}	
			} else {
				//unclaimed map types
				global.tile_map[i, j] =
				{
					x_coord: i, //width
					y_coord: j,	//height
					tile: tileTypes.UNCLAIMED
				}
			}
		}
	}
	
	current_tile = global.tile_map[1, 3];
	show_debug_message("FIRST: x:" + string(current_tile.x_coord) + " y: " + string(current_tile.y_coord));
	
	while(current_tile.x_coord != global.map_tile_width){
		//add available options to random list
		option_list = ds_list_create();
		from_list = ds_list_create();
		
		
		if(global.tile_map[current_tile.x_coord - 1, current_tile.y_coord].tile == tileTypes.UNCLAIMED){ //left
			ds_list_add(option_list, "LEFT");
			//show_debug_message("TO LEFT");
		}
		else if(global.tile_map[current_tile.x_coord - 1, current_tile.y_coord].tile == tileTypes.UP_RIGHT_TURN ||
			global.tile_map[current_tile.x_coord - 1, current_tile.y_coord].tile == tileTypes.DOWN_RIGHT_TURN || 
			global.tile_map[current_tile.x_coord - 1, current_tile.y_coord].tile == tileTypes.CLAIMED || 
			global.tile_map[current_tile.x_coord - 1, current_tile.y_coord].tile == tileTypes.LEFT_RIGHT_STRAIGHT || 
			global.tile_map[current_tile.x_coord - 1, current_tile.y_coord].tile == tileTypes.UP_T || 
			global.tile_map[current_tile.x_coord - 1, current_tile.y_coord].tile == tileTypes.RIGHT_T || 
			global.tile_map[current_tile.x_coord - 1, current_tile.y_coord].tile == tileTypes.DOWN_T || 
			global.tile_map[current_tile.x_coord - 1, current_tile.y_coord].tile == tileTypes.FOUR_WAY || 
			global.tile_map[current_tile.x_coord - 1, current_tile.y_coord].tile == tileTypes.RIGHT_END){
			
				ds_list_add(from_list, "LEFT");
		}
		
		if(global.tile_map[current_tile.x_coord + 1, current_tile.y_coord].tile == tileTypes.UNCLAIMED){ //right
			ds_list_add(option_list, "RIGHT");
			//show_debug_message("TO RIGHT");
		}
		else if(global.tile_map[current_tile.x_coord + 1, current_tile.y_coord].tile == tileTypes.UP_LEFT_TURN ||
			global.tile_map[current_tile.x_coord + 1, current_tile.y_coord].tile == tileTypes.DOWN_LEFT_TURN || 
			global.tile_map[current_tile.x_coord + 1, current_tile.y_coord].tile == tileTypes.CLAIMED || 
			global.tile_map[current_tile.x_coord + 1, current_tile.y_coord].tile == tileTypes.LEFT_RIGHT_STRAIGHT || 
			global.tile_map[current_tile.x_coord + 1, current_tile.y_coord].tile == tileTypes.UP_T || 
			global.tile_map[current_tile.x_coord + 1, current_tile.y_coord].tile == tileTypes.LEFT_T || 
			global.tile_map[current_tile.x_coord + 1, current_tile.y_coord].tile == tileTypes.DOWN_T || 
			global.tile_map[current_tile.x_coord + 1, current_tile.y_coord].tile == tileTypes.FOUR_WAY || 
			global.tile_map[current_tile.x_coord + 1, current_tile.y_coord].tile == tileTypes.LEFT_END){
			
				ds_list_add(from_list, "RIGHT");
		}
		
		if(global.tile_map[current_tile.x_coord, current_tile.y_coord - 1].tile == tileTypes.UNCLAIMED){ //up
			ds_list_add(option_list, "UP");		
			//show_debug_message("TO UP");	
		}
		else if(global.tile_map[current_tile.x_coord, current_tile.y_coord - 1].tile == tileTypes.DOWN_LEFT_TURN ||
			global.tile_map[current_tile.x_coord, current_tile.y_coord - 1].tile == tileTypes.DOWN_RIGHT_TURN || 
			global.tile_map[current_tile.x_coord, current_tile.y_coord - 1].tile == tileTypes.CLAIMED || 
			global.tile_map[current_tile.x_coord, current_tile.y_coord - 1].tile == tileTypes.UP_DOWN_STRAIGHT || 
			global.tile_map[current_tile.x_coord, current_tile.y_coord - 1].tile == tileTypes.DOWN_T || 
			global.tile_map[current_tile.x_coord, current_tile.y_coord - 1].tile == tileTypes.LEFT_T || 
			global.tile_map[current_tile.x_coord, current_tile.y_coord - 1].tile == tileTypes.RIGHT_T || 
			global.tile_map[current_tile.x_coord, current_tile.y_coord - 1].tile == tileTypes.FOUR_WAY || 
			global.tile_map[current_tile.x_coord, current_tile.y_coord - 1].tile == tileTypes.DOWN_END){
				
				ds_list_add(from_list, "UP");			
		}
		
		if(global.tile_map[current_tile.x_coord, current_tile.y_coord + 1].tile == tileTypes.UNCLAIMED){ //down
			ds_list_add(option_list, "DOWN");
			//show_debug_message("TO DOWN");			
		} 
		else if(global.tile_map[current_tile.x_coord, current_tile.y_coord + 1].tile == tileTypes.UP_LEFT_TURN ||
			global.tile_map[current_tile.x_coord, current_tile.y_coord + 1].tile == tileTypes.UP_RIGHT_TURN || 
			global.tile_map[current_tile.x_coord, current_tile.y_coord + 1].tile == tileTypes.CLAIMED || 
			global.tile_map[current_tile.x_coord, current_tile.y_coord + 1].tile == tileTypes.UP_DOWN_STRAIGHT || 
			global.tile_map[current_tile.x_coord, current_tile.y_coord + 1].tile == tileTypes.UP_T || 
			global.tile_map[current_tile.x_coord, current_tile.y_coord + 1].tile == tileTypes.LEFT_T || 
			global.tile_map[current_tile.x_coord, current_tile.y_coord + 1].tile == tileTypes.RIGHT_T || 
			global.tile_map[current_tile.x_coord, current_tile.y_coord + 1].tile == tileTypes.FOUR_WAY || 
			global.tile_map[current_tile.x_coord, current_tile.y_coord + 1].tile == tileTypes.UP_END){
				
				ds_list_add(from_list, "DOWN");			
		}
				
		
		
		for(var i = 0; i < ds_list_size(from_list); i++){
			show_debug_message("FROM: " + string(from_list[|i]));
		}
		
		show_debug_message("CURRENT: x:" + string(current_tile.x_coord) + " y: " + string(current_tile.y_coord));
		var dead_end = true;
		
		try{	
			var next_tile = global.tile_map[0, 0];	
			ds_list_shuffle(option_list);		
			next_tile_dir = option_list[|0];
			
			if(next_tile_dir == "LEFT"){
				next_tile = global.tile_map[current_tile.x_coord - 1, current_tile.y_coord];
				show_debug_message("TO: LEFT\n");
				dead_end = false;
			} else if(next_tile_dir == "RIGHT"){
				next_tile = global.tile_map[current_tile.x_coord + 1, current_tile.y_coord];	
				show_debug_message("TO: RIGHT\n");	
				dead_end = false;	
			} else if(next_tile_dir == "UP"){
				next_tile = global.tile_map[current_tile.x_coord, current_tile.y_coord - 1];	
				show_debug_message("TO: UP\n");		
				dead_end = false;	
			} else if(next_tile_dir == "DOWN"){
				next_tile = global.tile_map[current_tile.x_coord, current_tile.y_coord + 1];	
				show_debug_message("TO: DOWN\n");
				dead_end = false;		
			} else{
				next_tile = current_tile;
			}
			
			//show_debug_message("TO: x:" + string(next_tile.x_coord) + " y: " + string(next_tile.y_coord) + "\n");
			current_tile.tile = tileTypes.CLAIMED;
			current_tile = global.tile_map[next_tile.x_coord, next_tile.y_coord];
		} catch(_exception){
			show_debug_message(_exception.message);
		}
		
		ds_list_destroy(option_list);	
		ds_list_destroy(from_list);		
		
		if(dead_end){
			break;
		}
	}
}