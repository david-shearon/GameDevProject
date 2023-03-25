// Check for collision in between each position
var nextX = x + lengthdir_x(speed, direction);
var nextY = y + lengthdir_y(speed, direction);

var hit_list = ds_list_create();
var hit_num = collision_line_list(x, y, nextX, nextY, obj_target, false, false, hit_list, true);

var endPos = perform_collision(hit_list, hit_num);

ds_list_destroy(hit_list);

if (!is_undefined(endPos)) {
	instance_destroy();
}