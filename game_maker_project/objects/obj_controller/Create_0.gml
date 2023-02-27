/// @description Insert description here
// You can write your code in this editor

map_generation();

for(var i = 0; i <= global.map_tile_width + 1; i++){
		for(var j = 0; j <= global.map_tile_height + 1; j++){
			if(global.tile_map[i, j].tile != tileTypes.UNCLAIMED){
				var new_tile = instance_create_layer(300 + 460 * i, 300 + 460 * j, "Instances", obj_generic_map);
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
				}
			}
		}
	}
