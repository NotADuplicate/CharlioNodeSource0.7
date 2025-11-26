// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_heal(amount, sourceNum){
	if(sourceNum != ball_player.num) {
		amount *= global.players[sourceNum].healing;
	}
	if(ball_player.decay > 0) { //damage instead
		scr_damage(amount,ball_player.decayNum,false, spr_decay, true);
	}
	else { //heal
		ball_player.hp += amount;
		var actual_healed = amount;
		if(ball_player.hp > ball_player.maxhp && ball_player.overheal == false) {
			actual_healed -= ball_player.hp-ball_player.maxhp;
			ball_player.hp = ball_player.maxhp;
		}
		if(sourceNum != ball_player.num) {
			with(ball_game) {
				node_send(buffer, "eventName", "Healing Dealt", "Amount", actual_healed, "Dealer", sourceNum)
			}
		}
	}
}