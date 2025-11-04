// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_insert_damage_source(amount, damager, dmgIcon){
	var damageSource = {
			dmg: amount,
			dealer: damager,
			icon: dmgIcon,
			timeInflicted: current_time
		}
	if(ds_list_size(global.damageSources) == 0) {
		ds_list_add(global.damageSources, damageSource);
	} else {
		var i = 0;
		var source;
		while(i < ds_list_size(global.damageSources)) {
			source = global.damageSources[|i];
			if(source.icon == damageSource.icon && source.dealer == damageSource.dealer) { //combine damage of both sources
				damageSource.dmg += source.dmg;
				ds_list_delete(global.damageSources, i);
				i = ds_list_size(global.damageSources)
			}
			i++;
		}
		ds_list_add(global.damageSources, damageSource)
	}
}