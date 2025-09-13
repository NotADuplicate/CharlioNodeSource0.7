/// @description Duel zone
dist = point_distance(x,y,ball_player.x,ball_player.y)
if(dist < 450) {
	ball_player.preDuelx = ball_player.x;
	ball_player.preDuely = ball_player.y;
	ball_player.x = 5780 + (ball_player.x-x);
	ball_player.y = 4550 + (ball_player.y-y)*.8;
	ball_player.duel = 850;
	with(obj_music) {
		audio_stop_sound(global.music);
		global.music = audio_play_sound(mus_duel,0,false,global.musVolume);
	}
}
with(obj_duelDeath) {
	x = startX
	y = startY
	speed = 0.5;
	num = other.num
	alarm[10] = 660;
}
instance_destroy()