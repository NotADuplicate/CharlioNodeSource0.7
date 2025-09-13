/// @description Insert description here
// You can write your code in this editor
upSpd -= grav
image_xscale += upSpd/80;
image_yscale += upSpd/80;

///Be pulled by gravity well
if(instance_exists(obj_gravity)) {
    push = instance_nearest(x,y,obj_gravity);
    if(point_distance(x,y,push.x,push.y) < 500) {
		x += lengthdir_x(12,point_direction(x,y,push.x,push.y))
		y += lengthdir_y(12,point_direction(x,y,push.x,push.y))
	}
}