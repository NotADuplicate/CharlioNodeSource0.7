/// @description Take damage
if(other.num != num && ghosting == 0 && other.active) {
    scr_damage(other.dmg,other.num,true);
    other.active = false;
	scr_player_move(other.direction,18);
}