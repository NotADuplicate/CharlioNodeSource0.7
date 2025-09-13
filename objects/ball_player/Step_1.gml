/// @description Movement
if(confuse = 0) {
    xspd = moveSpd*global.slow*(keyboard_check(ord("D"))-keyboard_check(ord("A")))
    yspd = moveSpd*global.slow*(keyboard_check(ord("S"))-keyboard_check(ord("W")))
}
else {
    xspd = moveSpd*global.slow*sign(xspd)
    yspd = moveSpd*global.slow*sign(yspd)
}
if(global.typing) {
	xspd = 0;
	yspd = 0;
}

scr_movespeed();
var dt = delta_time / 35000;
xspd *= dt;
yspd *= dt;

//Do walking sprite
if(xspd != 0 || yspd != 0) {
	if(global.teamNum[num] == 1)
		sprite_index = spr_adventureWalk
	else
		sprite_index = spr_bAdventureWalk
}
else {
	if(global.teamNum[num] == 1)
		sprite_index = spr_adventurer
	else
		sprite_index = spr_bAdventurer;
}

if(hp > maxhp) { //handle overheal
	if(hp > maxhp*1.5)
		hp = round(maxhp*1.5);
	hp -= .1*dt;
}
   
//Handle some statuses
if(bleed > 0 && (xspd != 0 || yspd != 0)) {
	scr_damage(3,bleedNum,false);
	if(global.screenShake < 8)
		global.screenShake = 8;
}
if(poison > 0) {
	poison--;
	if(poison < 1)
		poisonDmg = 0;
}

if(frost > 0) {
	speed = 0;
}
if(burn > 0) {
	burn--;
	//part_particles_create(global.partSystem,x+random_range(-10,10),y+random_range(-10,10),part_fire,1);
	instance_create(x+random_range(-16,16),y+random_range(-16,16),obj_firePart)
	if(burn mod 5 == 0) {
		if(oil > 0)
			scr_damage(3,burnNum,false);
		else
			scr_damage(1,burnNum,false);
	}
	
}
if(magicBurn > 0) {
	magicBurn--;
	if(magicBurn mod 5 == 0) {
		scr_damage(2,magicBurnNum,false);
		instance_create(x+random_range(-16,16),y+random_range(-16,16),obj_darkPart)
	}
}
if(drowsy  > 0) {
	drowsy--;
	if(drowsy mod 10 == 0) {
		instance_create(x,y,obj_Z)
		if(drowsy == 0) {
			sleeping = 150;
		}
	}
}
if(sleeping > 0) {
	sleeping--;
	global.stun = 8;
	if(sleeping mod 10 == 0) {
		if(napping && hp < maxhp) {
			hp+=5;
		}
		instance_create(x,y,obj_Z)
		if(sleeping == 0) {
			global.slow = 1;
			napping = false;
		}
	}
}
if(hopping > 0)
	hopping--;
	
///Collisions
last2X = lastX;
last2Y = lastY
lastX = x;
lastY = y;
if(stasis == false && obj_bigBall.drone != num && sleeping == 0) {
    if(!place_meeting(x+xspd,y,ball_wall)) {
		if(oil == 0)
			x += xspd;
		else if(abs(hspeed) < abs(xspd))
			hspeed += xspd/10;
    }
	else if(bushHop && position_meeting(x,y,obj_cover) && yspd == 0 && place_meeting(x+sign(xspd)*80,y,ball_wall) == false) {
		if(hopping > 15)
			x += 80 * sign(xspd);
		else
			hopping+=2;
	}
    if(!place_meeting(x,y+yspd,ball_wall)) {
		if(oil == 0)
			y += yspd;
		else if(abs(vspeed) < abs(yspd))
			vspeed += yspd/10;
    }
	else if(bushHop && position_meeting(x,y,obj_cover) && xspd == 0 && place_meeting(x,y+sign(yspd)*100,ball_wall) == false) {
		if(hopping > 15)
			y += 100 * sign(yspd);
		else
			hopping+=2;
	}
}

///Invincibility
if(global.invincibility > 0) {
    global.invincibility -= dt;
	if(global.invincibility < 0)
		global.invincibility = 0;
}


///Be pushed by push object
if(instance_exists(obj_push)) {
    push = instance_nearest(x,y,obj_push);
    dist = point_distance(x,y,push.x,push.y)
    if(dist < 400) {
		pushed = true
        dir = point_direction(push.x,push.y,x,y);
		if(inversion > 0)
			dir += 180
        dist = ((400-dist)*push.magnitude/4500)/knockback;
		if(oil > 0)
			dist *= 1.5;
		if(global.pushSpd > 1)
			dist *= 1.5;
		//move if no walls in direction
	    if(!place_meeting(x+lengthdir_x(dist,dir),y,ball_wall)) {
	        x += lengthdir_x(dist,dir);
	    }
	    if(!place_meeting(x,y+lengthdir_y(dist,dir),ball_wall)) {
	        y += lengthdir_y(dist,dir);
	    }
    }
	else 
		pushed = false
}
else
	pushed = false
	
///Be pulled by gravity well
if(throwTime > 0 && instance_exists(obj_gravity)) {
    push = instance_nearest(x,y,obj_gravity);
    if(point_distance(x,y,push.x,push.y) < 500) {
		x += lengthdir_x(8,point_direction(x,y,push.x,push.y))
		y += lengthdir_y(8,point_direction(x,y,push.x,push.y))
	}
}


///Slow down from knockback
if(speed > 0 && ninjaSlash == false && throwTime == 0) {
	if(oil == 0)
		speed -= knockback;
	else
		speed -= knockback/2;
}
else if(speed <0) {
    speed = 0;
}

if(invPass) {
	if(position_meeting(x,y,obj_cover)) {
		invis = 30;
	}
	else if(invis > 0)
		invis--;
}
	
if(enraged) {
	scr_damage(enrageDmg*global.resistance,num,false)
	if(global.screenShake < enrageDmg*1.5)
		global.screenShake = enrageDmg*1.5
	enrageDmg += 0.001
	if(hp < 1 || x < 1) {
		enraged = false;
		moveSpd = moveSpd/1.5;
		global.shooting = global.shooting/2;
		global.coolReduc = global.coolReduc/2;
	}
}

	
if(rammed > 0)
	rammed--;

if(x < 0 || x > 6500) {//outside of map
	scr_damage(5,num,false);
}

//stand still to stop being enraged
if(enraged) {
	if(x == ball_game.lastX && y == ball_game.lastY) {
		still++;
		if(still > 90) {
			with(ball_game) {
				node_send(buffer,"eventName","Status","Target",ball_player.num,"Status Num",7)
			}
			still = 0;
		}
	}
	else
		still = 0;
}