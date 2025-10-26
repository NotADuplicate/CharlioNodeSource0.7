/// @description Decide visibility
if(global.teamNum[num] == 0) {
	x = 5000;
	y = 5000;
	hp = 250;
}
if(invis > 0 || position_meeting(x,y,obj_cover) || ghosting > 0) {
		image_alpha = 0.5;
}
else {
	image_alpha = 1;
}
if(respawnTimer > 0 && instance_exists(obj_ending) == false) {
	respawnTimer -= (delta_time/1000000);
	if(respawnTimer < 0.5)
		alarm[9] = 1;
}

//Ninja slash
if(ninja > 0) {
	if(ninjaSlash) {
		ninja-= 4;
	}
	else if(ninja < 120)
		ninja+=2;
}
		if(ninjaSlash && ninja < 1) {
			ninjaSlash = false;
			speed *= .7;
		}
		
if(portaled > 0)
	portaled--;



if(duel > 0 && global.dead == false) {
	duel--;
	if(duel < 800) { //if alone in duel zone
		duelLast = true;
		with(ball_other) { //check if any enemies are in here
			if(sameTeam == false && point_distance(x,y,5780,4550) < 700) {
				other.duelLast = false
			}
		}
		if(duelLast)
			duel = 0;
	}
	if(duel == 0) {
		x = preDuelx + (x-postDuelx);
		y = preDuely + (y-postDuely);
		while(place_meeting(x,y,ball_wall)) {
			x -= sign(x-preDuelx);
			y -= sign(y- preDuely);
		}
	}
}
if(tossGrabbed > 0) {
	tossGrabbed--;
	if(point_distance(x,y,grabber.x,grabber.y) > 30) {
		x += lengthdir_x(7,point_direction(x,y,grabber.x,grabber.y))
		y += lengthdir_y(7,point_direction(x,y,grabber.x,grabber.y))
	}
}

if(throwTime > 0) {
	throwTime--;
	image_xscale += sign(image_xscale)*upSpd/40;
	image_yscale += upSpd/40;
	upSpd -= grav
	if(throwTime == 0) {
		scr_outside();
		speed = 0;
		image_xscale = scale*2;
		image_yscale = scale*1.75;
		if(bodySlam) {
			with(ball_game) {
				node_send(buffer,"eventName","Bullet","X",ball_player.x,"Y",ball_player.y,"Dir",0,"Obj",obj_shockwave,"Num",ball_player.num)
			}
			bodySlamSlow = 6;
		}
		bodySlam = false;
	}
}
else if(mouse_x > x)
	image_xscale = 2*scale;
else
	image_xscale = -2*scale;

if(loadoutUnseen) { //enemy team doesnt know what your loadout is till they see you
	
	with(ball_other) {
		if(sameTeam == false && collision_line(x,y,other.x,other.y,ball_wall,false,false) == noone) {
			if(instance_position(ball_player.x,ball_player.y,obj_cover) == noone) {
				other.loadoutUnseen = false
			}
		}	
	}
	if(loadoutUnseen == false) {
		with(ball_game) {
			node_send(buffer,"eventName","Status","Target",ball_player.num,"Status Num",31)
		}
	}
}

if(batCharge > 0) {
	if(batCharge < 100)
		batCharge++;
	if(ball_game.held == false) {
		batCharge = 0;
		global.slow = 1;
	}
}
if(curseCharge > 0) {
	global.stun = 2;
	global.slow = 0;
	if(curseCharge < 150)
		curseCharge++;
	if(x != curseX || y != curseY) { //if moved during curse, stop
		if(curseCharge > 3) {
			with(ball_game) {
				ball_player.curseCharge = 0
				node_send(buffer,"eventName","Targeted Status","Target",ball_player.num,"User",ball_player.curseCharge,"Status Num", 28)
			}
			curseCharge = 0;
		}
		else {
			curseX = x;
			curseY = y;
		}
		
	}
}

if(dashing > 0) {
	dashing--;
	instance_create(x,y,obj_dashing)
	instance_create(x,y,obj_dashing)
}