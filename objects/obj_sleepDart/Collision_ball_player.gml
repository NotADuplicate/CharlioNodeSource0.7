/// @description Insert description here
// You can write your code in this editor
if(other.num != num || active) {
	instance_destroy();
	if(global.teamNum[num] == global.teamNum[other.num])
		global.ammo += 3;
	else
		global.ammo -= 3;
	if(global.ammo > global.maxAmmo)
		global.ammo = global.maxAmmo;
}