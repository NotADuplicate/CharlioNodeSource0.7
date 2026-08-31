/// @description Starting vars

hp = 120;
maxhp = 250;
xp = x;
yp = y;
invincibility = 0;
poisonDmg = 0;
num = 2;
alarm[0] = 30;
if(global.testMode) {
	global.teamNum[num] = -1;
	global.players[num] = self
}
recentDamageIcon = spr_attack;
dummy = true;
image_xscale = -1.5;
image_yscale = 1.5;

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
num = 2;
kicking = 0;
milked = 0;

/*shadow = instance_create(x,y+30,obj_shadow);
shadow.link = self;
shadow.depth = 600;