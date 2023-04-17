// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function map_draw_full(start_tile_x, start_tile_y, map_width, map_height){
	var scale = 0.08;
	for(var i = 0; i <= map_width; i++){
		for(var j = 0; j <= map_height; j++){
			if(global.tile_map[i, j].tile != tileTypes.UNCLAIMED){
				var new_tile = instance_create_layer(100 + 902 * scale + (1804 * scale) * (i - start_tile_x), 902 + (1804 * scale) * (j - start_tile_y), "Instances", obj_generic_map);
				new_tile.image_xscale = scale;
				new_tile.image_yscale = scale;
				switch(global.tile_map[i, j].tile){
					case tileTypes.UP_LEFT_TURN:
						new_tile.sprite_index = spr_tree_grass_cobble_turn;
						break;
					case tileTypes.DOWN_LEFT_TURN:					
						new_tile.sprite_index = spr_tree_grass_cobble_turn;
						new_tile.image_angle = 90;
						break;
					case tileTypes.UP_RIGHT_TURN:
						new_tile.sprite_index = spr_tree_grass_cobble_turn;
						new_tile.image_angle = 270;
						break;
					case tileTypes.DOWN_RIGHT_TURN:
						new_tile.sprite_index = spr_tree_grass_cobble_turn;
						new_tile.image_angle = 180;
						break;
					case tileTypes.LEFT_RIGHT_STRAIGHT:
						new_tile.sprite_index = spr_tree_grass_cobble_straight;
						break;
					case tileTypes.UP_DOWN_STRAIGHT:
						new_tile.sprite_index = spr_tree_grass_cobble_straight;
						new_tile.image_angle = 90;
						break;
					case tileTypes.UP_T:
						new_tile.sprite_index = spr_tree_grass_cobble_T;
						new_tile.image_angle = 270;
						break;
					case tileTypes.DOWN_T:
						new_tile.sprite_index = spr_tree_grass_cobble_T;
						new_tile.image_angle = 90;				
						break;
					case tileTypes.LEFT_T:
						new_tile.sprite_index = spr_tree_grass_cobble_T;
						break;
					case tileTypes.RIGHT_T:
						new_tile.sprite_index = spr_tree_grass_cobble_T;
						new_tile.image_angle = 180;				
						break;
					case tileTypes.FOUR_WAY:
						new_tile.sprite_index = spr_tree_grass_cobble_intersection;
						break;
					case tileTypes.ALL_COBBLE:
						new_tile.sprite_index = spr_all_cobble;
						break;
				}
			}
		}
	}
}