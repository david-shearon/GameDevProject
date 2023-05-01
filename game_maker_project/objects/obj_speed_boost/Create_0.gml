event_inherited();

in_inventory = false;

// Scale the sprite should be drawn at when on the ground;
grnd_spr_scale = .7;

// Higher means more common
weight = 4;

function item_effect(player) {
	with (player) {
		movSpd += 2;
	}
}