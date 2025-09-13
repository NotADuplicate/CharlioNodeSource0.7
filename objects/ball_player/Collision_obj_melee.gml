/// @description Take damage
if(other.num != num && ghosting == 0) {
    scr_damage(other.dmg,other.num,true);
    instance_destroy(other);
	scr_player_move(other.direction,18);
}

