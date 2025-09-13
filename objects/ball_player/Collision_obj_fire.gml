/// @description Burn
if(global.teamNum[other.num] != global.teamNum[num] || other.num == num) {
	scr_damage(Abilities.molotov.dps/30,other.num,false);
	if(frost > 0) {
		frost = 0;
		global.slow = 1;
	}
	if(burn < 300 && spellShield == 0) {
		burn += 10;
		burnNum = other.num
	}
}