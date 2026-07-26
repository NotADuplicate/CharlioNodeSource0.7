/// @description Set states and target
pointDir = 0;
gunDir = 0;
targetX = obj_bigBall.x;
targetY = obj_bigBall.y;
state = "Travel";

// Inherit the parent event
event_inherited();

alarm[2] = 10;
position_known = false;
alarm[5] = 10;

reload = 0;
wallPassive = false;
pushPos = 0;
pushing = 0.5;

knownLocation = 0;
hp = 250;
totalDamage = 0;
recentlySwithced = 0;
blastOffDir = 0;
walkingAround = false;
tower = self;
maxAmmo = 10;
randomise();
mistakes = 2; //DIFFICULTY SETTING FOR AI
inaccuracy = 7;
burstMoving = 0;
finishWalkingAround = false;

scr_pick_loadout();

ability1CD = 5;
ability2CD = 5;
ability3CD = 5;
path = noone;
pushingBall = 0;
startX = x;
startY = y;

link = self;
alarm[1] = 1; //create other
enemy = ball_player;
ally = noone;
ammo = 10;
enemyDistances = [0, 0, 0, 0, 0, 0, 0]
fightingDist = 120;
alarm[7] = 45;
loadoutUnseen = true;
travelCaution = irandom_range(5,60);