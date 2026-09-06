dir = 0;
len = 20;
tick = 0;
depth = obj_drag.depth-1;
if(point_distance(x,y,ball_cam.x,ball_cam.y) < 600) {
	global.screenShake = 10;
}
firstHitPlayer = 0;