/// @description Crit on fire, slam in direction its swinging
if(other.active) {
	other.active = false
	motion_add(point_direction(other.x,other.y,x,y)-90,18)
	scr_dummy_damage(70,other.num,false, SD_machete, false);
}