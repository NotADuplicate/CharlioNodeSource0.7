/// @description Try to disconnect
/*if(dc > 0)
    dc--;
else
    instance_destroy();

/* */
/*  */

/*if(invPass && xp == x && yp = y) {
	if(invis < 65)
		invis++;
}
else
	invis = 0;*/
if(global.teamNum[num] == 0) {
	x = 5000;
	y = 5000;
}


xp = x;
yp = y;


if(enraged) {
	hp--;
	if(y < 10 || hp < 0)
		enraged = false;
}
if(poison > 0)
	poison--;
	
if(burn > 0) {
	burn--;
	frost = 0;
	if(burn mod 5 == 0) {
		instance_create(x+random_range(-16,16),y+random_range(-16,16),obj_firePart)
	}
}
if(magicBurn > 0) {
	magicBurn--;
	if(magicBurn mod 5 == 0) {
		instance_create(x+random_range(-16,16),y+random_range(-16,16),obj_darkPart)
	}
}
if(drowsy > 0) {
	drowsy--;
	if(drowsy mod 10 == 0) {
		instance_create(x,y,obj_Z);
		if(drowsy == 0)
			sleeping = 150;
	}
}
if(sleeping > 0) {
	sleeping--;
	if(sleeping mod 8 == 0) {
		instance_create(x,y,obj_Z);
	}
}

if(throwTime > 0) {
	throwTime--;
	image_xscale += upSpd/80;
	image_yscale += upSpd/80;
	upSpd -= grav
	if(throwTime == 0) {
		speed = 0;
		image_xscale = scale*2;
		image_yscale = scale*1.75;
	}
}
if(dashing > 0) {
	dashing--;
	instance_create(x,y,obj_dashing)
	instance_create(x,y,obj_dashing)
}