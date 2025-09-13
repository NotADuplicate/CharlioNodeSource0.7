/// @description Insert description here
// You can write your code in this editor
image_angle += 10;
if(point_distance(x,y,obj_bigBall.x,obj_bigBall.y) < 40) {
	instance_destroy()
	with(ball_game) {
		node_send(buffer,"eventName","Status","Target",100,"Status Num",17)
	}
}