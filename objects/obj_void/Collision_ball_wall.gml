if(active) {
	impact = instance_create(x+hspeed*2,y-8+vspeed*2,void_impact);
	impact.image_xscale = image_xscale;
	impact.image_yscale = image_yscale;
	instance_destroy();
}