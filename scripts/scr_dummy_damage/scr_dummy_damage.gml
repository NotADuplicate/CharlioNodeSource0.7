// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_dummy_damage(dmg,dealer,type, icon, DoT){
	if(invincibility > 0 || hp <= 0 || (global.teamNum[dealer] == global.teamNum[num] && dealer != num)) {
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
	with(ball_game) {
		node_send(buffer,"eventName","Damage Dealt","Dealer",dealer,"Target",other.num,"Amount",dmg,"Ability",type)
	}
	if(hp <= 0 && !dummy) {
		with(ball_game) {
			node_send(buffer,"eventName","Death","Target",other.num,"Killer",dealer, "Icon", icon, "Assister", 0)
			node_send(buffer,"eventName","Bullet","Num",other.num,"X", other.x, "Y", other.y, "Obj", ball_corpse, "Dir", 0)
		}
		maxhp = 250;
		hp = maxhp;
		path_end();
		x = -500;
		y = -500;
		state = "Dead";
		speed = 0;
		poisonDmg = 0;
		alarm[3] = link.setRespawnTimer * 30; //respawn
		scr_cleanse(false);
	} else if(dummy) {
		if(sprite_index == spr_dummy) { sprite_index = spr_dummyHit; }
	}
}