/// @description Explode
if(armed == true) {
    dir = 0;
	scr_damage(30,num, true, spr_mine, false)
    repeat(15) {
        ins = instance_create(x,y,obj_explosion);
        ins.dmg = 7;
		ins.icon = spr_mine;
        ins.num = num;
        ins.direction = dir;
        dir += 30;
    }
    instance_destroy();
}

