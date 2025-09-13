/// @description Give ammo
if(ammo && other.sameTeam == false) {
	ammo = false;
	global.ammo++;
	if(global.ammo > global.maxAmmo)
		global.ammo = global.maxAmmo;
}