/// @description Crit on fire, slam in direction its swinging
if(other.num != num) {
	scr_player_move(point_direction(other.x,other.y,x,y),25)
	scr_damage(50,other.num,false, spr_sledge, false);
	global.invincibility = 10;
}