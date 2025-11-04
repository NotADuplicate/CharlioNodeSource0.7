/// @description Explode
dir = 0;
repeat(12) {
    ins = instance_create(x,y,obj_explosion);
	ins.icon = spr_airstrike
    ins.num = num;
    ins.dmg = 20
    ins.direction = dir;
    dir += 30;
    ins.alarm[1] = 5;
}
b = instance_create(x,y,obj_blast);
b.icon = spr_airstrike
b.num = num;
alarm[1] = 10;

