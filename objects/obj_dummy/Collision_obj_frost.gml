/// @descriptio Damage and slow
if(global.teamNum[other.num] != global.teamNum[num]) {
	scr_dummy_damage(20,other.num,false, spr_frost, false)
	instance_destroy(other);
	frost = 120;
}