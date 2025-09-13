/// @description Make sparks
				dir = 45
				repeat(4) {
					spark = instance_create(x,y,obj_spark)
					spark.direction = dir
					dir += 90
				}
			alarm[0] = 1;	
			scr_ball_sound(snd_flash,x,y);