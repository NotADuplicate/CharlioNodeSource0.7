/// @description Give ammo
if(ammo && other.sameTeam == false && num == ball_player.num) {
	ammo = false;
	global.ammo++;
	if(global.ammo > global.maxAmmo)
		global.ammo = global.maxAmmo;
}