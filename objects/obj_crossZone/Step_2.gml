/// @description Handle damaging players

if(global.teamNum[num] != global.teamNum[ball_player.num] || num == ball_player.num) {
	if(point_distance(x,y,ball_player.x,ball_player.y) < 200) {
		if(inside = false) {
			scr_damage(90,num,false, spr_crossZone, false)
		}
		inside = true;
	}
	else {
		if(inside = true) {
			scr_damage(90,num,false, spr_crossZone, false)
		}
		inside = false;
	}
}