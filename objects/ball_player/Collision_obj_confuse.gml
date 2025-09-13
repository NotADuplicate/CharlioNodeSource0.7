/// @descriptio Damage and become confused
if(global.teamNum[num] != global.teamNum[other.num]) {
	scr_damage(20,other.num,false)
	instance_destroy(other);
		with(ball_game) {
			node_send(buffer,"eventName","Status","Target",ball_player.num,"Status Num", 34)
		}
}