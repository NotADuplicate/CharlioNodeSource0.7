/// @descriptio Damage and bleed
if(other.active) {
	scr_dummy_damage(30,ball_player.num,false)
	other.active = false;
}