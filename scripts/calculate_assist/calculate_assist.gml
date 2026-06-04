function calculate_assist(killer){
	global.assistScore[killer] = 0;
	var i = 0;
	while(i < ds_list_size(global.damageSources)) {
		source = global.damageSources[|i];
		if(source.dealer != killer && source.dealer != ball_player.num) {
			global.assistScore[source.dealer] += source.dmg;
		}
		
		i++;
	}
	
	with(ball_player) {
		if(frost > 0 && frostNum > 0) {
			global.assistScore[frostNum] += 100;
		}
		if(bleed > 0 && bleedNum > 0) {
			global.assistScore[bleedNum] += 100;
		}
		if(stunned > 0 && stunNum > 0) {
			global.assistScore[stunNum] += 150;
		}
	}
	
	if(global.players[killer].enraged && global.players[killer].enrageNum > 0 && global.players[killer].enrageNum != killer) {
		global.assistScore[global.players[killer].enrageNum] += 170;
	}
	
	maxScore = 65;
	assister = 0;
	i = 0;
	repeat(global.loop) {
		if(global.assistScore[i] > maxScore && global.teamNum[i] != global.teamNum[ball_player.num] && i != killer) {
			maxScore = global.assistScore[i];
			assister = i;
		}
		i++;
	}
	
	return assister;
}