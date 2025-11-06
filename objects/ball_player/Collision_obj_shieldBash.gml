/// @description Stun
if(other.num != num && global.invincibility == 0) {
	scr_player_move(other.direction,8)
	if(global.teamNum[other.num] != global.teamNum[num]) {
		with(ball_game) {
			node_send(buffer,"eventName","Targeted Status","Target",ball_player.num,"Status Num",20,"User",40)
		}
		scr_damage(70,other.num,false, SD_shieldBash, false)
	}
	global.invincibility = 5;
}