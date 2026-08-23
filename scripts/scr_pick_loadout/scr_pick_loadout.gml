function scr_pick_loadout() {
	var abilityList = [Abilities.shuriken, Abilities.frost, Abilities.axe, Abilities.blastOff, Abilities.bloodshot, Abilities.cleaver, Abilities.dash, Abilities.healBomb, Abilities.molotov, Abilities.block, Abilities.implosion];
	ability1 = choose(Abilities.shuriken, Abilities.frost, Abilities.axe, Abilities.blastOff, Abilities.bloodshot, Abilities.cleaver, Abilities.dash, Abilities.healBomb, Abilities.molotov, Abilities.block, Abilities.implosion);
	var picks = [ability1];
	gunPickLast = random(1) > 0.5;
	if(!gunPickLast) { //pick gun first 
		gunObj = choose(Abilities.melee,Abilities.shotgun,Abilities.grenade,Abilities.pistol,Abilities.shotgun);
		array_push(picks,gunObj)
		with(ball_game) {
			node_send(buffer,"eventName","Gun Picked","Gun Name",other.gunObj.name, "Num", other.num);
		}
	} else { show_debug_message("Picking gun last"); }
	
	with(ball_game) {
		node_send(buffer,"eventName","Loadout","Num",other.num,"Slot",1,"Ability",other.ability1.abilityIndex)
	}
	var _picked = scr_pick_level(picks, gunPickLast);
	array_push(picks, _picked);
	_picked = scr_pick_level(picks);
	array_push(picks, _picked);
	return picks;
}

function scr_pick_level(current_loadout, guns = false){
	show_debug_message("Picking level, current loadout:")
	scr_print_loadout(current_loadout)
	show_debug_message("End of Loadout")
	abilityList = [Abilities.shuriken, Abilities.frost, Abilities.axe, Abilities.blastOff, Abilities.bloodshot, Abilities.cleaver, Abilities.dash, Abilities.healBomb, Abilities.molotov, Abilities.block, Abilities.implosion];
	passiveList = [Passives.abilityDamage, Passives.attackDamage, Passives.defense, Passives.resistance, Passives.ammoRegen]
	var selectingFrom = passiveList;
	if(ability3 == noone) { selectingFrom = array_concat(passiveList,abilityList); } //has open ability slots
	if(guns) { selectingFrom = [Abilities.melee,Abilities.shotgun,Abilities.grenade,Abilities.pistol,Abilities.shotgun]}
	
	var _weights = { damage: 1, ballPush: 0.5, healing: 0.75, selfDamage: -1, mobility: 0.25, ammoSupply: 4, effectiveness: 1 };
	var _caps = { damage: 10, ballPush: 5, healing: 5, mobility: 5, CC: 5, fire:3, ammoSupply: 2 };

	var _ranked = ability_recommend(selectingFrom, current_loadout, _weights, _caps);
	var _picked = pick_loadout_option(_ranked, mistakes);
	if(variable_instance_exists(_picked,"cooldown")) { //that means they picked an ability
		if(ability2 == noone) { 
			ability2 = _picked; 
			with(ball_game) {
				node_send(buffer,"eventName","Loadout","Num",other.num,"Slot",2,"Ability",other.ability2.abilityIndex) 
			}
			return _picked; 
		}
		if(ability3 == noone) {
			ability3 = _picked; 
			with(ball_game) {
				node_send(buffer,"eventName","Loadout","Num",other.num,"Slot",3,"Ability",other.ability3.abilityIndex)
			}
			return _picked; 
		}
		throw("Tried to pick 4th ability");
	}
	if(variable_instance_exists(_picked,"minRange")) { //gun
		show_debug_message("Pick gun")
		show_debug_message(_picked.name)
		gunObj = _picked;
		array_push(loadout, gunObj)
		with(ball_game) {
			node_send(buffer,"eventName","Gun Picked","Gun Name",other.gunObj.name, "Num", other.num);
		}
		return _picked;
	}
	// only here if picked a passive
	with(ball_game) {
		node_send(buffer,"eventName","Loadout","Num",other.num,"Slot",5,"Ability",-1, "PassiveIndex", _picked.passiveIndex)
	}
	return _picked;
}

function pick_loadout_option(_ranked, mistakes) {
	i = array_length(_ranked)-1;
	switch(mistakes) {
		case 0:
			return choose(_ranked[0].ability, _ranked[0].ability, _ranked[min(1,i)].ability);
		case 1: 
			return choose(_ranked[0].ability, _ranked[min(1,i)].ability, _ranked[min(1,i)].ability);
		case 2: 
			return choose(_ranked[0].ability, _ranked[min(1,i)].ability, _ranked[min(1,i)].ability, _ranked[min(2,i)].ability);
		case 3:
			return choose(_ranked[1].ability, _ranked[min(1,i)].ability, _ranked[min(2,i)].ability, _ranked[min(2,i)].ability);
	}
}