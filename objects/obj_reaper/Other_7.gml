/// @description Reap
if(sprite_index = spr_reaperSlash) {
	with(ball_player) {
		if(num == other.num)
			scr_damage(other.dmg,other.userNum,false, spr_reaper, false)
	}
	instance_destroy()
}