/// @description Set states and target
targetX = obj_bigBall.x;
targetY = obj_bigBall.y;
state = "Travel";

// Inherit the parent event
event_inherited();

global.players[2] = self;
alarm[2] = 10;
position_known = false;
alarm[5] = 10;

reload = 0;
wallPassive = false;
pushPos = 0;
pushing = 0.5;
num = 2;
knownLocation = 0;
frostCooldown = 200;
healCooldown = 300;
blastOffCooldown = 300;
hp = 250;
global.teamNum[num] = -1;
global.names[num] = "Enemy";
totalDamage = 0;
recentlySwithced = 0;
blastOffDir = 0;

shadow = instance_create(x,y+30,obj_shadow);
shadow.link = self;
shadow.depth = 600;

seen = 0;
ghosting = 0;
invPass = false;