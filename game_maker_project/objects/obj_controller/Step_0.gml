/// @description Insert description here
// You can write your code in this editor
if(room == MainGame){
	manage_map_change();
	
	if (global.tile_map[global.curr_tile_x, global.curr_tile_y].tile == tileTypes.ALL_COBBLE) {
		if (instance_number(obj_enemy) == 0) {
			room_goto(Win);
		}
	}
}