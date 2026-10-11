/// Fire
if(sprite_index == spr_pistol || sprite_index == spr_shotgun) {
	image_speed = 2;
	if(sprite_index == spr_shotgun) {
		instance_create(shootX,shootY,obj_smoke);
		instance_create(shootX,shootY,obj_smoke);
		lighting_flash(shootX,shootY,.35);
	} else {
		lighting_flash(shootX,shootY,.1);
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
	lighting_flash(shootX,shootY,.05);
}
if(sprite_index == spr_popGun) {
	lighting_flash(shootX,shootY,.12);
}
if(sprite_index == spr_melee) {
	swung = true;
	alarm[1] = 4;
}
if(sprite_index == spr_chargeGunStrong || sprite_index == spr_chargeGunWeak) {
	chargeGun++;
	if(chargeGun >= 5) { chargeGun = 0; }
	
	if(bullet = chad_bullet) {
		sprite_index = spr_chargeGunStrong;
		lighting_flash(shootX,shootY,.6);
	} else {
		sprite_index = spr_chargeGunWeak;
		lighting_flash(shootX,shootY,.1);
	}
	image_speed = 2;
}
if(sprite_index == spr_curveGun || sprite_index == spr_curveGunDown) {
	show_debug_message("clockwise")
	show_debug_message(clockwise)
	clockwise = !clockwise;
	show_debug_message(clockwise)
}