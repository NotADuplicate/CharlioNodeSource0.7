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
///Reload
if(reload > 0) {
    reload-= global.shooting*dt;
}
if(reload <0)
    reload = 0;
	
if(bullets < 5) {
	if(bulletReload < 1) {
		bullets++
		bulletReload = 50;
	}
	else
		bulletReload -= global.shooting;
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
	
if(global.xp > global.xpMax) {
	global.xp-= global.xpMax
	global.xpMax += 250;
	global.leveled++;
	if(global.respawn < 25)
		global.respawn += 1.5;
	global.totalLevels++;
}
else if(started && global.gameMode != "Rumble" && (!global.testMode || obj_tutorial.stage > 16)) {
	global.xp+= (delta_time/1000000)*20
}

if(global.xp2 > global.xpMax2) {
	global.xp2-= global.xpMax2
	global.xpMax2 += 250;
	if(global.respawn2 < 25)
		global.respawn2 += 1.5;
	global.totalLevels2++;
}
else if(started) {
	global.xp2 += (delta_time/1000000)*20
}


