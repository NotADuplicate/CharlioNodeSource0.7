/// @description Scattershot
scope = global.players[num].accuracy
repeat(10) {
    ins = instance_create(x,y,obj_bullet);
	ins.image_xscale *= 2;
	ins.image_yscale *= 2;
    ins.dmg = 19;
    ins.num = num;
	ins.icon = spr_shot;
    ins.direction = direction+random_range(-30/scope,30/scope);
    ins.speed = random_range(20,28)*scope;
	ins.ammo = false;
    ins.slow = .8;
    //direction += 5;
}