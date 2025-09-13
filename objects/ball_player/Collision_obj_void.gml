/// @description Insert description here
// You can write your code in this editor
if(global.teamNum[other.num] != global.teamNum[num] && other.active && ghosting == 0) {
	scr_damage(other.dmg,other.num,true)
	instance_destroy(other);
}