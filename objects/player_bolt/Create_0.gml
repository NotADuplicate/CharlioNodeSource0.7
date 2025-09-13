/// @description Start the fire time
//fire = global.shooting;
/*if(fire == 1) {
    alarm[0] = 29;
}
else if(fire == 2) {
    alarm[0] = 20;
}
else
    alarm[0] = 5;*/
charge = 0;
global.slow = .3;
if(instance_exists(obj_player)) {
	dir = point_direction(ball_player.x,ball_player.y,mouse_x,mouse_y);
} else {
	instance_destroy()
}

alarm[0] = 1;