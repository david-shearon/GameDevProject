// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function spawn_enemies(difficulty, spawn_dir){
	var enemies = ds_map_keys_to_array(global.enemies);
	
	var total_weight = 0;
	for (var i = 0; i < array_length(enemies); i++) {
		total_weight += global.enemies[? enemies[i]];
	}
	
	// How many waves of enemies to spawn
	var waves = max(int64(difficulty/5), 1);
	
	repeat (waves) {
		// Choose what enemy to spawn
		var rand = random(1);
		var curr_weight = 0;
		var enemy = 0;
		for (var i = 0; i < array_length(enemies); i++) {
			curr_weight += global.enemies[? enemies[i]];
			if (rand < curr_weight/total_weight) {
				enemy = enemies[i];
				break;
			}
		}
	
		// Choose how many enemies to spawn
		var enemy_num = max(1, int64((difficulty - waves)/2) + irandom_range(-2, 2));
	
		repeat (enemy_num) {
			// Choose random location to spawn enemy
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
	
			// Spawn the enemy
			instance_create_layer(pos_x, pos_y, "Instances", enemy);
		}
	}
}