//player variables
playerHp = 100;
movSpd = 5;

// Gun player has
weaponIndex = 0;
weapons = [ obj_testgun, obj_testgun, obj_testgun]
gun = weapons[weaponIndex];

instance_create_layer(x, y, "GunLayer", gun);