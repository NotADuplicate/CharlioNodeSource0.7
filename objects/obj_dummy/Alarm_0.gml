/// @description Regen hp and be poisoned

if(poison > 0) {
	scr_dummy_damage(poisonDmg,ball_player.num,false, spr_poison, true)
	poisonDmg += 0.9;
	poison -= 30;
	if(poison < 1)
		poisonDmg = 0;
}
alarm[0] = 30;