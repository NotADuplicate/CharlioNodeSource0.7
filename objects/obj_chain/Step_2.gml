/// @description Insert description here
// You can write your code in this editor
x = link.x;
y = link.y;
if(point_distance(x,y,obj_bigBall.x,obj_bigBall.y) > 300) {
	ballLinked = false
}
if(point_distance(x,y,ball_player.x,ball_player.y) > 300) {
			with(ball_game) { //send to server that a player is chained
				node_send(buffer,"eventName", "Targeted Status", "Target",other.num, "User", ball_player.num, "Status Num", 24)
			}
}
/*with(ball_other) {
	if(other.chained[num] != 0 && point_distance(other.x,other.y,x,y) > 300) {
		other.chained[num] = 0;
	}
}
/*i = 0;
repeat(10) {
	if(chained[i] != 0 && point_distance(x,y,chained[i].x,chained[i].y) > 300) {
		chained[i] = 0;
		i++;
	}
}