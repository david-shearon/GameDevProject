// Stats
hp = 100;
atk = 10;
spd = 20;
gun = noone;
range = 1000;

// Start 1-2 second timer before charge
alarm[0] = room_speed*random_range(1, 2);
is_charging = false;

// Distance to charge
charge_dist = 0;

// Starting point of charge
charge_x = 0;
charge_y = 0;