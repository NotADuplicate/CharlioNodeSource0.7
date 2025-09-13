/// @description Crit on fire, slam in direction its swinging
if(other.active) {
	motion_add(point_direction(other.x,other.y,x,y)+90,18)
	if(burn > 0)
		scr_dummy_damage(170,other.num,false);
	else
		scr_dummy_damage(50,other.num,false);
	other.active = false;
}