// Variables set by the gun
damage = 0;
pierce_count = 0;
pierce_mult = 0;

// List of targets that have been it by this bullet
targets_hit = [];

// Collision function
function perform_collision(coll_obj) {
	// Check that we haven't hit this target before
	for (var i = 0; i < array_length(targets_hit); i++) {
		if (targets_hit[i] == coll_obj.id) {
			exit;
		}
	}

	// Damage calculation
	coll_obj.hp -= damage*damage_mult;

	// Delete bullet if necessary
	if (array_length(targets_hit) >= pierce_count) {
		instance_destroy(id);
	}

	// Reduce damage after pierce
	damage *= pierce_mult;

	// Add this object to the targets hit list
	targets_hit[array_length(targets_hit)] = coll_obj.id;
}