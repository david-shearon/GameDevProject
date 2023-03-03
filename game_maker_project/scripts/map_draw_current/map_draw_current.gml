// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function map_draw_current(map_x, map_y){
	if(global.tile_map[map_x, map_y].tile != tileTypes.UNCLAIMED){
		var new_tile = instance_create_layer(902, 902, "Map", obj_generic_map);
		switch(global.tile_map[map_x, map_y].tile){
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