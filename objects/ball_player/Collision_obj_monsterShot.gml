/// @description Take damage
	if(chummed > 0)
		scr_damage(round(other.dmg*2.3),chumNum,false, spr_meat, false)
	else
		scr_damage(other.dmg,num,false, spr_skull, false);
	if(dmg > 40) {
		scr_player_move(other.direction,other.dmg/3);
	}
    instance_destroy(other);