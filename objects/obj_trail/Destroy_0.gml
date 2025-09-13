/// @description Insert description here
// You can write your code in this editor
/// @description Explode
dir = 0;
repeat(12) {
    ins = instance_create(x,y,obj_explosion);
	ins.attack = false;
    ins.num = num;
    ins.dmg = 5;
    ins.direction = dir;
    dir += 30;
	ins.alarm[1] = 5;
}
ob = instance_create(x,y,obj_blast);
ob.attack = false;
ob.num = num;
instance_destroy();