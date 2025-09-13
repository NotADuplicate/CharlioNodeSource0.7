/// @description Stasis ball or players
with(ball_game) {
	node_send(buffer,"eventName","Status","Target",other.targetNum,"Status Num",38)
}
/*if(ob == obj_bigBall) {
	ob.stasis = true;
	ob.sprite_index = spr_stasis;
	ob.alarm[4] = 90;
	ob.stasisx = ob.hspeed;
	ob.stasisy = ob.vspeed;
	ob.hspeed = 0;
	ob.vspeed = 0;
}
else if(ob == ball_player) {
	ob.stasis = true;
	ob.sprite_index = spr_yellow;
	ob.alarm[8] = 90;
	ob.stasisx = ob.hspeed;
	ob.stasisy = ob.vspeed;
	ob.hspeed = 0;
	ob.vspeed = 0;
	global.invincibility = 90;
	global.stun = 90;
}
else {
	ob.sprite_index = spr_yellow;
	ob.alarm[0] = 90
}
instance_destroy();