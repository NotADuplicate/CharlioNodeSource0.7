// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_crossfade(newMusic, time){
	audio_sound_gain(global.music,0,time);
	global.music = audio_play_sound(newMusic,0,true);
	audio_sound_gain(global.music,0,time);
}