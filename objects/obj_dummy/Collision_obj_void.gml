/// @description Insert description here
// You can write your code in this editor
if(other.active) {
	scr_dummy_damage(other.dmg,other.num,true, spr_biggun, false)
	instance_destroy(other)
}