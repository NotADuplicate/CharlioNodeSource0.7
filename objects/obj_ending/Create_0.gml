age = 0;
expansionSpeed = 2000;
startRadius = 8;
holdTime = 0.5;
segments = 128;
finished = false;

if(global.ballGameOver != 0) { instance_destroy(); }

maxRadius = max(
	point_distance(x,y,0,0),
	point_distance(x,y,room_width,0),
	point_distance(x,y,0,room_height),
	point_distance(x,y,room_width,room_height)
);

chargeDuration = 2.7;
chargeParticleDuration = 0.7;
chargeRadius = 350;
chargeRate = 70;
chargeSpawnTimer = 0;
chargeParticles = [];
finishTime = -1;
currentRadius = 0;

depth = -999999;

audio_play_sound(snd_ending,1,false,1,1.8)