/// @description Respawn
if(timer > 0 && ball_game.started) {
	timer -= (delta_time/1000000)
	/*if(timer < 0.5) {
		dead = false
		x = xpos;
		y = ypos;
		image_alpha = 1;
		hp = maxhp
		timer = 0;
		instance_create(0,0,spawn_marker)
	}*/
}

//Check health to decide attacks
if(attacking == 0 && attackPhase == 0 && hp < 2400) {
	sprite_index = beholder_charge_2;
	image_index = 0;
	attackPhase++;
} else if(attacking == 0 && attackPhase == 1 && hp < 1500) {
	image_index = 0;
	sprite_index = beholder_charge_1;
	attackPhase++;
}

if(attacking > 0) {
	if(sprite_index == beholder_atk_2) {
		instance_create(x+random_range(-10,10),y-random_range(0,-10),obj_eyeshot);
	} else if(beam != noone) {
		if(beam.len < 600) { 
			beam.len += 50; 
		} else {
			beam.dir += 2;
		}
		scr_beholder_dir(beam.dir);
	}
	attacking--;
	if(attacking == 0) {
		sprite_index = beholder_idle;
		if(beam != noone) {
			instance_destroy(beam);
		}
	}
}