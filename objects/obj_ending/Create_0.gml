age = 0;
expansionSpeed = 2000;
startRadius = 8;
holdTime = 0.5;
segments = 128;
finished = false;

if(global.ballGameOver != 0) { 
	instance_destroy(); 
} else {
	global.unlocks++;

	maxRadius = room_width*2

	chargeDuration = 2.7;
	chargeParticleDuration = 0.7;
	chargeRadius = 350;
	chargeRate = 70;
	chargeSpawnTimer = 0;
	chargeParticles = [];
	finishTime = -1;
	currentRadius = 0;

	depth = obj_shop.depth-10;

	audio_play_sound(snd_ending,1,false,1,1.8)
}