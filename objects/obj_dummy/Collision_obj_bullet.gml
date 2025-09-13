/// @description Insert description here
// You can write your code in this editor

	scr_dummy_damage(other.dmg,other.num,true);
    motion_add(other.direction,other.dmg/5);
    instance_destroy(other);