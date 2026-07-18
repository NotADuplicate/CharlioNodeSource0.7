/// @description Create link player
scr_createBallPlayer(num);
link = global.players[num];

scr_pick_enemy();
tower = scr_pick_tower(false);
show_debug_message("Picked tower num")
show_debug_message(tower.num);

//Send abilities selected
/*with(ball_game) {
	node_send(buffer,"eventName","Loadout","Num",other.num,"Slot",1,"Ability",other.ability1.abilityIndex)
	node_send(buffer,"eventName","Loadout","Num",other.num,"Slot",2,"Ability",other.ability2.abilityIndex)
	node_send(buffer,"eventName","Loadout","Num",other.num,"Slot",3,"Ability",other.ability3.abilityIndex)
}*/
global.loadout[num,1] = ability1;
global.loadout[num,2] = ability2;
global.loadout[num,3] = ability3;