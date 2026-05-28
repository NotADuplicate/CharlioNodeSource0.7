/// @description Destroy
if(active) {
	instance_destroy();
	explode = instance_create(x,y,obj_shatterExplosion);
	explode.num = num;
	explode.image_xscale *= 0.7;
	explode.image_yscale *= 0.7;
}