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
if(sprite_index == spr_chargeGunStrong || sprite_index == spr_chargeGunWeak) {
	chargeGun++;
	if(chargeGun >= 4) { chargeGun = 0; }
	
	if(chargeGun == 0) {
		sprite_index = spr_chargeGunStrong;
	} else {
		sprite_index = spr_chargeGunWeak;
	}
	image_speed = 2;
}