/// @description Actually shoot
alarm[0] = 5;
if(global.teamNum[num] != global.teamNum[ball_player.num] && point_distance(x,y,ball_player.x,ball_player.y) < bigRange) {
	scr_damage(12,ball_player.num,true)
}
/*if(point_distance(x,y,ob.x,ob.y) < 350) {
			shot = instance_create(x,y,tower_shot);
			shot.direction = point_direction(x,y,ob.x,ob.y)
			shot.dmg = 50;
			shot.num = num;
			shot.speed = 29
			shooting = 40;
			if(ob.x == obj_bigBall.x)
				hp -= 5;
}*/