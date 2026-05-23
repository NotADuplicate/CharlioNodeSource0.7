function scr_abilitySet(abilityIndex, slot){
	if(abilityIndex == -1)
		ability = 0;
	else
		ability = Abilities.list[abilityIndex];
	switch(slot) {
		case 1:
			global.right = ability
			break;
		case 2:
			global.Q = ability
			break;
		case 3:
			global.space = ability
			break;
		case 4:
			global.R = ability
			break;
	}
}