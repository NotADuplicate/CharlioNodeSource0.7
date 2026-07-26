/// @description Insert description here
// You can write your code in this editor
if(global.teamNum[other.num] != global.teamNum[num]) {
	scr_dummy_damage(other.dmg,other.num,true, other.icon, false);
    motion_add(other.direction,other.dmg/5);
    instance_destroy(other);
}