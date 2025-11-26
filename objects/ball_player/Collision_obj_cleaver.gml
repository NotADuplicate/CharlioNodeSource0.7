
/// @descriptio Damage and bleed
if(global.teamNum[num] != global.teamNum[other.num]) {
	scr_damage(Abilities.cleaver.damage,other.num,false, spr_cleaver, false)
	instance_destroy(other);
	bleedNum = other.num
	if(global.invincibility = 0) {
		with(ball_game) {
			node_send(buffer,"eventName","Status","Target",ball_player.num,"Status Num", 3)
		}
	}
}