/// @description Clean up old damage sources
if(ds_list_size(global.damageSources) > 0 && !global.dead) {
	if(global.damageSources[|0].timeInflicted < current_time-10000) {
		ds_list_delete(global.damageSources, 0);
	}
	if(ball_player.hp >= ball_player.maxhp) {
		ds_list_clear(global.damageSources);
	}
}

if(global.dead && justAlive) {
	damageSources = [[]];
	damageDealers = [];
	justAlive = false;
	
	var i = 0;
	var q = 0;
	var source;
	var placed;
	show_debug_message("Trying to place damage sources")
	while(i < ds_list_size(global.damageSources)) {
		source = global.damageSources[|i];
		show_debug_message(source)
		q = 0;
		placed = false; //indicates its been assigned to a damage dealer
		while(q < array_length(damageDealers)) {
			if(damageDealers[q] == source.dealer) {
				array_push(damageSources[q], source)
				show_debug_message("Placed source")
				placed = true
			}
			q++;
		}
		if(!placed) {
			show_debug_message("Has to add a new damage dealer: " + string(q))
			damageDealers[q] = source.dealer
			if(q == array_length(damageSources)) {
				show_debug_message("Pushed source as array")
				array_push(damageSources, [source])
			} else {
				show_debug_message("Pushed source to array")
				array_push(damageSources[q], source)
			}
		}
		i++;
	}
} else if(!global.dead) {
	justAlive = true
}