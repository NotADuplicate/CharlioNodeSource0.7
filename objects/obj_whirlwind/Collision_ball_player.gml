///Hit enemies and suck them in
if(num != other.num) {
	if(active) {
		active = false;
		scr_damage(Abilities.whirlwind.damage, num, false, SD_machete, false);
	}
	//scr_player_move(point_direction(other.x,other.y,link.x,link.y), point_distance(other.x,other.y,link.x,link.y)/5)
}