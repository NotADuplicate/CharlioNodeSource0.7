/// @description Create link player
if(global.testMode) {
	scr_createBallPlayer(num);
}
show_debug_message("Creating link:")
show_debug_message(object_get_name(global.players[num].object_index))
link = global.players[num];


scr_pick_enemy();
tower = scr_pick_tower(false);

if(setLoadout = false) { //if not preset loadout
	alarm[9] = 2;
} else {
	with(ball_game) {
		node_send(buffer,"eventName","Gun Picked","Gun Name",other.gunObj.name, "Num", other.num);
	}
	if(ability1 != noone) {
		with(ball_game) {
			node_send(buffer,"eventName","Loadout","Num",other.num,"Slot",1,"Ability",other.ability1.abilityIndex) 
		}
	}
	if(ability2 != noone) {
		with(ball_game) {
			node_send(buffer,"eventName","Loadout","Num",other.num,"Slot",2,"Ability",other.ability2.abilityIndex) 
		}
	}
	if(ability3 != noone) {
		with(ball_game) {
			node_send(buffer,"eventName","Loadout","Num",other.num,"Slot",3,"Ability",other.ability3.abilityIndex) 
		}
	}
}