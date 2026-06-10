/// @description Insert description here
// You can write your code in this editor
if(instance_exists(obj_tutorial) = false || obj_tutorial.stage > 14) {
	monster = instance_create(x,y,mons);
	monster.camp = self;
	monster.hp = maxhp;
	monster.maxhp = maxhp;
	monster.regen = regen;
	monster.idleSpr = idleSpr;
	monster.walkSpr = walkSpr;
	monster.deathSpr = deathSpr;
	monster.scale = sprScale;
	monster.image_yscale = sprScale;
	monster.image_xscale = sprScale;
	monster.image_speed = imageSpd;
}