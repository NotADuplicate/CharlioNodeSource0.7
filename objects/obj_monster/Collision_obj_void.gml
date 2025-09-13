/// @description Insert description here
// You can write your code in this editor
if(other.active) {
	scr_monster_dmg(other.dmg*1.5,other.num,false)
	instance_destroy(other);
}