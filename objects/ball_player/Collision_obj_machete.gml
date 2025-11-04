/// @description Crit on fire, slam in direction its swinging
if(global.teamNum[other.num] != global.teamNum[num] && other.active) {
	other.active = false
	scr_player_move(point_direction(other.x,other.y,x,y)-90,18)
	scr_damage(70,other.num,false, SD_machete, false);
}