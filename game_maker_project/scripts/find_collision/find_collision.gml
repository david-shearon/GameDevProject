// Bisection method to find where the bullet hit
function find_collision(start_x, start_y, dir, dist, coll_obj_id){
	// Base case
	if (dist <= 1) {
		return [start_x, start_y]
	}
	
	// Find end values
	var end_x = start_x + lengthdir_x(dist, dir);
	var end_y = start_y + lengthdir_y(dist, dir);
	
	// See if we hit the object
	var coll_obj = collision_line(start_x, start_y, end_x, end_y, coll_obj_id, false, false);
	
	// Recusive step of the bisection method
	if (coll_obj == noone) {
		return find_collision(end_x, end_y, dir, dist/2, coll_obj_id);
	} else {
		return find_collision(start_x, start_y, dir, dist/2, coll_obj_id);
	}
}