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