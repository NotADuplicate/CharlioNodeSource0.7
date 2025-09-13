///Get turned on
if(other.pirate == false && sprite_index == spr_charging) {
	sprite_index = spr_ult;
	global.gen++;
	//if(global.captain == false)
	//	global.loot += global.genGain;
}
if(other.beast && sprite_index = spr_ult) {
	if(other.sprite_index = spr_restrained && useable) {
		other.zap++;
		useable = false;
		if(other.zap > 1) 
			pirate_game.alarm[9] = 1;
	}
}