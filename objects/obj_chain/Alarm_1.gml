/// @description Link to players
if(instance_exists(ball_player)) {
    with(ball_other) { //attach chain to a player
        if(num == other.num) {
            other.link = self;
        }
    }
    with(ball_player) {
        if(num == other.num) {
            other.link = self;
        }
    }
}
else
    instance_destroy();
	
//Chain
x = link.x;
y = link.y;
if(num == ball_player.num) {
	if(point_distance(x,y,obj_bigBall.x,obj_bigBall.y) < 250) {
			with(ball_game) { //send to server that a player is chained
				node_send(buffer,"eventName", "Targeted Status", "Target",other.num, "User", 100, "Status Num", 23)
			}
	}
	with(ball_other) {
		if(point_distance(other.x,other.y,x,y) < 250) {
			show_debug_message("Linking to enemy")
			other.chained[num] = self;
			with(ball_game) { //send to server that a player is chained
				node_send(buffer,"eventName", "Targeted Status", "Target",ball_player.num, "User", other.num, "Status Num", 23)
			}
		}
	}
}
/*with(ball_player) {
	if(num != other.num && point_distance(other.x,other.y,x,y) < 250) {
		other.chained[num] = self;
	}
}