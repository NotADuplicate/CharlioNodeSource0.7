/// @description Draw walls to surface
surface_set_target(minimap)

draw_rectangle_color(0,0,width,height,c_ltgray,c_ltgray,c_ltgray,c_ltgray,false);

for (var i = 0; i < instance_number(ball_wall); i++){
    var inst = instance_find(ball_wall, i);
	if(inst.object_index == ball_wall) { //only count literal ball walls
		x1 = (inst.x-(16*inst.image_xscale))*scale
		y1 = (inst.y-(16*inst.image_yscale))*scale
		x2 = (inst.x+(16*inst.image_xscale))*scale
		y2 = (inst.y+(16*inst.image_yscale))*scale 
		draw_rectangle_color(x1,y1,x2,y2,c_black,c_black,c_black,c_black,false)
	}
}

for (var i = 0; i < instance_number(ball_diagonal_wall); i++){
    var inst = instance_find(ball_diagonal_wall, i);
	var rot = inst.image_angle;
	x1 = (inst.x-(lengthdir_x(16*inst.image_xscale,rot)))*scale
	y1 = (inst.y-(lengthdir_y(16*inst.image_xscale,rot)))*scale
	x2 = (inst.x+(lengthdir_x(16*inst.image_xscale,rot)))*scale
	y2 = (inst.y+(lengthdir_y(16*inst.image_xscale,rot)))*scale
	x3 = inst.wall_angle == 45 ? min(x1,x2) : max(x1,x2);
	y3 = max(y1,y2);
	draw_triangle_colour(x1,y1,x2,y2,x3,y3,c_black,c_black,c_black,false);
}

for (var i = 0; i < instance_number(obj_cover); i++){
    var inst = instance_find(obj_cover, i);
	x1 = (inst.x-(20*inst.image_xscale))*scale
	y1 = (inst.y-(20*inst.image_yscale))*scale
	x2 = (inst.x+(20*inst.image_xscale))*scale
	y2 = (inst.y+(20*inst.image_yscale))*scale
	draw_rectangle_color(x1,y1,x2,y2,#d0e0d0,#d0e0d0,#d0e0d0,#d0e0d0,false)
}

surface_reset_target()