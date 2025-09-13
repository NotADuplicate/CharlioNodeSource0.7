/// @description Scattershot
//range = 325
direction -= 30;
repeat(10) {
    ins = instance_create(x,y,obj_bullet);
	ins.image_xscale *= 2;
	ins.image_yscale *= 2;
    ins.dmg = 19;
    ins.num = num;
    ins.direction = direction;
    ins.speed = 23;
	ins.ammo = false;
    //ins.alarm[1] = 15;
    ins.slow = .8;
    direction += 7.5;
}

