/// @description Take damage
if(other.num != num) {
	if(poison > 0)
		scr_damage(Abilities.ninjaSlash.critDamage,other.num,false);
	else
		scr_damage(Abilities.ninjaSlash.damage,other.num,false);	
    instance_destroy(other);
	scr_player_move(other.direction,18);
}

