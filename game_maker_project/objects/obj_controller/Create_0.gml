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

// Make list of all item objects
global.items = ds_map_create();
for (var i = 0; object_exists(i); i++) {
	// Add all items with their rarities
	if (object_is_ancestor(i, obj_item)) {
		var item = instance_create_layer(0, 0, "Instances", i);
		ds_map_add(global.items, i, item.weight);
		instance_destroy(item);
	}
}

// Remove parent objects from item list
var keys = ds_map_keys_to_array(global.items);
for (var i = 0; i < array_length(keys); i++) {
	for (var j = 0; j < array_length(keys); j++) {
		if (object_is_ancestor(keys[j], keys[i])) {
			ds_map_delete(global.items, keys[i]);
			break;
		}
	}
}

// Make list of visited tiles
global.visited_tiles = ds_list_create();
ds_list_add(global.visited_tiles, new vector2(global.curr_tile_x, global.curr_tile_y));