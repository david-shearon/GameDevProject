// Set appropriate variables
if (instance_exists(obj_player)) {
	is_charging = true;

	charge_x = x;
	charge_y = y;
	
	charge_dist = point_distance(charge_x, charge_y, obj_player.x, obj_player.y) + 200;
	
	direction = point_direction(charge_x, charge_y, obj_player.x, obj_player.y);
}