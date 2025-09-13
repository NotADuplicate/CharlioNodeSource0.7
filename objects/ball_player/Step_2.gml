/// @description Slam into walls and update light
if(throwTime == 0) {
	if(place_meeting(x+hspeed,y,ball_wall)) {
		if(place_meeting(x,y,ball_wall)) {
			x -= hspeed;
		}
	    hspeed = 0;
	}
	if(place_meeting(x,y+vspeed,ball_wall)) {
		if(place_meeting(x,y,ball_wall)) {
			y -= vspeed;
		}
	    vspeed = 0;
	}

	/*if(collision_line(x,y,x+hspeed,y+vspeed,ball_wall,false,false)) {
		speed = 0;
	}*/
}
if(place_meeting(x,y,obj_duelDeath)) {
	if(global.teamNum[obj_duelDeath.num] == global.teamNum[num]) {
		scr_damage(3,num,false);
	}
	else {
		scr_damage(3,obj_duelDeath.num,false);
	}
}

gunDir = point_direction(x,y,mouse_x,mouse_y);