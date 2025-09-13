/// @description Actually invert
imp = instance_create(x,y,obj_boom);
imp.image_xscale = 12;
imp.image_yscale = 12
if(point_distance(x,y,ball_player.x,ball_player.y) < 200) {
		with(ball_game) {
			node_send(buffer,"eventName","Status","Target",ball_player.num,"Status Num",44)
		}
}
if(point_distance(x,y,obj_bigBall.x,obj_bigBall.y) < 200) {
		with(ball_game) {
			node_send(buffer,"eventName","Status","Target",100,"Status Num",44)
		}
}
instance_destroy()