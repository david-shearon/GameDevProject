/// @description Insert description here
// You can write your code in this editor

enum gun_types {
	rifle,
	shotgun,
	pistol
}

global.curr_tile_x = 1;
global.curr_tile_y = 10;
var map_tile_width = 40;
var map_tile_height = 20;
var density = 3;


map_generation(map_tile_width, map_tile_height, global.curr_tile_x, global.curr_tile_y, density);

map_draw_current(global.curr_tile_x, global.curr_tile_y, "RIGHT");
