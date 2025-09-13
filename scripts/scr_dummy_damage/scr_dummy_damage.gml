// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_dummy_damage(dmg,dealer,type){
	if(type) {
		dmg *= ball_player.atk
	}
	else {
		dmg *= ball_player.magic
	}
	if(broken > 0)
		dmg *= 2
	if(invincibility == 0)
		hp -= dmg
	scr_deal_damage(2,dmg,type);
}