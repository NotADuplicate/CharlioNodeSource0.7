/// @description Set loadout
alreadySelected = false;
for(i =0; i < 8; i++) {
	if(global.loadoutSet[global.selectedLoadout][i] == global.utilityClass) {
		alreadySelected = true;
	}
}
if(!alreadySelected) {
	global.loadoutSet[global.selectedLoadout][loadoutNum] = global.utilityClass;
}