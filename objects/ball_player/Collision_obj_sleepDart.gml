/// @description Get slept
if(other.num != num) {
    scr_damage(Abilities.sleepDart.damage,other.num,false);
	instance_destroy(other);
	if(global.teamNum[other.num] != global.teamNum[num] && global.invincibility = 0) {
		with(ball_game) {
			node_send(buffer,"eventName","Status","Target",ball_player.num,"Status Num", 24)
		}
	}
}