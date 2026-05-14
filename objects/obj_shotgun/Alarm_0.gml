/// @description Scattershot
accuracy = global.players[num].accuracy
scope = global.players[num].scope
dir = direction-(30/accuracy)
repeat(10) {
    ins = instance_create(x,y,obj_bullet);
    ins.dmg = 12;
    ins.num = num;
	ins.icon = spr_shot;
    ins.direction = dir;
    ins.speed = 23;
	ins.ammo = false;
    ins.slow = .8;
	dir += 6/accuracy;
    //direction += 5;
}

