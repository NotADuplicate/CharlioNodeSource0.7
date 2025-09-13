/// @description Knock up nearby players
imp = instance_create(x,y,obj_boom);
imp.image_xscale = 12;
imp.image_yscale = 12
if(point_distance(x,y,ball_player.x,ball_player.y) < 200) {
	with(ball_game) {
		node_send(buffer,"eventName","Targeted Status","Target",ball_player.num,"Status Num", 20,"User",40)
	}
}
instance_destroy()