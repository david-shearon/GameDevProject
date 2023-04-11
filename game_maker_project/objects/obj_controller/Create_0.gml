/// @description Insert description here
// You can write your code in this editor

enum gun_types {
	rifle,
	shotgun,
	pistol
}

global.curr_tile_x = 1;
global.curr_tile_y = 2;
var map_tile_width = 10;
var map_tile_height = 3;
var density = 1;

audio_play_sound(snd_background_music, 1, true, 0.2);

global.map_tile_width = map_tile_width;

instance_create_layer(room_width, random(room_height), "SmokeLayer", obj_smoke);

map_generation(map_tile_width, map_tile_height, global.curr_tile_x, global.curr_tile_y, density);

map_draw_current(global.curr_tile_x, global.curr_tile_y, "RIGHT");
