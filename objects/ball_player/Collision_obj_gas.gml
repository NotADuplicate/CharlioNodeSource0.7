/// @description Damage and poison
if(global.teamNum[num] != global.teamNum[other.num]) {
	if(global.invincibility = 0) {
		scr_damage(1,other.num,false, spr_caustic, true)
		poisonedNum = other.num
		global.slow = .5;
		ball_game.alarm[7] = 2;
		with(ball_game) {
			node_send(buffer,"eventName","Status","Target",ball_player.num,"Status Num", 13)
		} 
	}
}