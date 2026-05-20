///Hit enemies and suck them in
if(num != other.num) {
	if(active) {
		active = false;
		with(other) {
			scr_dummy_damage(Abilities.whirlwind.damage, num, false, SD_machete, false);
		}
	}
	with(other) {
		motion_add(point_direction(x,y,other.x,other.y), point_distance(other.x,other.y,x,y)/5);
	}
}