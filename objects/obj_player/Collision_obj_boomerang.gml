/// @description Take damage
if(other.num == num && other.speed > 0) {

}
else {
    scr_damage(other.dmg,other.num);
    if(global.invincibility == 0) {
        motion_add(other.direction,other.speed/3);
        global.invincibility = 10;
    }
}

