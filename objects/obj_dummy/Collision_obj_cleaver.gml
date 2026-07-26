/// @descriptio Damage and bleed
if(global.teamNum[other.num] != global.teamNum[num]) {
	scr_dummy_damage(20,other.num,false, spr_cleaver, false)
	instance_destroy(other);
	bleed = 90;
}