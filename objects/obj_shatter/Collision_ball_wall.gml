/// @description Destroy
instance_destroy();
explode = instance_create(x,y,obj_shatterExplosion);
explode.num = num;
explode.image_xscale *= 0.6;
explode.image_yscale *= 0.6;