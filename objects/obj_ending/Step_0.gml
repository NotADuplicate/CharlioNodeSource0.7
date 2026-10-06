var dt = delta_time / 1000000;
age += dt;

if(point_distance(x,y,ball_player.x,ball_player.y) <= currentRadius) {
	with(ball_player) {
		if(global.dead == false)
			scr_damage(50,num,false, spr_ult, true);
	}
}

if(!instance_exists(obj_screenWhiteout) && point_distance(x,y,ball_cam.x,ball_cam.y) <= currentRadius) {
	instance_create(0,0,obj_screenWhiteout);
	if(global.testMode) {
		if(instance_exists(obj_tutorial)) {
			alarm[0] = 90;
			global.finishedTutorial = true;
		} else {
			node_send(obj_client.buffer,"eventName","Game Over", "Winner", obj_bigBall.x < 1000 ? -1 : 1, 
				"playersBallPush", ds_map_create(), "towerDamages", ds_map_create(), "healingDealt", ds_map_create(),
				"soulsCollected", ds_map_create(), "selfDamageBlocked", ds_map_create(), "mvpId", 1);
		}
	}
}

if(age < chargeDuration) {
	currentRadius = 0;
	chargeSpawnTimer += chargeRate * dt;

	while(chargeSpawnTimer >= 1 && age < chargeParticleDuration) {
		var angle = random(360);

		array_push(chargeParticles,{
			angle: angle,
			distance: chargeRadius + random_range(-20,20),
			speed: random_range(180,300),
			spin: random_range(-20,20),
			size: choose(1,1,2),
			color: choose(
				c_white,
				make_color_rgb(100,210,255),
				make_color_rgb(40,130,255)
			)
		});

		chargeSpawnTimer--;
	}

	for(var i = array_length(chargeParticles)-1; i >= 0; i--) {
		var particle = chargeParticles[i];

		particle.distance -= particle.speed * dt;
		particle.angle += particle.spin * dt;

		if(particle.distance <= 5)
			array_delete(chargeParticles,i,1);
		else
			chargeParticles[i] = particle;
	}
}
else {
	if(array_length(chargeParticles) > 0)
		chargeParticles = [];

	var expansionAge = age-chargeDuration;

	currentRadius = min(
		startRadius + expansionSpeed * expansionAge,
		maxRadius
	);

	if(currentRadius >= maxRadius) {
		if(finishTime < 0)
			finishTime = expansionAge;

		if(expansionAge >= finishTime + holdTime)
			finished = true;
	}
}