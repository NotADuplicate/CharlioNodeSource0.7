/// @description Do image_angle
image_angle = direction;

///TP to player
if(speed = 0) {
    if(instance_exists(link)) {
        x = link.x;
        y = link.y;
    }
    else {
        speed = 75;
    }
}
else if(dmg < dmgRamp * 8) {
	dmg += dmgRamp;
}
if(charge < 75 && speed == 0)
	charge += fire;
