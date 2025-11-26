/// @description Crit on fire, slam in direction its swinging
if(global.teamNum[other.num] != global.teamNum[num] && other.active) {
	scr_player_move(point_direction(other.x,other.y,x,y)+90,18)
	if(burn > 0)
		scr_damage(Abilities.axe.critDamage,other.num,false, spr_fireaxe, false);
	else
		scr_damage(Abilities.axe.damage,other.num,false, spr_fireaxe, false);
	other.active = false
}