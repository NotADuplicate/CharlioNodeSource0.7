/// @description Take damage
if(other.num != num && hp < maxhp * 0.35) {
	if(global.invincibility == 0) {
		scr_ball_sound(snd_church_bell, x, y)
	}
	scr_damage(1000,other.num,false, spr_grave, false)
}