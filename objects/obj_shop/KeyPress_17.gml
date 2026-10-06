/*var _weights = { damage: 10, ballPush: 0.5, healing: 0.75, selfDamage: -1, mobility: 0.25, ammoSupply: 4, effectiveness: 1, buffs: 0.75 };
var _caps = { damage: 10, ballPush: 5, healing: 5, mobility: 5, CC: 5, fire:3, ammoSupply: 2 };
var selectingFrom = [];
var i = 0;
var currentLoadout = [];
repeat(array_length(Abilities.list)) {
	if(Abilities.list[i].unlocked) {
		array_push(selectingFrom, Abilities.list[i]);
	}
	i++;
}
i = 0;
repeat(array_length(Passives.list)) {
	if(Passives.list[i].unlocked) {
		array_push(selectingFrom, Passives.list[i]);
		if(variable_instance_exists(Passives.list[i], "stacks")) {
			show_debug_message("Getting passive stacks")
			show_debug_message(Passives.list[i].stacks)
			repeat(Passives.list[i].stacks) {
				array_push(currentLoadout, Passives.list[i]);
			}
		}
	}
	i++;
}
repeat(3) {
	if(global.knownLoadout[ball_player.num,i]) {
		array_push(currentLoadout, global.knownLoadout[ball_player.num,i]);
	}
}

show_debug_message("Current loadout")
show_debug_message(array_length(currentLoadout))

var _ranked = ability_recommend(selectingFrom, currentLoadout, _weights, _caps);
show_debug_message(_ranked[0])
show_debug_message(_ranked[1])