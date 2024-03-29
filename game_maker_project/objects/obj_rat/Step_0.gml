event_inherited();

// Locate player
var player = instance_nearest(x, y, obj_player);

// Move towards player
if (player != noone && distance_to_object(player) <= range) {
    direction = point_direction(x, y, player.x, player.y);
    var move_x = lengthdir_x(spd, direction);
    var move_y = lengthdir_y(spd, direction);
    x += move_x;
    y += move_y;
}

// Rotate to face nearest player
image_angle = point_direction(x, y, obj_player.x, obj_player.y) + 90;