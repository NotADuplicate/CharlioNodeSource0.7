/// @description Mute/Unmute
if(audio_get_master_gain(0) == 0) {
	audio_set_master_gain(0,1)
}
else
	audio_set_master_gain(0,0)