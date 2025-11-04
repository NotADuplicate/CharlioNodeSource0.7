/// @description Insert description here
// You can write your code in this editor
if(global.teamNum[other.num] != global.teamNum[num]) {
	scr_damage(100,other.num,false, spr_blood, false)
	instance_destroy(other);
}