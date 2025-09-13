/// @description Insert description here
// You can write your code in this editor
if(global.teamNum[other.num] != global.teamNum[num]) {
	scr_damage(200,other.num,false)
	instance_destroy(other);
}