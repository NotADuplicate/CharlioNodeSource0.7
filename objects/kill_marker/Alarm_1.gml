/// @description Insert description here
// You can write your code in this editor
if(killer == victim) {
	suicide = true;
}
	
if(!instance_exists(obj_ending)) {
	global.deaths[victim]++;
	if(!suicide) {
		global.kills[killer]++;
		if(killer == ball_player.num || assister == ball_player.num) {
			audio_play_sound(snd_kill,2,false)
		}
	}
	if(assister > 0) {
		global.assists[assister]++;
	}
}