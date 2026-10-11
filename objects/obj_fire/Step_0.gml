/// @description Fire particles
light_flicker_time += delta_time * 0.000001 * light_flicker_speed;
light_flicker = 1 + light_flicker_amount * (
    0.12 * sin(light_flicker_time * 17 + light_flicker_phase)
    + 0.08 * sin(light_flicker_time * 29 + light_flicker_phase * 1.7));
//instance_create(x+random_range(-128,128),y+random_range(-128,128),obj_firePart)
xp = x + random_range(-130,130);
yp = y + random_range(-130,130);
//part_particles_create(global.partSystem,xp,yp,part_smokeSmoke,1);
timer -= delta_time / 1000000;
intensity = 20 + (timer/duration)*20;
// Resolve the cosmetic light here; the renderer only draws these values.
var light_life = clamp(timer / max(duration, 0.000001), 0, 1);
light_intensity = light_base_intensity * light_life * light_flicker;
light_draw_radius = light_radius * light_flicker;

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

