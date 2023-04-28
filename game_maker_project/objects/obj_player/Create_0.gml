//player variables
MAX_SPRINT_TIME = 100.00;
playerHp = 100;
movSpd = 5;
sprintSpd = 10;
stamina = MAX_SPRINT_TIME;
sprintCD = false;
pickupRad = 150;


// Gun player has
weaponIndex = 0;
gun = obj_glock;

// Distance from center of player to end of gun
gun_x = 0;

instance_create_layer(x, y, "ItemLayer", gun);
gun.in_inventory = true;

////player variables
//playerHp = 100;
//movSpd = 5;

//// Gun player has
//weaponIndex = 0;
//weapons = [ obj_testgun, obj_testgun, obj_testgun]
//gun = weapons[weaponIndex];

//instance_create_layer(x, y, "GunLayer", gun);