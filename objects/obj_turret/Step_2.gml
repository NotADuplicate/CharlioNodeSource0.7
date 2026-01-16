/// @description Take double damage while garren buffed ppl are near
broken = false;
with(ball_other) {
	if(garren && point_distance(x,y,other.x,other.y) < 400) {
		if(global.teamNum[other.num] != global.teamNum[num]) {
			other.broken = true
		}
	}
}
with(ball_player) {
	if(obj_junglePass.garren > 0 && point_distance(x,y,other.x,other.y) < 400) {
		if(global.teamNum[other.num] != global.teamNum[num]) {
			other.broken = true
		}
	}
}

if(global.testMode) {
	if(target == noone) {
		if(point_distance(obj_bigBall.x,obj_bigBall.y,x,y) < bigRange) {
			target = obj_bigBall;
		}
		else if(global.teamNum[num] != global.teamNum[ball_player.num] && point_distance(ball_player.x,ball_player.y,x,y) < bigRange) {
			target = instance_nearest(x,y,ball_player)
		} 
	} else if(point_distance(x,y,target.x,target.y) > bigRange) {target = noone}
}

if(target == instance_nearest(x,y,ball_player)) {
	if(!firing) {
		firing = true;
		burnSound = audio_play_sound(snd_towerBurn, 1,false,1.3,0.35);
	}
	if(audio_sound_get_track_position(burnSound) > 5.2) {
		audio_sound_set_track_position(burnSound, 1);
	}
}
else {
	if(firing) {
		audio_sound_set_track_position(burnSound, 5.35);
		firing = false;
	}
}