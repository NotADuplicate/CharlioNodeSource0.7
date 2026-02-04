/// @description Insert description here
// You can write your code in this editor
if(oil == 0) {
	if(speed > 0.75 || lastTouched > 0) {
		speed *= 0.97;
	}
	else
		speed = 0;
}
lastTouched--;
//hspeed += .1*global.garren

//Horizontal bounce
if(place_meeting(x + hspeed, y, ball_wall)) {
    direction = -direction + 180;
	hspeed *= .7
}

//Vertical bounce
if(place_meeting(x, y + vspeed, ball_wall)) {
    direction = -direction;
	vspeed *= .7
}

if(global.testMode) { //damage turrets in test mode
	//Horizontal bounce
	if(place_meeting(x + hspeed, y, obj_turret)) {
		var turret = instance_nearest(x,y,obj_turret);
		turret.hp -= speed;
	    direction = -direction + 180;
		hspeed *= .7
	}

	//Vertical bounce
	if(place_meeting(x, y + vspeed, obj_turret)) {
		var turret = instance_nearest(x,y,obj_turret);
		turret.hp -= speed;
	    direction = -direction;
		vspeed *= .7
	}
}
	
	
///End game
if(ball_game.started) {
	if(x < 0 || (x < 2070 && global.gameMode == "Rumble")) {
		ending = instance_create(x,y,obj_ending);
		ending.lore = "Right team wins!";
	}
	if((x > 6500) || (x > 4650 && global.gameMode == "Rumble")) {
		ending = instance_create(x,y,obj_ending);
		ending.lore = "Left team wins!";
	}
}
else if(global.gameMode != "Rumble"){
	x = 3000;
	y = -100;
}