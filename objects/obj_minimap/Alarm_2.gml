if(instance_exists(obj_tutorial)) {
	surface_set_target(minimap)
	draw_arrow(987*scale, 2500*scale, 300*scale,2500*scale, 100*scale);
	draw_arrow(260*scale, 2500*scale, 260*scale,1600*scale, 100*scale);
	draw_arrow(260*scale, 1500*scale, 1000*scale,1500*scale, 100*scale);
	draw_arrow(1100*scale, 1500*scale, 1100*scale,650*scale, 100*scale);
	draw_arrow(1100*scale, 550*scale, 0*scale,550*scale, 100*scale);
	surface_reset_target()
}