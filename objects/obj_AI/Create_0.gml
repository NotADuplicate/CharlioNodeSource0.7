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

reload = 90;
wallPassive = false;
pushPos = 0;
pushing = 0.5;

knownLocation = 0;
hp = 250;
totalDamage = 0;
recentlySwithced = 0;
blastOffDir = 0;
walkingAround = false;
ballApproachPath = -1;
navigationPath = -1;
escapeTower = noone;
towerBallRange = [];
ballHealSteps = 0;
ballBodyContact = false;
ballBodyPushTime = 0;
ballPushStallTime = 0;
ballProgressX = obj_bigBall.x;
ballProgressY = obj_bigBall.y;
ballStageGoal = noone;
ballRecoveryGoal = noone;
ballDislodgeTime = 0;
ballDislodgeX = obj_bigBall.x;
ballDislodgeY = obj_bigBall.y;
ballApproachProgressX = x;
ballApproachProgressY = y;
ballApproachNoProgressTime = 0;
skirmishTowerWaitTime = 0;
skirmishTowerEnemy = noone;
tower = self;
maxAmmo = 10;
randomise();
mistakes = 2; //DIFFICULTY SETTING FOR AI
inaccuracy = 8;
burstMoving = 0;
finishWalkingAround = false;

ability1CD = 5;
ability2CD = 5;
ability3CD = 5;
ability1 = noone;
ability2 = noone;
ability3 = noone;
loadout = [];

setLoadout = false
levels = 3;
path = noone;
pushingBall = 0;
startX = x;
startY = y;

link = self;
alarm[1] = 1; //create other
enemy = noone;
ally = noone;
ammo = 10;
enemyDistances = [0, 0, 0, 0, 0, 0, 0]
fightingDist = 120;
purchasing = -1
alarm[7] = 45;
loadoutUnseen = true;
travelCaution = irandom_range(5,60);
backing = 0;
dummy = false;

show_debug_message("AI created")
show_debug_message(object_get_name(global.players[num].object_index))
