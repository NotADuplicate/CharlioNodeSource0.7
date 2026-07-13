/// @description Insert description here
// You can write your code in this editor
if(other.dmg = 13)
	scr_monster_dmg(7,other.num,other.attack)
else {
	show_debug_message("monster explode")
	show_debug_message(other.dmg)
	scr_monster_dmg(other.dmg,other.num,other.attack)
}
instance_destroy(other);