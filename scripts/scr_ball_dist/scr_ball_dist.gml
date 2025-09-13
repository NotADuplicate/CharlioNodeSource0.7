// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_ball_dist(xp,yp,exclude){
	dist = 1000;
	if(exclude == false)
		dist = point_distance(xp,yp,ball_player.x,ball_player.y);
	if(point_distance(xp,yp,obj_bigBall.x,obj_bigBall.y) < dist) {
		dist = point_distance(xp,yp,obj_bigBall.x,obj_bigBall.y)
	}
	/*if(instance_exists(ball_other)) {
		ins = instance_nearest(x,y
	}*/
	with(ball_other) {
		if(point_distance(x,y,xp,yp) < other.dist) {
			other.dist = point_distance(x,y,xp,yp)
		}
	}
	mon = instance_nearest(xp,yp,obj_monster)
	if(point_distance(xp,yp,mon.x,mon.y) < dist) {
		dist = point_distance(xp,yp,mon.x,mon.y)
	}
	return(dist)
}