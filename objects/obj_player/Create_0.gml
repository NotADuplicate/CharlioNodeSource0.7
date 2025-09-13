/// @description Wait a second before basing things off of num
alarm[0] = 1;
hp = 1000;
maxhp = 1000;
global.invincibility = 60;
regen = 1;
spd = 5;
knockback = .5;
dmg = 1;
bRes = 1;
def = 1;
global.shooting = 1;
alarm[3] = 30; //healing
global.revive = false;
draw_set_halign(fa_center);
visible = false;
event_inherited()