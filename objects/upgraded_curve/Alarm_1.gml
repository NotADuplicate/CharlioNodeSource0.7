/// @description Explode
dir = 0;
	repeat(24) {
	    ins = instance_create(x,y,obj_explosion);
		ins.icon = spr_curveGun
		ins.attack = true;
		ins.image_xscale = 1.5;
		ins.image_yscale = 1.5;
	    ins.num = num;
	    ins.dmg = 13;
	    ins.direction = dir;
	    dir += 15;
		ins.alarm[1] = 10;
	}
	ob = instance_create(x,y,obj_blast);
	ob.attack = true;
	ob.image_xscale *= 1.5;
	ob.image_yscale *= 1.5;
	ob.icon = spr_curveGun
	ob.num = num;
	instance_destroy();