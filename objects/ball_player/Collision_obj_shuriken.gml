/// @descriptio Damage and bleed
if(global.teamNum[num] != global.teamNum[other.num]) {
	scr_damage(Abilities.shuriken.damage,other.num,false)
	damagedNum = other.num
	instance_destroy(other);
	if(global.invincibility = 0) {
		with(ball_game) {
			node_send(buffer,"eventName","Status","Target",ball_player.damagedNum,"Status Num", 49)
		}
	}
}