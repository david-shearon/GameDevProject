// Variables set by the gun
damage = 0;
pierce_count = 0;
pierce_mult = 0;

// List of targets that have been hit by this bullet
targets_hit = [];

// Collision function
function perform_collision(coll_objs, coll_num) {
	for (var i = 0; i < coll_num; i++) {
		// Check that we haven't hit this target before
		for (var j = 0; j < array_length(targets_hit); j++) {
			if (targets_hit[j] == coll_objs[| i].id) {
				exit;
			}
		}
		
		// Check if we hit a wall
		if (object_get_parent(coll_objs[| i].object_index) == obj_wall) {
			return [coll_objs[| i].x, coll_objs[| i].y];
		}

		// Damage calculation
		coll_objs[| i].hp -= damage*damage_mult;

		// Check if bullet reached its pierce_count
		if (array_length(targets_hit) >= pierce_count) {
			return [coll_objs[| i].x, coll_objs[| i].y];
		}

		// Reduce damage after pierce
		damage *= pierce_mult;

		// Add this object to the targets hit list
		targets_hit[array_length(targets_hit)] = coll_objs[| i].id;
	}
}