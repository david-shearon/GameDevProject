// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function spawn_items(difficulty, spawn_dir){
	var items = ds_map_keys_to_array(global.items);
	
	var total_weight = 0;
	for (var i = 0; i < array_length(items); i++) {
		total_weight += global.items[? items[i]];
	}
	
	// Choose what item to spawn
	var rand = random(1);
	var curr_weight = 0;
	var item = 0;
	for (var i = 0; i < array_length(items); i++) {
		curr_weight += global.items[? items[i]];
		if (rand < curr_weight/total_weight) {
			item = items[i];
			break;
		}
	}
	
	// Choose random location to spawn item
	var pos_x = irandom_range(50, room_width - 50);
	var pos_y = irandom_range(50, room_height - 50);
	
	if(spawn_dir == "LEFT"){
		pos_x -= room_width;
	}else if(spawn_dir == "RIGHT"){
		pos_x += room_width;
	}else if(spawn_dir == "UP"){
		pos_y -= room_width;
	}else if(spawn_dir == "DOWN"){
		pos_y += room_width;
	}
	
	
	// Spawn the item
	instance_create_layer(pos_x, pos_y, "ItemLayer", item);
}