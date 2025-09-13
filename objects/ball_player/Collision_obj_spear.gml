/// @descriptio Damage and bleed
if(global.teamNum[num] != global.teamNum[other.num]) {
	scr_damage(Abilities.armorBreak.damage,other.num,false)
	instance_destroy(other);
	if(global.invincibility = 0) {
		with(ball_game) {
			node_send(buffer,"eventName","Status","Target",ball_player.num,"Status Num", 16)
		}
	}
}