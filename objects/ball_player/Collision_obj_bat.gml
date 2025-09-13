/// @description Hit airborne targets slam in direction its swinging
if(global.teamNum[other.num] != global.teamNum[num]) {
	if(other.active) {
		if(throwTime > 0) {
			global.invincibility = 0;
			scr_damage(other.dmg,other.num,false)
		}
		else {
			scr_damage(other.dmg,other.num,false)
			speed = 0;
		}
		scr_player_move(point_direction(other.x,other.y,x,y)+90,20)
		other.active = false
	}
}