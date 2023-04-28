// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function map_generation(map_tile_width, map_tile_height, start_tile_x, start_tile_y, MAP_DENSITY){
	randomize();
	
	//var MAP_DENSITY = 2;
	
	//global.map_tile_width = 15;
	//global.map_tile_height = 10;
	
	var map_tile_len_min = map_tile_width * MAP_DENSITY;
	var count = 0;
	
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
		
		FOUR_WAY,
		ALL_COBBLE
	}
	
	var dead_end = true;
	while(dead_end == true || count < map_tile_len_min){
		
		count = 0;
		dead_end = false;
		//initialize map
		for(var i = 0; i <= map_tile_width + 1; i++){
			for(var j = 0; j <= map_tile_height + 1; j++){
				if((i == 0 || j == 0 || j == map_tile_height) && i != map_tile_width){
					//So you can't go off the map.
					global.tile_map[i, j] =
					{
						x_coord: i, //width
						y_coord: j,	//height
						tile: tileTypes.MAP_BORDER
					}	
				} else if(i == map_tile_width + 1) {
					global.tile_map[i, j] =
					{
						x_coord: i, //width
						y_coord: j,	//height
						tile: tileTypes.ALL_COBBLE
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
							
		current_tile = global.tile_map[start_tile_x, start_tile_y];
		global.tile_map[start_tile_x, start_tile_y].tile = tileTypes.CLAIMED;
		global.tile_map[start_tile_x - 1, start_tile_y].tile = tileTypes.RIGHT_END;
		
		while(current_tile.x_coord != map_tile_width || dead_end){
			//add available options to random list
			option_list = ds_list_create();
			from_list = ds_list_create();
			full_dir_list = ds_list_create(); //for all in/outgoing paths
			var next_tile = global.tile_map[0, 0];
				
			if(global.tile_map[current_tile.x_coord - 1, current_tile.y_coord].tile == tileTypes.UNCLAIMED){ //left
				ds_list_add(option_list, "LEFT");
			}
			else if(global.tile_map[current_tile.x_coord - 1, current_tile.y_coord].tile == tileTypes.UP_RIGHT_TURN ||
				global.tile_map[current_tile.x_coord - 1, current_tile.y_coord].tile == tileTypes.DOWN_RIGHT_TURN || 
				global.tile_map[current_tile.x_coord - 1, current_tile.y_coord].tile == tileTypes.CLAIMED || 
				global.tile_map[current_tile.x_coord - 1, current_tile.y_coord].tile == tileTypes.LEFT_RIGHT_STRAIGHT || 
				global.tile_map[current_tile.x_coord - 1, current_tile.y_coord].tile == tileTypes.UP_T || 
				global.tile_map[current_tile.x_coord - 1, current_tile.y_coord].tile == tileTypes.RIGHT_T || 
				global.tile_map[current_tile.x_coord - 1, current_tile.y_coord].tile == tileTypes.DOWN_T || 
				global.tile_map[current_tile.x_coord - 1, current_tile.y_coord].tile == tileTypes.FOUR_WAY || 
				global.tile_map[current_tile.x_coord - 1, current_tile.y_coord].tile == tileTypes.RIGHT_END ||
				global.tile_map[current_tile.x_coord - 1, current_tile.y_coord].tile == tileTypes.ALL_COBBLE){
			
					ds_list_add(from_list, "LEFT");
					//show_debug_message("FROM LEFT");
			}
		
			if(global.tile_map[current_tile.x_coord + 1, current_tile.y_coord].tile == tileTypes.UNCLAIMED){ //right
				ds_list_add(option_list, "RIGHT");
			}
			else if(global.tile_map[current_tile.x_coord + 1, current_tile.y_coord].tile == tileTypes.UP_LEFT_TURN ||
				global.tile_map[current_tile.x_coord + 1, current_tile.y_coord].tile == tileTypes.DOWN_LEFT_TURN || 
				global.tile_map[current_tile.x_coord + 1, current_tile.y_coord].tile == tileTypes.CLAIMED || 
				global.tile_map[current_tile.x_coord + 1, current_tile.y_coord].tile == tileTypes.LEFT_RIGHT_STRAIGHT || 
				global.tile_map[current_tile.x_coord + 1, current_tile.y_coord].tile == tileTypes.UP_T || 
				global.tile_map[current_tile.x_coord + 1, current_tile.y_coord].tile == tileTypes.LEFT_T || 
				global.tile_map[current_tile.x_coord + 1, current_tile.y_coord].tile == tileTypes.DOWN_T || 
				global.tile_map[current_tile.x_coord + 1, current_tile.y_coord].tile == tileTypes.FOUR_WAY || 
				global.tile_map[current_tile.x_coord + 1, current_tile.y_coord].tile == tileTypes.LEFT_END ||
				global.tile_map[current_tile.x_coord + 1, current_tile.y_coord].tile == tileTypes.ALL_COBBLE){
			
					ds_list_add(from_list, "RIGHT");
					//show_debug_message("FROM RIGHT");
			}
		
			if(global.tile_map[current_tile.x_coord, current_tile.y_coord - 1].tile == tileTypes.UNCLAIMED){ //up
				ds_list_add(option_list, "UP");		
			}
			else if(global.tile_map[current_tile.x_coord, current_tile.y_coord - 1].tile == tileTypes.DOWN_LEFT_TURN ||
				global.tile_map[current_tile.x_coord, current_tile.y_coord - 1].tile == tileTypes.DOWN_RIGHT_TURN || 
				global.tile_map[current_tile.x_coord, current_tile.y_coord - 1].tile == tileTypes.CLAIMED || 
				global.tile_map[current_tile.x_coord, current_tile.y_coord - 1].tile == tileTypes.UP_DOWN_STRAIGHT || 
				global.tile_map[current_tile.x_coord, current_tile.y_coord - 1].tile == tileTypes.DOWN_T || 
				global.tile_map[current_tile.x_coord, current_tile.y_coord - 1].tile == tileTypes.LEFT_T || 
				global.tile_map[current_tile.x_coord, current_tile.y_coord - 1].tile == tileTypes.RIGHT_T || 
				global.tile_map[current_tile.x_coord, current_tile.y_coord - 1].tile == tileTypes.FOUR_WAY || 
				global.tile_map[current_tile.x_coord, current_tile.y_coord - 1].tile == tileTypes.DOWN_END ||
				global.tile_map[current_tile.x_coord, current_tile.y_coord - 1].tile == tileTypes.ALL_COBBLE){
				
					ds_list_add(from_list, "UP");	
					//show_debug_message("FROM UP");		
			}
		
			if(global.tile_map[current_tile.x_coord, current_tile.y_coord + 1].tile == tileTypes.UNCLAIMED){ //down
				ds_list_add(option_list, "DOWN");		
			} 
			else if(global.tile_map[current_tile.x_coord, current_tile.y_coord + 1].tile == tileTypes.UP_LEFT_TURN ||
				global.tile_map[current_tile.x_coord, current_tile.y_coord + 1].tile == tileTypes.UP_RIGHT_TURN || 
				global.tile_map[current_tile.x_coord, current_tile.y_coord + 1].tile == tileTypes.CLAIMED || 
				global.tile_map[current_tile.x_coord, current_tile.y_coord + 1].tile == tileTypes.UP_DOWN_STRAIGHT || 
				global.tile_map[current_tile.x_coord, current_tile.y_coord + 1].tile == tileTypes.UP_T || 
				global.tile_map[current_tile.x_coord, current_tile.y_coord + 1].tile == tileTypes.LEFT_T || 
				global.tile_map[current_tile.x_coord, current_tile.y_coord + 1].tile == tileTypes.RIGHT_T || 
				global.tile_map[current_tile.x_coord, current_tile.y_coord + 1].tile == tileTypes.FOUR_WAY || 
				global.tile_map[current_tile.x_coord, current_tile.y_coord + 1].tile == tileTypes.UP_END ||
				global.tile_map[current_tile.x_coord, current_tile.y_coord + 1].tile == tileTypes.ALL_COBBLE){
				
					ds_list_add(from_list, "DOWN");	
					//show_debug_message("FROM DOWN");		
			}
				
			//show_debug_message("CURRENT: x:" + string(current_tile.x_coord) + " y: " + string(current_tile.y_coord));
		
			ds_list_shuffle(option_list);		
			next_tile_dir = option_list[| 0];
			//show_debug_message("NEXT: " + string(next_tile_dir));
			
			if(ds_list_size(option_list) == 0){
				//show_debug_message("CORNERED!!!***************************************************");
				next_tile = global.tile_map[current_tile.x_coord, current_tile.y_coord];
				dead_end = true;
				break;
			}
			else{			
				switch(next_tile_dir){
					case("LEFT"):
						next_tile = global.tile_map[current_tile.x_coord - 1, current_tile.y_coord];
						//show_debug_message("TO: LEFT");
						break;
					case("RIGHT"):
						next_tile = global.tile_map[current_tile.x_coord + 1, current_tile.y_coord];	
						//show_debug_message("TO: RIGHT");	
						break;
					case("UP"):
						next_tile = global.tile_map[current_tile.x_coord, current_tile.y_coord - 1];	
						//show_debug_message("TO: UP");	
						break;
					case("DOWN"):
						next_tile = global.tile_map[current_tile.x_coord, current_tile.y_coord + 1];	
						//show_debug_message("TO: DOWN");
						break;
				}
			}
			
			ds_list_copy(full_dir_list, from_list); //copy ingoing		
			ds_list_add(full_dir_list, next_tile_dir); //add outgoing
		
			switch(ds_list_size(full_dir_list)){
				case 2:
					//show_debug_message("PATHS: 2");
					if(ds_list_find_index(full_dir_list, "UP") != -1){ //UP IN LIST
						if(ds_list_find_index(full_dir_list, "LEFT") != -1){
							global.tile_map[current_tile.x_coord, current_tile.y_coord].tile = tileTypes.UP_LEFT_TURN;
							//show_debug_message("TILE TYPE: UP_LEFT");
						} else if(ds_list_find_index(full_dir_list, "RIGHT") != -1){
							global.tile_map[current_tile.x_coord, current_tile.y_coord].tile = tileTypes.UP_RIGHT_TURN;
							//show_debug_message("TILE TYPE: UP_RIGHT");
						} else if(ds_list_find_index(full_dir_list, "DOWN") != -1){
							global.tile_map[current_tile.x_coord, current_tile.y_coord].tile = tileTypes.UP_DOWN_STRAIGHT;
							//show_debug_message("TILE TYPE: UP_DOWN");
						}
					} else if(ds_list_find_index(full_dir_list, "DOWN") != -1){
						if(ds_list_find_index(full_dir_list, "LEFT") != -1){
							global.tile_map[current_tile.x_coord, current_tile.y_coord].tile = tileTypes.DOWN_LEFT_TURN;
							//show_debug_message("TILE TYPE: DOWN_LEFT");
						} else if(ds_list_find_index(full_dir_list, "RIGHT") != -1){
							global.tile_map[current_tile.x_coord, current_tile.y_coord].tile = tileTypes.DOWN_RIGHT_TURN;
							//show_debug_message("TILE TYPE: DOWN_RIGHT");
						}						
					} else if(ds_list_find_index(full_dir_list, "LEFT") != -1){
						global.tile_map[current_tile.x_coord, current_tile.y_coord].tile = tileTypes.LEFT_RIGHT_STRAIGHT;
						//show_debug_message("TILE TYPE: LEFT_RIGHT");					
					}
					break;
				case 3:
					//show_debug_message("PATHS: 3");
					if(ds_list_find_index(full_dir_list, "LEFT") == -1){ //LEFT NOT IN LIST
						global.tile_map[current_tile.x_coord, current_tile.y_coord].tile = tileTypes.RIGHT_T;
					} else if(ds_list_find_index(full_dir_list, "RIGHT") == -1){
						global.tile_map[current_tile.x_coord, current_tile.y_coord].tile = tileTypes.LEFT_T;					
					} else if(ds_list_find_index(full_dir_list, "UP") == -1){
						global.tile_map[current_tile.x_coord, current_tile.y_coord].tile = tileTypes.DOWN_T;							
					} else if(ds_list_find_index(full_dir_list, "DOWN") == -1){
						global.tile_map[current_tile.x_coord, current_tile.y_coord].tile = tileTypes.UP_T;
					}
					break;
				case 4:
					//show_debug_message("PATHS: 4");
					global.tile_map[current_tile.x_coord, current_tile.y_coord].tile = tileTypes.FOUR_WAY;
					break;
			}
			
			//show_debug_message("");
			current_tile = global.tile_map[next_tile.x_coord, next_tile.y_coord];
		
			ds_list_destroy(option_list);	
			ds_list_destroy(from_list);		
			ds_list_destroy(full_dir_list);
			count++;
		}
	}
}