/// @description Take damage
scr_damage(round(other.dmg*bRes),other.num);
motion_add(other.direction,other.dmg/3);
instance_destroy(other);

