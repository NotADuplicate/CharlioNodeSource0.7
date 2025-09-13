/// @description Insert description here
// You can write your code in this editor
image_angle += 3;
upSpd -= grav
if(upSpd < 0 && upSpd + grav > 0) {
	var snd = scr_ball_sound(snd_duel,x,y,1);
}
image_xscale += upSpd/60;
image_yscale += upSpd/60;

///Be pulled by gravity well
if(instance_exists(obj_gravity)) {
    push = instance_nearest(x,y,obj_gravity);
    if(point_distance(x,y,push.x,push.y) < 500) {
		x += lengthdir_x(8,point_direction(x,y,push.x,push.y))
		y += lengthdir_y(8,point_direction(x,y,push.x,push.y))
	}
}