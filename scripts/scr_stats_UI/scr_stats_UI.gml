// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_stats_UI(ability, up, passiveAdjusted, user){
	cd = ability.cooldown;
	if(passiveAdjusted) { cd /= global.players[user].cdr; }
	var statString =  "Ammo: "+string(ability.ammoCost) + "\nCooldown: " + string(round(cd));
	var height = 60*up;
	if(variable_instance_exists(ability, "damage")) {
		dmg = ability.damage;
		if(passiveAdjusted) {
			dmg *= global.players[user].magic;
			if(global.teamNum[ball_player] != global.teamNum[user]) {
				dmg /= global.resistance;
			}
		}
		statString += "\nDamage: "+string(round(dmg));
		height+=25*up;
	} 
	if(variable_instance_exists(ability, "duration")) {
		statString += "\nDuration: "+string(round(ability.duration));
		height+=25*up;
	}
	if(variable_instance_exists(ability, "dps")) {
		dmg = ability.dps;
		if(passiveAdjusted) {
			dmg *= global.players[user].magic;
			if(global.teamNum[ball_player] != global.teamNum[user]) {
				dmg /= global.resistance;
			}
		}
		statString += "\nDPS: "+string(round(dmg));
		height+=25*up;
	}
	if(variable_instance_exists(ability, "critDamage")) {
		dmg = ability.critDamage;
		if(passiveAdjusted) {
			dmg *= global.players[user].magic;
			if(global.teamNum[ball_player] != global.teamNum[user]) {
				dmg /= global.resistance;
			}
		}
		statString += "\nCrit Damage: "+string(round(dmg));
		height+=25*up;
	}
	if(variable_instance_exists(ability, "maxDamage")) {
		dmg = ability.maxDamage;
		if(passiveAdjusted) {
			dmg *= global.players[user].magic;
			if(global.teamNum[ball_player] != global.teamNum[user]) {
				dmg /= global.resistance;
			}
		}
		statString += "\nMax Damage: "+string(round(dmg));
		height+=25*up;
	}
	if(variable_instance_exists(ability, "healing")) {
		healing = ability.healing;
		if(passiveAdjusted) {
			healing *= global.players[user].healing;
		}
		statString += "\nHealing: "+string(round(healing));
		height+=25*up;
	}
	return [statString, height]
}