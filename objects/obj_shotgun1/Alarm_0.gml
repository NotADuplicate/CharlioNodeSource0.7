/// @description Scattershot
//range = 325
direction -= 30;
repeat(10) {
    ins = instance_create(x,y,obj_bullet1);
    ins.dmg = 10;
    ins.num = num;
    ins.direction = direction;
    ins.speed = 20;
	ins.ammo = false;
    //ins.alarm[1] = 15;
    ins.slow = .8;
    direction += 7.5;
}

