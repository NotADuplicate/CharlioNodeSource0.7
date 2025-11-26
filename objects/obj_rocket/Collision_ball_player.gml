/// @description Explode and damage
if(other.num != num || reflected) {
	scr_damage(85,num,false, spr_rocket, false)
	while(place_meeting(x,y,ball_player)) {
		x -= lengthdir_x(1,direction);
		y -= lengthdir_y(1,direction);
	}
	instance_destroy();
	with(ball_game) {
		node_send(buffer,"eventName","Hook Stop", "Obj", obj_rocket, "Num", ball_player.num);
	}
}