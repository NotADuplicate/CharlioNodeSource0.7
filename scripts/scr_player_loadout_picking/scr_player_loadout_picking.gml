// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_player_loadout_picking(Num){ //all arguments start w caps
	with(obj_playerUI) {
		if(num == Num) {
			other.ins = self; //set the ins to the player ui that shares this number
		}
	}
}