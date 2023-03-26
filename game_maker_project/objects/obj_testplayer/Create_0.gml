//player variables
playerHp = 100;
movSpd = 5;

// Gun player has
weaponIndex = 0;
weapons = [obj_dmr, obj_XM, obj_glock]
gun = weapons[weaponIndex];

// Distance from center of player to end of gun
gun_x = 0;
gun_y = 0;

instance_create_layer(x, y, "GunLayer", gun);