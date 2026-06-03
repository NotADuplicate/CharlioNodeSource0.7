function scr_shootable(){
	if(global.options == false && instance_exists(ball_player) && held == false && 
	global.shop == false && global.stun == 0 && ball_player.jam == 0 && global.throwRange <= 0) {
		return true;
	}
	else { 
		return false; 
	}
}