/// @description Take dmg
scr_creep_damage(other.dmg,other.num)
if(global.teamNum[other.num] != side) 
	instance_destroy(other);