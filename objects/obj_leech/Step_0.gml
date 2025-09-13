/// @description Insert description here
// You can write your code in this editor
if(point_distance(x,y,link.x,link.y) > 420)
	instance_destroy();
image_angle = point_direction(link.x,link.y,x,y)
if(grabbed != 0) {
	x = grabbed.x// - lengthdir_x(10,image_angle);
	y = grabbed.y// - lengthdir_y(10,image_angle);
}
if(grabbed != 0) {
	if(grabbed == ball_player)
		scr_damage(.75,num,false);
	else if(num == ball_player.num) {
		if(ball_player.decay > 0)
			scr_damage(2,ball_player.decayNum,false)
		else if(ball_player.hp < 250)
			ball_player.hp+=2;
	}
}