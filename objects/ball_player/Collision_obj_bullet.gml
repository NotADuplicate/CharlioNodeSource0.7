/// @description Take damage
if(other.num != num && ghosting == 0) {
    scr_damage(other.dmg,other.num,true);
	if(other.dmg == 10)
		scr_player_move(other.direction,other.dmg/3);
	else
		scr_player_move(other.direction,other.dmg/5);
    instance_destroy(other);
}

