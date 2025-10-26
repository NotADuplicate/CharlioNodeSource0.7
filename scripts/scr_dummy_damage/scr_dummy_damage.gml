// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_dummy_damage(dmg,dealer,type){
	if(invincibility > 0) {
		show_debug_message("Invincible:")
		show_debug_message(string(invincibility))
		return;
	}
	if(type) {
		dmg *= ball_player.atk
	}
	else {
		dmg *= ball_player.magic
	}
	if(broken > 0) {
		dmg *= 2
	}
	hp -= dmg;
	if(global.players[argument[1]].firePassive && type) {
		magicBurn = 45;
	}
	scr_deal_damage(2,dmg,type);
}