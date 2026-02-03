function scr_rumble_select(type, selecter, index){
	switch(type) {
		case "Ability":
			with(inst_utility) {
				if(utility.abilityIndex == index) {
					instance_destroy();
				}
			}
		break;
		case "Passive":
			var deletedPassive = false;
			with(inst_passive) {
				if(passiveIndex == index && !deletedPassive) {
					instance_destroy();
					deletedPassive = true;
				}
			}
		break;
		case "": 
		break;
	}
}