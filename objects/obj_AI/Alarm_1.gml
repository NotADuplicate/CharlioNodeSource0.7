/// @description Create link player
scr_createBallPlayer(num);
link = global.players[num];

scr_pick_enemy();
tower = scr_pick_tower(false);

alarm[9] = 2;