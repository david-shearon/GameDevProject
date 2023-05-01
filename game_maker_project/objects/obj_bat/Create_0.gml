event_inherited();
// Stats
hp = 25;
atk = 3;
spd = 20;
gun = noone;
range = 1000;
cld = .5;
weight = 3;

// Start 1-2 second timer before charge
alarm[0] = room_speed*random_range(1, 2);
is_charging = false;

// Distance to charge
charge_dist = 0;

// Starting point of charge
charge_x = 0;
charge_y = 0;