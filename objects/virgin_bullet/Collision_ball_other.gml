/// @description Give ammo
if(ammo) {
	ammo = false;
	global.ammo++;
	if(global.ammo > global.maxAmmo)
		global.ammo = global.maxAmmo;
}