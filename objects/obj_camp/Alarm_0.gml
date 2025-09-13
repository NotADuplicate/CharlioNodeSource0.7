/// @description Insert description here
// You can write your code in this editor
monster = instance_create(x,y,mons);
monster.image_xscale = 3;
monster.image_yscale = 3;
monster.camp = self;
monster.hp = maxhp;
monster.maxhp = maxhp;
monster.regen = regen;