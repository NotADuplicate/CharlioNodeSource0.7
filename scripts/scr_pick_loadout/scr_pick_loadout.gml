function scr_pick_loadout(){
	abilityList = [Abilities.shuriken, Abilities.frost, Abilities.axe, Abilities.blastOff, Abilities.bloodshot, Abilities.cleaver, Abilities.dash, Abilities.healBomb, Abilities.molotov, Abilities.block, Abilities.implosion];
	ability1 = choose(Abilities.shuriken, Abilities.frost, Abilities.axe, Abilities.blastOff, Abilities.bloodshot, Abilities.cleaver, Abilities.dash, Abilities.healBomb, Abilities.molotov);
	show_debug_message(ability1.name)
	gunObj = choose(Abilities.melee,Abilities.shotgun,Abilities.grenade,Abilities.pistol);
	show_debug_message(gunObj.name)

	var _weights = { damage: 1, ballPush: 0.5, healing: 0.75, selfDamage: -1, mobility: 0.25, ammoSupply: 4, effectiveness: 1 };
	var _caps = { damage: 10, ballPush: 5, healing: 5, mobility: 5, CC: 5, fire:3, ammoSupply: 2 };
	var _selectingFrom = [];

	var _ranked = ability_recommend(abilityList, [ability1,gunObj], _weights);
	i = 0;
	repeat(3) {
		show_debug_message(_ranked[i].ability.name)
		show_debug_message(_ranked[i].score);
		i++;
	}
	ability2 = pick_loadout_option(_ranked, mistakes);
	show_debug_message("Picked")
	show_debug_message(ability2.name)

	_ranked = ability_recommend(abilityList, [ability1,ability2,gunObj], _weights);
	i = 0;
	repeat(3) {
		show_debug_message(_ranked[i].ability.name)
		show_debug_message(_ranked[i].score);
		i++;
	}
	ability3 = pick_loadout_option(_ranked, mistakes);
}

function pick_loadout_option(_ranked, mistakes) {
	switch(mistakes) {
		case 0:
			return choose(_ranked[0].ability, _ranked[0].ability, _ranked[1].ability);
		case 1: 
			return choose(_ranked[0].ability, _ranked[1].ability, _ranked[2].ability);
		case 2: 
			return choose(_ranked[0].ability, _ranked[1].ability, _ranked[1].ability, _ranked[2].ability);
		case 3:
			return choose(_ranked[0].ability, _ranked[1].ability, _ranked[2].ability, _ranked[2].ability);
	}
}