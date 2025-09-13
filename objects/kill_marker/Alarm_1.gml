/// @description Insert description here
// You can write your code in this editor
global.deaths[victim]++;
if(killer == victim) {
	suicide = true;
}
else {
	global.kills[killer]++;
	if(killer == ball_player.num) {
		audio_play_sound(snd_kill,2,false)
	}
}