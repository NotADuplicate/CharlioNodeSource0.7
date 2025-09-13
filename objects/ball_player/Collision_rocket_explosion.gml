/// @description Knockback
if(other.player) {
	scr_player_move(point_direction(other.x,other.y,x,y),19);
	scr_damage(40,other.num,false);
	if(global.screenShake < 6)
		global.screenShake = 6;
	if(other.num == num) {
		if(global.right == Abilities.rocket)
			global.rightCool = 0.5;
		if(global.space == Abilities.rocket)
			global.spaceCool = 0.5;
		if(global.Q == Abilities.rocket)
			global.QCool = 0.5;
		if(global.R == Abilities.rocket)
			global.RCool = 0.5;
	}
	other.player = false;
}