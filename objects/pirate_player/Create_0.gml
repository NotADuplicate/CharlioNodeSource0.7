/// @description Insert description here
// You can write your code in this editor
spd = 7.5;
alarm[1] = 1;
maxhp = 100;
hp = 100;
global.attack = pirate_bullet;
reload = 45;
dev = 5;
clip = 0;
if(instance_exists(obj_camera) == false)
	instance_create(x,y,obj_camera)
pirate = false;
shopping = false;
maxclip = 20;
global.grenade = 0;
killnum = 0; //which player you were killed by
captain = false;
global.captain = false;
MTF = false;
cloak = 100;
beast = false;
zap = 0;
jumping = false
marked = 0;