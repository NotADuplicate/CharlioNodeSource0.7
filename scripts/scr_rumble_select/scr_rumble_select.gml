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
			with(obj_playerUI) { //show gun 
				if(num == selecter) {
					loadoutPicked = true;
					array_push(passives, index)
					show_debug_message(passives)
				}
			}
		break;
		case "Gun":
			show_debug_message("Destroying gun")
			with(inst_atk) {
				if(spr == index) {
					instance_destroy();
				}
			}
			with(obj_playerUI) { //show gun 
				if(num == selecter) {
					loadoutPicked = true;
					gun = index;
				}
			}
		break;
	}
}