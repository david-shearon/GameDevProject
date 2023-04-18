// returns the closest object to start based on the x, y of the object
function find_object(x_start, y_start, radius, target, ignore){
	// Find potiential objects
	var potential_objects = ds_list_create();
	var num_objs = collision_circle_list(x_start, y_start, radius, target, false, false, potential_objects, false);
	
	var min_obj = noone;
	var min_dist = 10000000000.0;
	for (var i = 0; i < num_objs; i++) {
		var current = potential_objects[| i];
		
		if (current.object_index == ignore) {
			continue;
		}
		
		var dist = point_distance(x_start, y_start, current.x, current.y);
		
		if (dist > radius) {
			continue;
		}
		
		if (dist < min_dist) {
			min_obj = current;
			min_dist = dist;
		}
	}
	
	ds_list_destroy(potential_objects);
	return min_obj;
}