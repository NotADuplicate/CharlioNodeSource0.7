/// @description Take dmg
scr_creep_damage(60,other.num)
if(global.teamNum[other.num] != side) 
	instance_destroy(other);