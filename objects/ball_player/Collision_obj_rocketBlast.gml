/// @description Get pushed
if(other.num != num) {
	if(frost > 0) {
		frost = 0;
		global.slow = 1;
	}
    scr_damage(Abilities.blastOff.damage,other.num,false);
	burnNum = other.num
	scr_player_move(other.direction,5);
	if(global.teamNum[other.num] != global.teamNum[num] && global.invincibility = 0) {
		with(ball_game) {
			node_send(buffer,"eventName","Status","Target",ball_player.num,"Status Num", 18)
		}
	}
}