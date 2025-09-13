///@description Decide if pirate or crew
if(MTF) { //if respawn as MTF
	ins = MTF_dock;
	sprite_index = spr_purple;
	hp = 200;
	maxhp = 200;
	global.attack = obj_shotgun;
	spd = 10;
	clip = 2;
	pirate = false;
	maxclip = 2;
	instance_create(0,0,MTF_incentive);
	global.MTF = true;
	global.loot = 1;
}
else { //if spawning for the first time
	pirate = scr_IsAPirate(num);
	global.MTF = false;
	if(pirate) {
		ins = instance_find(pirate_placeholder,irandom_range(0,2));
		hp = 150;
		maxhp = 150;
		sprite_index = spr_red;
		clip = 20;
		instance_create(0,0,obj_shop);
		global.captain = false;
		instance_create(0,0,pirate_incentives);
		spd = 9;
	}
	else { // crew or beast or captain
		seed = random_get_seed();
		placenum = ((seed+num) mod 5);
		ins = instance_find(obj_placeholder,placenum);
		global.ship = true;
		maxclip = 6;
		clip = 6;
		numb = ((num+seed) mod global.loop);
		if(numb == global.loop-1) { //become captain
			captain = true;
			//beast = true;
			global.captain = true;
			sprite_index = spr_green;
			maxhp = 150;
			hp = 150;
			//instance_create(0,0,obj_bounty);
			instance_create(0,0,captain_incentive);
		}
		else if(numb == 4) { //become beast
			global.captain = true;
			captain = false;
			pirate_game.pirate = true;
			victims = 0;
			pirate = true;
			beast = true;
			sprite_index = spr_restrained;
			spd = 7;
			maxhp = 250;
			hp = 250;
			instance_create(0,0,beast_incentive);
		}
		else {//normal crew
			global.captain = false;
			captain = false;
			instance_create(0,0,crew_incentives);
		}
	}
}
x = ins.x;
y = ins.y;