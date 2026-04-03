/// Fire
if(sprite_index == spr_pistol || sprite_index == spr_shotgun) {
	image_speed = 2;
	if(sprite_index == spr_shotgun) {
		instance_create(shootX,shootY,obj_smoke);
		instance_create(shootX,shootY,obj_smoke);
	}
}
if(sprite_index == nad_minigun) {
	image_speed = 2;
	if(image_index > 8)
		image_index = 1;
		instance_create(shootX,shootY,obj_smoke);
		instance_create(shootX,shootY,obj_smoke);
		instance_create(shootX,shootY,obj_smoke);
		instance_create(shootX,shootY,obj_smoke);
}
if(sprite_index == spr_melee) {
	swung = true;
	alarm[1] = 4;
}