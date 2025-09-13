/// @description teleport
if(point_distance(x,y,mouse_x,mouse_y) < 150) {
	with(ball_player) {
		if(place_meeting(x,y,obj_warp) && other.sameTeam) {
			x = other.x;
			y = other.y;
			global.stun = 1;
		}
	}
}