/// @description Damage and bleed
if(global.teamNum[num] != global.teamNum[other.num]) {
	scr_damage(Abilities.poisonDagger.damage,other.num,false, spr_knife, false)
	poisonedNum = other.num
	instance_destroy(other);
	scr_ball_sound(snd_poison,x,y)
	if(global.invincibility = 0) {
		with(ball_game) {
			node_send(buffer,"eventName","Status","Target",ball_player.num,"Status Num", 12)
		} 
	}
}