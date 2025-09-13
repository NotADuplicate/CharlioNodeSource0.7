/// @descriptio Damage and bleed
if(global.teamNum[num] != global.teamNum[other.num]) {
	scr_damage(Abilities.frost.damage,other.num,false)
	instance_destroy(other);
	if(global.invincibility = 0) {
		with(ball_game) {
			node_send(buffer,"eventName","Status","Target",ball_player.num,"Status Num", 17)
		}
	}
}
else if(other.num != num) { //unfire
	burn = 0;
}