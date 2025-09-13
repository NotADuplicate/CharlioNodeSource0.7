/// @description Transition from starter music
if(audio_is_playing(global.music) == false && introMusic) {
	track = mus_letsBall;
	global.music = audio_play_sound(track,0,true,global.musVolume);
	introMusic = false;
}

ballZone = false;
with(obj_bigBall) {
	if(place_meeting(x,y,obj_lastStand)) {
		other.ballZone = true;
	}
}
if(obj_junglePass.garren > 0) {
	if(track != mus_garen) {
		audio_stop_sound(global.music)
		track = mus_garen;
		global.music = audio_play_sound(track,0,false,0);
		audio_sound_gain(global.music,global.musVolume,500)
	}
}
else if(ballZone) {
	if(audio_is_playing(track) && track != mus_lastStand) {
		audio_stop_sound(global.music)
		track = mus_lastStand;
		global.music = audio_play_sound(track,0,false,0);
		audio_sound_gain(global.music,global.musVolume,500)
	}
}
else if(audio_is_playing(mus_lastStand)){
	track = mus_letsBall;
	introMusic = true;
}