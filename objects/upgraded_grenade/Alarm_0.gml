/// @description Explode
dir = 0;
repeat(24) {
    ins = instance_create(x,y,obj_explosion);
	ins.attack = true;
    ins.num = num;
    ins.dmg = 10;
    ins.direction = dir;
    dir += 15;
	ins.image_xscale = 1.5;
	ins.image_yscale = 1.5;
	ins.alarm[1] = 10;
}
ob = instance_create(x,y,obj_blast);
ob.attack = true;
ob.image_xscale *= 1.5;
ob.image_yscale *= 1.5;
ob.num = num;
instance_destroy();

