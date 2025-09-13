/// @description Take damage
if(ghosting == 0 || other.attack == false) {
	scr_damage(round(other.dmg*bRes),other.num,other.attack);
	scr_player_move(other.direction,other.dmg/3);
	instance_destroy(other);
}