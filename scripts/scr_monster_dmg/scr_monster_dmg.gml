// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_monster_dmg(dmg,n,attack){
	if(stasis == 0) {
		if(attack) {
			dmg *= global.players[n].atk
			if(shield > 0)
				dmg *= .3;
		}
		else {
			dmg *= global.players[n].magic
			if(magicShield > 0)
				dmg *= .3;
		}
		if(broken > 0)
			dmg*= 2;
		//hp -= dmg*.65;
		num = n
		if(ball_player.num == n) {
			with(ball_game) { //send monster damage
				node_send(buffer,"eventName","Monster Dmg","Num",other.nameNum,"Dmg",dmg,"Damager",n)
			}
		}
		if(milk > 0 && n == ball_player.num) {
			scr_heal(dmg*ball_player.lifeSteal,ball_player.num);
		}
		if(ball_player.lifeSteal > 0) {
			scr_heal(dmg*ball_player.lifeSteal,ball_player.num);
		}
	}
}