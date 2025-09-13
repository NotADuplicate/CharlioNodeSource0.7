/// @description Regen some health
if(decay > 0)
	scr_damage(5+regenRate,decayNum,false);
else if(hp < maxhp) {
	hp += regen + (regenRate-1)*4;
	if(hp > maxhp) {
		if(overheal == false)
			hp = maxhp;
	}
}
if(poison > 0) {
	scr_damage(poisonDmg,poisonedNum,false)
	poisonDmg += 0.9;
}
//else
	//poisonDmg = 0;
alarm[3] = 30;
with(ball_game) {
	node_send(buffer,"eventName","Player Health","Num",ball_player.num,"Hp",round(ball_player.hp))		
}