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
			if(global.gameMode = "Rumble") {
				obj_bigBall.x = obj_bigBall.startX
				obj_bigBall.y = obj_bigBall.startY
			}
			with(obj_startWall) {
				ins = instance_create(x,y,jungle_wall)
				ins.image_yscale = 0.1
				ins.image_xscale = image_xscale;
				instance_destroy()
			}
			global.bb = mp_grid_create(0,0,floor(room_width/32),floor(room_height/32),32,32);
			mp_grid_add_instances(global.bb,ball_wall,false);
			}
		}
	}
	

