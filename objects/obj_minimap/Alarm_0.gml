/// @description Draw walls to surface
surface_set_target(minimap)

scale = 0.077
draw_rectangle_color(0,0,500,276,c_ltgray,c_ltgray,c_ltgray,c_ltgray,false);

for (var i = 0; i < instance_number(ball_wall); i++){
    var inst = instance_find(ball_wall, i);

	x1 = (inst.x-(16*inst.image_xscale))*scale
	y1 = (inst.y-(16*inst.image_yscale))*scale
	x2 = (inst.x+(16*inst.image_xscale))*scale
	y2 = (inst.y+(16*inst.image_yscale))*scale 
	draw_rectangle_color(x1,y1,x2,y2,c_black,c_black,c_black,c_black,false)
}
show_debug_message(instance_number(ball_wall))

for (var i = 0; i < instance_number(obj_cover); i++){
    var inst = instance_find(obj_cover, i);
	x1 = (inst.x-(16*inst.image_xscale))*scale
	y1 = (inst.y-(16*inst.image_yscale))*scale
	x2 = (inst.x+(16*inst.image_xscale))*scale
	y2 = (inst.y+(16*inst.image_yscale))*scale
	draw_rectangle_color(x1,y1,x2,y2,c_dkgray,c_dkgray,c_dkgray,c_dkgray,false)
}

surface_reset_target()