/// @description Explode
if(armed == true) {
    dir = 0;
    repeat(15) {
        ins = instance_create(x,y,obj_explosion);
        ins.dmg = 7;
        ins.num = num;
        ins.direction = dir;
        dir += 30;
    }
    instance_destroy();
}

