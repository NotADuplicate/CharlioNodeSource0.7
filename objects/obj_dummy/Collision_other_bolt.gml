/// @description Get hit
if(other.speed > 0) {
    scr_dummy_damage(other.dmg,other.num,true, spr_rifle, false);
    instance_destroy(other);
    motion_add(other.direction,8);
}
