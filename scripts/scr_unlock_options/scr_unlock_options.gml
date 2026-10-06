function scr_unlock_options(){
	possibleUnlocks = [Abilities.enrage, Abilities.deathtouch, Abilities.axe, Abilities.implosion, Abilities.grenade, Abilities.minigun];
	unlockOptions = [];
	var i = 0;
	repeat(array_length(possibleUnlocks)) {
		if(possibleUnlocks[i].unlocked == false) {
			array_push(unlockOptions, possibleUnlocks[i]);
		}
		i++;
	}
	if(array_length(unlockOptions) < 1) { return; }
	
	instance_create(0,0,obj_unlockScreen);

	option = instance_create(300,0,obj_unlockOption);
	var unlockIndex = irandom_range(0,array_length(unlockOptions)-1)
	option.item = unlockOptions[unlockIndex];

	if(variable_instance_exists(option.item, "bullet")) {
		option.type = "PRIMARY WEAPON";
	} else {
		option.type = "ABILITY";
	}

	if(array_length(unlockOptions) == 1) {
		option.x = 510;
		return;
	}

	var newUnlockIndex = irandom_range(0,array_length(unlockOptions)-1);
	while(newUnlockIndex == unlockIndex) {
		newUnlockIndex = irandom_range(0,array_length(unlockOptions)-1);
	}
	option = instance_create(750,0,obj_unlockOption);
	option.item = unlockOptions[newUnlockIndex];
	if(variable_instance_exists(option.item, "bullet")) {
		option.type = "PRIMARY WEAPON";
	} else {
		option.type = "ABILITY";
	}
}