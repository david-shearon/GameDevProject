event_inherited();

in_inventory = false;

// Scale the sprite should be drawn at when on the ground;
grnd_spr_scale = .3;

// Higher means more common
weight = 4;

function item_effect(player) {
	with (player) {
		playerHp += 50;
	
		if (playerHp > maxHp) {
			playerHp = maxHp;
		}
	}
}