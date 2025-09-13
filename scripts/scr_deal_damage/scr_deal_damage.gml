// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_deal_damage(target,dmg,attack){
	if(global.players[target].milked > 0) {
		scr_heal(dmg,global.players[target].milkNum);
	}
	if(ball_player.lifeSteal > 0) {
		scr_heal(dmg*ball_player.lifeSteal,ball_player.num);
	}
	if(global.boot = "Blood") 
		ball_player.bloodThirst = 40;
	if(attack) {// && global.mark = true) {
		global.marked = global.players[target]
		ball_game.alarm[5] = 60;
	}
	
}