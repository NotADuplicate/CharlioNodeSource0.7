/// @description Take damage
other.dmg = (maxhp-hp)*.3;
hp -= other.dmg
instance_destroy(other);