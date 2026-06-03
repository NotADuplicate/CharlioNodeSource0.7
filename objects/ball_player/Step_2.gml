/// @description Slam into walls and update light
if(throwTime == 0) {	
	collided = false;
	if(place_meeting(x,y,ball_wall)) {
		x -= hspeed;
		y -= vspeed;
		collided = true;
	}
	if(place_meeting(x+hspeed,y,ball_wall)) {
	    hspeed = 0;
		collided = true;
	}
	if(place_meeting(x,y+vspeed,ball_wall)) {
	    vspeed = 0;
		collided = true;
	}
	iterations = ceil(speed/30)
	i = 0
	repeat(iterations) {
		i += 1/iterations;
		if(!collided && place_meeting(x-hspeed*i,y-vspeed*i,ball_wall)) {
			x -= hspeed;
			y -= vspeed;
			collided = true;
		}
	}
}
if(place_meeting(x,y,obj_duelDeath)) {
	if(global.teamNum[obj_duelDeath.num] == global.teamNum[num]) {
		scr_damage(3,num,false, spr_duel, true);
	}
	else {
		scr_damage(3,obj_duelDeath.num,false, spr_duel, true);
	}
}

gunDir = point_direction(x,y,mouse_x,mouse_y);