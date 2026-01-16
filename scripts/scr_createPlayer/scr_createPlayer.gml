// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_createPlayer(Num,Name,Team,Ready,loadout){ //all arguments start w caps
	ins = noone;
	show_debug_message("Naming player: " + Name)
	with(obj_playerUI) {
		if(num == Num) {
			other.ins = self; //set the ins to the player ui that shares this number
		}
	}
	if(ins == noone) {
		ins = instance_create(0,0,obj_playerUI);
	}
	ins.num = Num;
	ins.named = Name;
	ins.team = Team;
	ins.ready = Ready;
	show_debug_message(typeof(loadout))
	if(loadout != "" && loadout != undefined) {
		ins.loadoutPicked = true;
		for(i = 0; i <10; i++) {
			ins.loadout[i] = (loadout[| i])
			show_debug_message(loadout[| i])
		}
	}
}