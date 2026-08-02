/// @description Scale up
image_xscale = 2.4;
image_yscale = 2.4;
image_alpha = .25;
alarm[0] = 10;
image_speed = 0.75
intensity = 30;
duration = Abilities.molotov.duration;
timer = duration;
//mp_grid_update_circle(global.bb,x,y,290,32,true);

with(obj_AI) {
	if(point_distance(x,y,other.x,other.y) < 340) {
		state = "Dodge Fire";
	}
}