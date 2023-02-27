// Movement
if (keyboard_check(ord("W"))) {
	y -= 5;
}

if (keyboard_check(ord("A"))) {
	x -= 5;
}

if (keyboard_check(ord("S"))) {
	y += 5;
}

if (keyboard_check(ord("D"))) {
	x += 5;
}

// Make player point at mouse
direction = point_direction(x, y, mouse_x, mouse_y);
image_angle = direction;

// Make the gun be at the same position and direction as the player
gun.direction = direction;
gun.image_angle = direction;
gun.x = x;
gun.y = y;

// Fire gun
gun.fire_gun(x, y, direction, mb_left);