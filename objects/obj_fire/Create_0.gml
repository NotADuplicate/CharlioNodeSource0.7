/// @description Scale up
image_xscale = 2.4;
image_yscale = 2.4;
image_alpha = .25;
alarm[0] = 10;
image_speed = 0.75
intensity = 30;
duration = Abilities.molotov.duration;
timer = duration;
// Cosmetic lighting; flicker speed scales both smooth oscillations.
light_radius = 280;
light_intensity = 0.35;
light_colour = $338CFF;
light_flicker_speed = 0.25;
light_flicker_time = 0;
light_flicker_phase = x * 0.031 + y * 0.017;
light_flicker = 1;
//mp_grid_update_circle(global.bb,x,y,290,32,true);

with(obj_AI) {
	if(point_distance(x,y,other.x,other.y) < 340) {
		state = "Dodge Fire";
	}
}
