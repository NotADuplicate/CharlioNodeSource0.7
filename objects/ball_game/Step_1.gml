/// @description Start after countdown
if(startingSound) {
	if(startTimer >= 0) {
		var dt = delta_time / 30000
		startTimer -= dt/room_speed;
		if(startTimer < 0) {
			startingSound = false;
			started = true
			alarm[10] = 30;
			layer = 1;
			obj_bigBall.alarm[8] = 450;
			/*if(global.gameMode = "Rumble") {
				obj_bigBall.x = obj_bigBall.startX
				obj_bigBall.y = obj_bigBall.startY
			}*/
			with(obj_startWall) {
				ins = instance_create(x,y,jungle_wall)
				ins.image_yscale = image_yscale
				ins.image_xscale = 0.1;
				instance_destroy()
			}
			global.bb = mp_grid_create(0,0,floor(room_width/32),floor(room_height/32),32,32);
			mp_grid_add_instances(global.bb,ball_wall,false);
			}
		}
	}
	
// Shoot malpractice shots
if(malpractice > 0) {
	malpractice--;
	if(malpractice <= 100) {
		spread = random_range(-22, 22);
		node_send(buffer,"eventName","Bullet","Num",ball_player.num,"X", ball_player.x, "Y", ball_player.y, "Obj", obj_malpractice, "Dir", point_direction(ball_player.x,ball_player.y,mouse_x,mouse_y)+spread)
	}
}

//Tick down assist scores
if(started) {
	for(i = 0; i < global.loop; i++) {
		if(global.assistScore[i] > 0) {
			global.assistScore[i]-= 0.5;
		}
	}
}