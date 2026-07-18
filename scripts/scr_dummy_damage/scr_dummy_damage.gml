// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_dummy_damage(dmg,dealer,type, icon, DoT){
	if(invincibility > 0 || global.teamNum[dealer] == global.teamNum[num]) {
		return;
	}
	if(type) {
		dmg *= global.players[dealer].atk
	}
	else {
		dmg *= global.players[dealer].magic
	}
	if(broken > 0) {
		dmg *= 2
	}
	hp -= dmg;
	if(type && global.players[argument[1]].firePassive > 0) {
		var duration = global.players[argument[1]].firePassive*30;
		magicBurn = max(magicBurn, duration);
	}
	recentDamageIcon = icon;
	if(dealer == ball_player.num)
		scr_deal_damage(num,dmg,type);
}