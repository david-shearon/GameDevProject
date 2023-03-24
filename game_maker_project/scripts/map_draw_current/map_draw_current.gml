// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function map_draw_current(map_x, map_y, player_move_dir){	
	var old_tile = instance_position(room_width / 2, room_height / 2, obj_generic_map);
	
	if(global.tile_map[map_x, map_y].tile != tileTypes.UNCLAIMED){
		var new_tile = instance_create_layer(room_width / 2, room_height / 2, "Map", obj_generic_map);
		new_tile.up_avail = false;
		new_tile.down_avail = false;
		new_tile.left_avail = false;
		new_tile.right_avail = false;
		
		switch(global.tile_map[map_x, map_y].tile){
			case tileTypes.UP_LEFT_TURN:
				new_tile.sprite_index = spr_tree_grass_cobble_turn;
				new_tile.up_avail = true;
				new_tile.left_avail = true;
				break;
			case tileTypes.DOWN_LEFT_TURN:					
				new_tile.sprite_index = spr_tree_grass_cobble_turn;
				new_tile.image_angle = 90;
				new_tile.down_avail = true;
				new_tile.left_avail = true;
				break;
			case tileTypes.UP_RIGHT_TURN:
				new_tile.sprite_index = spr_tree_grass_cobble_turn;
				new_tile.image_angle = 270;
				new_tile.up_avail = true;
				new_tile.right_avail = true;
				break;
			case tileTypes.DOWN_RIGHT_TURN:
				new_tile.sprite_index = spr_tree_grass_cobble_turn;
				new_tile.image_angle = 180;
				new_tile.down_avail = true;
				new_tile.right_avail = true;
				break;
			case tileTypes.LEFT_RIGHT_STRAIGHT:
				new_tile.sprite_index = spr_tree_grass_cobble_straight;
				new_tile.left_avail = true;
				new_tile.right_avail = true;
				break;
			case tileTypes.UP_DOWN_STRAIGHT:
				new_tile.sprite_index = spr_tree_grass_cobble_straight;
				new_tile.image_angle = 90;
				new_tile.down_avail = true;
				new_tile.up_avail = true;
				break;
			case tileTypes.UP_T:
				new_tile.sprite_index = spr_tree_grass_cobble_T;
				new_tile.image_angle = 270;
				new_tile.left_avail = true;
				new_tile.right_avail = true;
				new_tile.up_avail = true;
				break;
			case tileTypes.DOWN_T:
				new_tile.sprite_index = spr_tree_grass_cobble_T;
				new_tile.image_angle = 90;	
				new_tile.left_avail = true;
				new_tile.right_avail = true;
				new_tile.down_avail = true;					
				break;
			case tileTypes.LEFT_T:
				new_tile.sprite_index = spr_tree_grass_cobble_T;
				new_tile.left_avail = true;
				new_tile.down_avail = true;
				new_tile.up_avail = true;
				break;
			case tileTypes.RIGHT_T:
				new_tile.sprite_index = spr_tree_grass_cobble_T;
				new_tile.image_angle = 180;		
				new_tile.down_avail = true;
				new_tile.right_avail = true;
				new_tile.up_avail = true;				
				break;
			case tileTypes.FOUR_WAY:
				new_tile.sprite_index = spr_tree_grass_cobble_intersection;
				new_tile.left_avail = true;
				new_tile.right_avail = true;
				new_tile.up_avail = true;
				new_tile.down_avail = true;
				break;
		}
		new_tile.move_to = MoveTo.CENTER;
		//new_tile.image_alpha = 0.5;
		
		if(old_tile != noone){
			if(player_move_dir == "UP"){
				new_tile.y = -room_height / 2;
				new_tile.dir = MoveDir.DOWN;
				old_tile.dir = MoveDir.DOWN;
				old_tile.move_to = MoveTo.DOWN;
			} else if(player_move_dir == "DOWN"){
				new_tile.y = 3 * room_height / 2;
				new_tile.dir = MoveDir.UP;		
				old_tile.dir = MoveDir.UP;		
				old_tile.move_to = MoveTo.UP;	
			} else if(player_move_dir == "LEFT"){
				new_tile.x = -room_width / 2;
				new_tile.dir = MoveDir.RIGHT;	
				old_tile.dir = MoveDir.RIGHT;	
				old_tile.move_to = MoveTo.RIGHT;		
			} else if(player_move_dir == "RIGHT"){
				new_tile.x = 3 * room_width / 2;
				new_tile.dir = MoveDir.LEFT;	
				old_tile.dir = MoveDir.LEFT;
				old_tile.move_to = MoveTo.LEFT;			
			}	
		}
	}
}