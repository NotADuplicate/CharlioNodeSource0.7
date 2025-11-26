/// @description Insert description here
// You can write your code in this editor
if(other.num != num && active) {
	active = false
	if(global.teamNum[num] == global.teamNum[other.num])
		global.ammo += 3;
	else
		scr_damage(100,other.num,false, spr_ammo, false)
	if(global.ammo > global.maxAmmo)
		global.ammo = global.maxAmmo;
	if(global.ammo < 0)
		global.ammo = 0
}