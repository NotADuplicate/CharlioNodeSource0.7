/// @description Explode
dir = 0;
xp = x + lengthdir_x(14,direction);
yp = y + lengthdir_y(14,direction);
/*repeat(12) {
    ins = instance_create(xp,yp,obj_explosion);
	ins.attack = true;
    ins.num = num;
    ins.dmg = 4;
    ins.direction = dir;
    dir += 30;
	ins.alarm[1] = 10;
}*/
ob = instance_create(xp,yp,rocket_explosion);
ob.attack = true;
ob.icon = spr_rocket
ob.num = num;
instance_destroy();
