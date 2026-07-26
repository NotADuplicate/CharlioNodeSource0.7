/// @description Damage and bleed
if(global.teamNum[other.num] != global.teamNum[num]) {
	scr_dummy_damage(20,other.num,false, spr_knife, false)
	instance_destroy(other);
	poison = 360;
}