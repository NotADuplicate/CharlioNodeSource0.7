/// @description Scatter nukes
direction-=30;
repeat(3) {
    ins = instance_create(x,y,obj_nuke);
    ins.dmg = 8;
    ins.num = num;
    ins.direction = direction;
    ins.speed = 15;
    direction += 30;
}

