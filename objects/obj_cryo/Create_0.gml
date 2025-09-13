/// @description Find nearest obj
ob = ball_player;
dist = point_distance(x,y,ball_player.x,ball_player.y);
/*if(point_distance(x,y,obj_bigBall.x,obj_bigBall.y) < dist) {
	dist = point_distance(x,y,obj_bigBall.x,obj_bigBall.y)
	ob = obj_bigBall;
}*/
with(ball_other) {
	if(point_distance(x,y,other.x,other.y) < other.dist) {
		other.dist = point_distance(x,y,other.x,other.y)
		other.ob = self;
	}
}
alarm[0] = 1;
//if(point_distance(x,y,obj_bigBall.x,obj_bigBall.y) 