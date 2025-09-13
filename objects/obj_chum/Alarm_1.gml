/// @description Insert description here
// You can write your code in this editor
imp = instance_create(x,y,obj_boom);
imp.image_xscale = 12;
imp.image_yscale = 12
if(point_distance(x,y,ball_player.x,ball_player.y) < 200) {
		with(ball_game) {
			node_send(buffer,"eventName","Status","Target",ball_player.num,"Status Num", 35)
		}
		ball_player.chumNum = num;
}
instance_destroy()