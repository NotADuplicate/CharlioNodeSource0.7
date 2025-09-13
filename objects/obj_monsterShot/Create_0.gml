dmg = 20;
//Range = 405
speed = 30;
//alarm[1] = 60;
slow = 1.5;
portaled = false

//Find nearest player
dist = point_distance(x,y,ball_player.x,ball_player.y);
ob = ball_player
with(ball_other) {
	if(point_distance(x,y,other.x,other.y) < other.dist || (chummed > 0 && point_distance(x,y,other.x,other.y) < 200)) {
		other.dist = point_distance(x,y,other.x,other.y)
		other.ob = self;
	}
}
direction = point_direction(x,y,ob.x,ob.y);
image_angle = direction;