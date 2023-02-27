// Delete bullet when it leaves the room
if (x < 0) {
	instance_destroy(id, false);
}
if (y < 0) {
	instance_destroy(id, false);
}
if (x > room_width) {
	instance_destroy(id, false);
}
if (y > room_height) {
	instance_destroy(id, false);
}

// Check for collision in between each position
var nextX = x + lengthdir_x(speed, direction);
var nextY = y + lengthdir_y(speed, direction);

var hit_list = ds_list_create();
var hit_num = collision_line_list(x, y, nextX, nextY, obj_target, false, false, hit_list, true);

for (var i = 0; i < hit_num; i++) {
	perform_collision(hit_list[| i]);
}
