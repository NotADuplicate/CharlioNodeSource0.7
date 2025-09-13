/// @description Play enrage music
if(audio_is_playing(global.music) == false && ball_player.enraged) { //go from enrage sound to enraged music
	audio_stop_sound(global.music)
	global.music = audio_play_sound(mus_shred,0,true,global.musVolume);
}
else if((audio_is_playing(mus_shred) || audio_is_playing(mus_shredIntro)) && ball_player.enraged == false) {
	//scr_crossfade(mus_letsBall,2000);
	audio_stop_sound(global.music)
	global.music = audio_play_sound(track,0,true,0);
	audio_sound_gain(global.music,global.musVolume,1000)
}
//Play duel music
else if(audio_is_playing(mus_duel) && audio_sound_get_track_position(global.music) > 19.6 && ball_player.duel > 0) { //go from enrage sound to enraged music
	audio_stop_sound(global.music)
	global.music = audio_play_sound(track,0,true,global.musVolume);
	ball_player.duel = 1;
}
else if((audio_is_playing(mus_duel) && ball_player.duel == 0)) {
	//scr_crossfade(mus_letsBall,2000);
	audio_stop_sound(global.music)
	global.music = audio_play_sound(track,0,true,0);
	audio_sound_gain(global.music,global.musVolume,1000)
}
else if(audio_is_playing(global.music) == false) { //if not playing anything then play smth
	global.music = audio_play_sound(track,0,true,0);
	audio_sound_gain(global.music,global.musVolume,1000)
}