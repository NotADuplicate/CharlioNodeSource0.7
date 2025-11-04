/// @description Start
if(global.gameMode == "Comp") {
	global.attack = global.loadoutSet[global.selectedLoadout][8]
	global.holster = global.loadoutSet[global.selectedLoadout][9]
}
instance_create(0,0, obj_damageSourcer)