/// @description Scale down
image_xscale = 0.3;
image_yscale = 0.3;
link = self;
alarm[1] = 10;
alarm[0] = 1;
visible = false
active = true;
dmg = 50
show_debug_message("Bat Start: " + string(active))
scr_ball_sound(snd_swing,x,y);