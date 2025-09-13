/// @description Path at player
if(dead == false && pokeNum == 0) {
	target = 0; //check if nearby chummed ppl
	if(ball_player.chummed > 0 && point_distance(x,y,ball_player.x,ball_player.y) < 1000) {
		target = ball_player;
	}
	with(ball_other) {
		if(chummed > 0 && point_distance(x,y,other.x,other.y) < 1100)
			other.target = self
	}
	if(target != 0) {
		if(enraged)
			scr_pathfind(target.x,target.y,9);
		else
			scr_pathfind(target.x,target.y,6);
	}
	else if(hp < maxhp) { //run at ppl who are fighting you normally
		dist = point_distance(x,y,ball_player.x,ball_player.y)
		target = ball_player;
		with(ball_other) {
			if(point_distance(x,y,other.x,other.y) < other.dist) {
				other.dist = point_distance(x,y,other.x,other.y);
				other.target = self;
			}
		}
		if(enraged)
			scr_pathfind(target.x,target.y,5);
		else
			scr_pathfind(target.x,target.y,3);
	}
	else if(point_distance(x,y,xpos,ypos) > 30) {
		scr_pathfind(xpos,ypos,3);
	}
	else {
		x = xpos;
		y = ypos
	}
}
else {
	x = 0;
	y = 0;
}
	
alarm[6] = 5;