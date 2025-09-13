/// @description Explode
dir = 0;
	repeat(12) {
	    ins = instance_create(x,y,obj_explosion);
		ins.attack = true;
	    ins.num = num;
	    ins.dmg = 13;
	    ins.direction = dir;
	    dir += 30;
		ins.alarm[1] = 10;
	}
	ob = instance_create(x,y,obj_blast);
	ob.attack = true;
	ob.num = num;
	instance_destroy();