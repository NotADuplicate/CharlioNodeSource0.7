/// @description Knockback
if(ghosting == 0 || other.attack == false) {
	scr_player_move(point_direction(other.x,other.y,x,y),5);
	scr_damage(10*bRes,other.num,other.attack, other.icon, false);
	if(global.screenShake < 6)
		global.screenShake = 6;
}