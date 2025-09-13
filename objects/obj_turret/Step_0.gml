/// @description Fire at ball if close
if(inv > 0)
	inv--;
/*if(shooting == 0) {//if ready to shoot
	if(scr_ball_dist(x,y,false) < 300) { //if something is close enough to shoot
		if(point_distance(x,y,obj_bigBall.x,obj_bigBall.y) < 300 && sign(x-obj_bigBall.x) == global.teamNum[num]) { //prioritize the ball
			ob = obj_bigBall;
		}
		else { //only activate if its not firing on the ball
			if(global.teamNum[ball_player.num] != global.teamNum[num] && point_distance(x,y,ball_player.x,ball_player.y) < 300 && sign(x-ball_player.x) == global.teamNum[num]) { //find dist of ball player
				d = point_distance(x,y,ball_player.x,ball_player.y)
				ob = ball_player
			}
			else {
				d = 300;
				ob = 0
			}
			with(ball_other) { //find the closest ball other
				if(global.teamNum[num] != global.teamNum[other.num] && point_distance(x,y,other.x,other.y) < other.d && sign(other.x-x) == global.teamNum[other.num]) {
					other.d = point_distance(x,y,other.x,other.y)
					other.ob = self
				}
			}
		}
		if(ob != 0) { //shoot if you have smth to shoot at
			shooting = 25;
			alarm[0] = 20;
		}
	}
}*/

if(shooting > 0)
	shooting--;
	
if(invin > 0)
	invin--;
	
if(hp < 0)  {
	with(ball_game) {
		node_send(buffer, "eventName", "Death", "Target", other.num, "Killer", 1)
	}
}