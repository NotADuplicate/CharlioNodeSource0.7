/// @description Take damage
if(other.num != num) {
    scr_damage(150,other.num);
    instance_destroy(other);
}

