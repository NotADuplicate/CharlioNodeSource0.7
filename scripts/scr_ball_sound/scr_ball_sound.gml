// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_ball_sound(sound,xp,yp, offset = 0){
	range = 500;
	vol = point_distance(xp,yp,ball_cam.x,ball_cam.y)
	if(vol < range) {
		vol = 1-(vol/range)
		snd = audio_play_sound(sound,1,false,vol,offset);
	}
}