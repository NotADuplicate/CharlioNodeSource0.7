/// @description Scattershot
dir = 0;
repeat(8) {
    ins = instance_create(x,y,BFG_grenade);
    ins.alarm[0] = irandom_range(50,70);
    ins.num = num;
    ins.direction = dir;
    ins.speed = 20;
    dir += 45;
}

