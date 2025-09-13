///Decide if pirate or crew
pirate = scr_IsAPirate(num);
if(pirate) {
	sprite_index = spr_red;
	maxhp = 150;
	hp = 150;
}
else {
	seed = random_get_seed();
	numb = ((num+seed) mod global.loop);
	if(numb == global.loop-1) {
		sprite_index = spr_green;
	}
	else if(numb = 4) {
		beast = true;
		sprite_index = spr_restrained;
		pirate = true;
	}
}
/*ins = instance_find(obj_placeholder,num);
x = ins.x;
y = ins.y;