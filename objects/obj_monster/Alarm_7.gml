/// @description Poison ticks
if(poison > 0) {
	scr_monster_dmg(poisonDmg,poisonNum,false);
	poison -= 10;
	poisonDmg += 0.45;
	num = poisonNum 
}
else
	poisonDmg = 0;
	
alarm[7] = 10;