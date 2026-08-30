/// @description /Send player stats
/*if(instance_exists(ball_player)) {
    buffer_seek(buffer, buffer_seek_start, 0);
    buffer_write(buffer, buffer_u8, 25);
    buffer_write(buffer, buffer_u8, ball_player.num);
    buffer_write(buffer, buffer_u8, 100+ball_player.x-lastX);
    buffer_write(buffer, buffer_u8, 100 + ball_player.y-lastY);
    network_send_packet(socket, buffer, buffer_tell(buffer));
}*/
lastX = ball_player.x;
lastY = ball_player.y;
var dt = delta_time / 30000;
var reloadSpd = (ball_player.quickTap > 0) ? global.shooting*dt*4 : global.shooting*dt;
///Reload
if(reload > 0) {
    reload-= reloadSpd;
	if(global.attack == obj_shotgun && reload < 13*global.shooting*dt) {
		if(!shotgunReload) {
			shotgunReload = true;
			scr_ball_sound(snd_shotgun,ball_player.x,ball_player.y)
		}
	}
}
if(reload <0) {
	shotgunReload = false;
    reload = 0;
}
	
if(bullets < 5) {
	if(bulletReload < 1) {
		bullets++
		if(bullets == 5) 
			scr_ball_sound(snd_shotgun,ball_player.x,ball_player.y,0.08)
		else
			scr_ball_sound(snd_shotgun,ball_player.x,ball_player.y,0.16)
		bulletReload = 60;
	}
	else
		bulletReload -= reloadSpd
}
//increment cooldowns and statuses

if(global.QCool > 0)
	global.QCool -= global.coolReduc/room_speed * dt;
else
	global.QCool = 0;
	
if(global.RCool > 0)
	global.RCool -= global.coolReduc/room_speed * dt;
else
	global.RCool = 0;
	
if(global.rightCool > 0)
	global.rightCool -= global.coolReduc/room_speed * dt;
else
	global.rightCool = 0;
	
if(global.spaceCool > 0)
	global.spaceCool -= global.coolReduc/room_speed * dt;
else
	global.spaceCool = 0;
	
if(global.stun > 0) {
	global.stun-=dt;
	if(global.stun < 0.1)
		global.stun = 0;
}

if(global.free > 0) {
	global.free -= 1/room_speed * dt;
}
else
	global.free = 0;
	
if(global.teleportTimer > 0 && started) {
	global.teleportTimer -= 1/room_speed * dt;
}
else
	global.free = 0;
	
if(started && global.gameMode != "Rumble" && (!instance_exists(obj_tutorial) || obj_tutorial.stage > 16)) {
	global.xp+= (delta_time/1000000)*20
}