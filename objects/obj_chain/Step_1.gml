/// @description Count down and push
timer -= (delta_time/1000000)
if(timer < 0) {
	if(ballLinked) {
		scr_ball_move(point_direction(x,y,obj_bigBall.x,obj_bigBall.y),32,num);
	}
	if(chained[obj_player.num] != 0) {
		with(obj_player) {
			scr_player_move(point_direction(other.x,other.y,x,y),15);
		}
		scr_damage(Abilities.chainbreaker.damage,num,false)
	}
	instance_destroy();
}