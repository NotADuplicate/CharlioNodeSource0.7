/// @description Insert description here
// You can write your code in this editor
if(other.speed > 0) {
	scr_monster_dmg(other.dmg*1.5,other.num,true)
	instance_destroy(other);
}