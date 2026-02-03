function array_count(_array, num) {
    var _count = 0;
    var _length = array_length(_array); // Get the length of the array
    
    // Loop through each element of the array (arrays start at index 0)
    for (var i = 0; i < _length; i++) {
        if (_array[i] == num) {
            _count++; // Increment the counter if it is
        }
    }
    
    return _count;
}

function scr_rumble_setup(){
	non_rumble_abilities = [20, 28, 38]; //TP, holster, revive
	
	obj_client.rumbleSetup = true;
	obj_client.loadoutPicking = true;
	with(obj_playerUI) {
		y -= 80;
		height = 70;
	}
	instance_destroy(left_team);
	instance_destroy(right_team);
	NUMBER_OF_ABILITIES = 8;
	NUMBER_OF_PASSIVES = 8;
	abilityLength = array_length(Abilities.list)
	passiveLength = array_length(Passives.list)-4
	pickedAbilities = [];
	pickedPassives = [];
	var xposition = 80;
	var yposition = 180;
	repeat(NUMBER_OF_ABILITIES) {
		abilityIndex = irandom_range(0,abilityLength-1)
		while(array_contains(pickedAbilities, abilityIndex) || array_contains(non_rumble_abilities, abilityIndex)) {
			abilityIndex = irandom_range(0,abilityLength);
		}
		ob = instance_create(xposition, yposition, inst_utility);
		ob.utility = Abilities.list[abilityIndex];
		array_push(pickedAbilities, abilityIndex)
		xposition += 70;
		if(xposition > 350) {
			xposition = 80;
			yposition += 70;
		}
	}
	xposition = 80;
	yposition = 400;
	
	repeat(NUMBER_OF_PASSIVES) {
		passiveIndex = irandom_range(0,passiveLength-1)
		passiveOb = Passives.list[passiveIndex];
		
		while(array_count(pickedPassives,passiveIndex) >= passiveOb.maxStacks) {
			passiveIndex = irandom_range(0,passiveLength-1)
			passiveOb = Passives.list[passiveIndex];
		}
		
		ins = instance_create(xposition, yposition, inst_passive);
		
		array_push(pickedPassives, passiveIndex)
		ins.spr = passiveOb.sprite;
		ins.str = passiveOb.text;
		xposition += 70;
		if(xposition > 350) {
			xposition = 80;
			yposition += 70;
		}
	}
	
	instance_create(60,600,select_right);
	instance_create(120,600,select_Q);
	instance_create(180,600,select_space);
}