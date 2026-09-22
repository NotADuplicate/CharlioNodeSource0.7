/// @description Die
dead = true
image_alpha = .1;
timer = deathTime;
x = -1000;
y = -1000;
hp = 1000;

attacking = 0;
attackPhase = 0;
if(instance_exists(beam)) {
	instance_destroy(beam)
	beam = noone;
}