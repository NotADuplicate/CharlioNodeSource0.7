/// @description Set vars
timer = 0;
reload = 0;
backlog = 0;
spray = 0;
global.ammoThirst = false;
healuse = 1;
global.sponge = -1;
totalspray = 0;//how much ammo is queued up
extra = true; //only use ammo every other bullet
started = false;
flameAmmo = 0;
KBable = false;
global.chargeGun = 0;
//layer = -100;
global.partSystem = part_system_create();
global.pushSpd = 1;
global.poke = false;
global.ammoSeeing = false
global.marked = 0;
global.throwing = 2;
global.bootsObj = 0;
bullets = 4;
bulletReload = 0;
global.jungle = false;
global.baseMove = 5;
global.payload = false;
revving = 0;
gun = self;
global.boot = ""
minigunAmmo = 1;
spongeable = false;
global.mark = false;
curving = 0;
global.typing = false;
global.spellBlade = false;
global.lastTouch = 1;
global.utilityClass = "";
global.lastTouchTime = current_time;
global.predict = false;
global.KBmult = 1;
global.teleportTimer = 0;
global.resistance = 1;
global.defense = 1;
global.utilityHeld = false
global.utilitySwapHeld = false;

depth = -1000;

startingSound = false;
startTimer = 12;

alarm[0] = 1;
lastX = 0;
lastY = 0;

global.passiveCount = 0;


//alarm[10] = 45;
alarm[1] = 2;



///Create buffer
var size = 1024;
var type = buffer_grow;
var alignment = 1;
buffer = buffer_create(size,type,alignment);
socket = obj_client.socket;
global.bugging = false;

held = false;
range = 1;
global.right = 0
global.free = 0;
global.rightCool = 0;
global.Q = 0;
global.QCool = 0;
global.R = 0;
global.RCool = 0;
global.space = 0;
global.spaceCool = 0;
global.stun = 60;
global.dead = false
global.xp = 0;
global.xpMax = 1500
global.xp2 = 0;
global.xpMax2 = 1500;
global.totalLevels = 0;
global.totalLevels2 = 0;
global.coolReduc = 1;
global.garren = 0;

global.respawn = 8;
global.respawn2 = 8;
global.caustic = 0;
global.waves = 0;
global.portal = false;

global.teamNum[11] = -1;//turret teams
global.teamNum[12] = 1; 
global.teamNum[13] = -1;
global.teamNum[14] = 1;
global.teamNum[15] = -1;
global.teamNum[16] = 1;



global.statAmmmo = 0;
global.statDmg = 0;
global.statMobi = 0;
global.statPush = 0;
global.statCooldown = 0;
global.statSup = 0;
global.statZone = 0;
global.statCC = 0;
global.statDef = 0;

global.statName[0] = "Ammo Cost";
global.statName[5] = "Damage";
global.statName[2] = "Mobility";
global.statName[3] = "Ball Pushing";
global.statName[1] = "Cooldown";
global.statName[4] = "Support";
global.statName[6] = "Zoning";
global.statName[7] = "CC";
global.statName[8] = "Defense";

global.stat[0] = "statAmmmo";
global.stat[5] = "statDmg";
global.stat[2] = "statMobi";
global.stat[3] = "statPush";
global.stat[1] = "statCooldown";
global.stat[4] = "statSup";
global.stat[6] = "statZone";
global.stat[7] = "statCC";
global.stat[8] = "statDef";

var i1 = 0;
repeat(5) {
	var i2 = 0;
	repeat(9) {
		global.statSource[i1,i2] = 0;
		i2++;
	}
	i1++;
}
global.screenShake = 0;
global.upgraded = false;