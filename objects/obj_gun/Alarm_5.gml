throwing = false;
var inst = instance_create(global.players[num].x,global.players[num].y,throwProjectile);
inst.direction = throwProjectileDir;
inst.image_angle = throwProjectileDir;
inst.num = num;