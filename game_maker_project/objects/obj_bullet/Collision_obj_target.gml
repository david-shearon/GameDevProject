// Check that we haven't hit this target before
for (var i = 0; i < array_length(targets_hit); i++) {
	if (targets_hit[i] == other.id) {
		exit;
	}
}

// Damage calculation
other.hp -= damage*damage_mult;

// Delete bullet if necessary
if (array_length(targets_hit) >= pierce_count) {
	instance_destroy(id);
}

// Increment pierce counter
pierce_count++;

// Add this object to the targets hit list
targets_hit[array_length(targets_hit)] = other.id;