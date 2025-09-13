/// @description Fire particles
//instance_create(x+random_range(-128,128),y+random_range(-128,128),obj_firePart)
xp = x + random_range(-130,130);
yp = y + random_range(-130,130);
//part_particles_create(global.partSystem,xp,yp,part_smokeSmoke,1);
timer -= delta_time / 1000000;
intensity = 10 + (timer/duration)*20;

if(intensity < 10) {
	instance_destroy();
}

repeat(round(intensity)) {
	r = 128 * sqrt(random_range(0,1))
	theta = random_range(0,360);
	xp = x+lengthdir_x(r,theta);
	yp = y+lengthdir_y(r,theta);
	//part_particles_create(global.partSystem,xp,yp,part_fastFire,1);
}

