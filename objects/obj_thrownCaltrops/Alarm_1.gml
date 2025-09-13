/// @description Insert description here
// You can write your code in this editor
dir = 0;
repeat(15) {
	dir += 24
	dist = random_range(0,130);
	ins = instance_create(x + lengthdir_x(dist,dir),y + lengthdir_y(dist,dir),obj_caltrop)
	ins.num = num
}
repeat(15) {
	dir += 24
	dist = random_range(130,200);
	ins = instance_create(x + lengthdir_x(dist,dir),y + lengthdir_y(dist,dir),obj_caltrop)
	ins.num = num
}


instance_destroy()