/// @description Explode
dir = 0;
repeat(12) {
    ins = instance_create(x,y,obj_explosion);
    ins.num = num;
    ins.dmg = 30;
    ins.speed = irandom_range(5,10);
    ins.alarm[1] = 180;
    ins.direction = dir;
	ins.BFG = true;
    dir += 30;
}
ob = instance_create(x,y,obj_blast);
ob.BFG = true;
ob.num = num;
instance_destroy();

