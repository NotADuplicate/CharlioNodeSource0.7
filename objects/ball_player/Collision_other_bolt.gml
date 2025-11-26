/// @description Get hit
if(other.speed > 0 && other.num != num && ghosting == 0) {
    scr_damage(other.dmg,other.num,true, spr_rifle, false);
    instance_destroy(other);
    scr_player_move(other.direction,other.dmg/20);
}
