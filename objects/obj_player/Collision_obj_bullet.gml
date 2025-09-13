/// @description Take damage
if(other.num != num) {
    scr_damage(round(other.dmg*def),other.num);
    motion_add(other.direction,other.dmg/3);
    instance_destroy(other);
}

