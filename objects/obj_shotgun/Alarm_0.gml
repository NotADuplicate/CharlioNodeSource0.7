/// @description Scattershot
accuracy = global.players[num].accuracy
scope = global.players[num].scope
repeat(10) {
    ins = instance_create(x,y,obj_bullet);
    ins.dmg = 12;
    ins.num = num;
	ins.icon = spr_shot;
    ins.direction = direction+random_range(-30/accuracy,30/accuracy);
    ins.speed = random_range(20,26);
	ins.ammo = false;
    ins.slow = .8;
    //direction += 5;
}

