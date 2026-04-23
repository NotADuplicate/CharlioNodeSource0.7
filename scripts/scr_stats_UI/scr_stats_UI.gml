// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_stats_UI(ability, up){
	var statString =  "Ammo: "+string(ability.ammoCost) + "\nCooldown: " + string(ability.cooldown);
	var height = 60*up;
	if(variable_instance_exists(ability, "damage")) {
		statString += "\nDamage: "+string(ability.damage);
		height+=25*up;
	} 
	if(variable_instance_exists(ability, "duration")) {
		statString += "\nDuration: "+string(ability.duration);
		height+=25*up;
	}
	if(variable_instance_exists(ability, "dps")) {
		statString += "\nDPS: "+string(ability.dps);
		height+=25*up;
	}
	if(variable_instance_exists(ability, "critDamage")) {
		statString += "\nCrit Damage: "+string(ability.critDamage);
		height+=25*up;
	}
	if(variable_instance_exists(ability, "maxDamage")) {
		statString += "\nMax Damage: "+string(ability.maxDamage);
		height+=25*up;
	}
	if(variable_instance_exists(ability, "healing")) {
		statString += "\nHealing: "+string(ability.healing);
		height+=25*up;
	}
	return [statString, height]
}