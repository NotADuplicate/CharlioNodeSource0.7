/// @description Insert description here
// You can write your code in this editor
if(other.dmg == 17)
	hp -= 10;
else
	hp -= other.dmg*1.5
instance_destroy(other);
	num = other.num