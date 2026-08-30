/// @description Custom movement and 
lastPos = {
	time: current_time,
	xp: x,
	yp: y,
}
array_push(ballHistory, lastPos);
if(ballHistory[0].time < current_time - obj_client.ping - 40) {
	array_shift(ballHistory);
}
var dt_scale = 30 * delta_time / 1000000;
scr_ballStep(dt_scale);
lastTouched--;
//hspeed += .1*global.garren


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
	
	
///End game (moved to ball receive on ball pos)
if(ball_game.started) {
	if(x < 0 && global.testMode) {
		ending = instance_create(x,y,obj_ending);
		ending.lore = "Right team wins!";
	}
	if((x > 3920) || (x > 3892 && global.gameMode == "Rumble")) {
		ending = instance_create(x,y,obj_ending);
		ending.lore = "Left team wins!";
	}
}
else if(global.gameMode != "Rumble"){
	x = 3000;
	y = -100;
}