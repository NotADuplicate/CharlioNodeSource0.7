/// @description Insert description here
// You can write your code in this editor
upSpd -= grav
image_xscale += upSpd/50;
image_yscale += upSpd/50;

///Be pulled by gravity well
if(instance_exists(obj_gravity)) {
    push = instance_nearest(x,y,obj_gravity);
    if(point_distance(x,y,push.x,push.y) < 500) {
		x += lengthdir_x(8,point_direction(x,y,push.x,push.y))
		y += lengthdir_y(8,point_direction(x,y,push.x,push.y))
	}
}