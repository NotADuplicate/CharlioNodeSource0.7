/// @description Be pushed
if(instance_exists(obj_push)) {
    push = instance_nearest(x,y,obj_push);
    dist = point_distance(x,y,push.x,push.y)
    if(dist < 400) {
        dir = point_direction(push.x,push.y,x,y);
        dist = ((400-dist)*push.magnitude/9000)
		if(stasis == false) {
			if(!place_meeting(x+lengthdir_x(dist,dir),y,ball_wall)) 
				x += lengthdir_x(dist,dir);
			if(!place_meeting(x,y+lengthdir_y(dist,dir),ball_wall)) 
				y += lengthdir_y(dist,dir);
		}
		else {
	        stasisx += lengthdir_x(dist/20,dir);
	        stasisy += lengthdir_y(dist/20,dir);
		}
    }
}

if(spellShield > 0)
	spellShield--;
if(frost > 0)
	frost--;
	
if(oil > 0)
	oil--;
	
if(melee > 0)
	melee--;

if(speed > 70)
	speed = 70;