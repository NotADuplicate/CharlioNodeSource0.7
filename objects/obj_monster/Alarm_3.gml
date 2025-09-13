/// @description Shoot if damaged
alarm[3] = 60;
	target = 0;
	if(enraged)
		dmg = 70
	else
		dmg = 40;
	if(ball_player.chummed > 0 && point_distance(x,y,ball_player.x,ball_player.y) < 200) {
		target = ball_player;
	}
	with(ball_other) {
		if(chummed > 0 && point_distance(x,y,other.x,other.y) < 200)
			other.target = self
	}
if(hp < maxhp || target != 0) {
	ins = instance_create(x,y,obj_monsterShot);
	ins.dmg = 40
}