/// @description Send abilities selected
with(ball_game) {
	node_send(buffer,"eventName","Loadout","Num",other.num,"Slot",1,"Ability",other.ability1.abilityIndex)
	node_send(buffer,"eventName","Loadout","Num",other.num,"Slot",2,"Ability",other.ability2.abilityIndex)
	node_send(buffer,"eventName","Loadout","Num",other.num,"Slot",3,"Ability",other.ability3.abilityIndex)
	node_send(buffer,"eventName","Gun Picked","Gun Name",other.gunObj.name, "Num", other.num);
}
