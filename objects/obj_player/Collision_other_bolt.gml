/// @description Get hit
if(other.speed > 0 && other.num != num) {
    scr_damage(70,other.num);
    instance_destroy(other);
    motion_add(other.direction,10);
}

