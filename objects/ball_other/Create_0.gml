/// @description Wait a second before basing things off of num
alarm[0] = 1;
alarm[3] = 300;

respawnTimer = 0;
hp = 250;
maxhp = 250;
healing = 1;
sponge = false;
dc = 90;
jug = false;
xp = 0;
yp = 0;
sameTeam = true;
invPass = false;
scale = 1;
invis = true;
totalDamage = 0;
vis = true;
firePassive = false;
garren = false
gunDir = 0;
ramming = false
lastSpd = 0;
fireRate = 1;
lifeSteal = 0;
atk = 1;
magic = 1;
throwTime = 0;
wallPassive = false;
//layer = 1;
ammo = 10;
maxAmmo = 10;
seen = 0;
spectating = false;


gun = instance_create(0,0,obj_gun);
image_yscale = 1.75;
image_speed = 1/2;
depth = 2;

position_known = false;

//Status vars
inversion = 0;
jam = 0;
dashing = 0;
magicBurn = 0;
glassShield = 0;
controlled = 0;
controlledNum = 0;
controlledX = 0;
controlledY = 0;
milked = 0;
confuse = 0;
shield = 0;
chummed = 0;
marked = 0;
ghosting = 0;
drowsy = 0;
sleeping = 0;
poison = 0;
spellShield = 0;
decay = 0;
broken = 0;
frost = 0;
burn = 0;
tossGrabbed = 0;
oil = 0;
stunned = 0;
cryo = 0;
magicShield = 0;
blocking = 0;
bleed = 0;
murderball = 0
enraged = false;
kicking = 0;