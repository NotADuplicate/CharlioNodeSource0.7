/// @description Scattershot
//range = 325
direction -= 30;
repeat(10) {
    ins = instance_create(x,y,obj_bullet);
    ins.dmg = 13;
    ins.num = num;
	ins.icon = spr_shotgun;
    ins.direction = direction;
    ins.speed = 23;
	ins.ammo = false;
    //ins.alarm[1] = 15;
    ins.slow = .8;
    direction += 7.5;
}

