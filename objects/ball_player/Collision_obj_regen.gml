/// @description Regen health and ammo
if(global.teamNum[num] == global.teamNum[other.num]) {
	if(hp < maxhp)
		hp += 1;
	if(decay > 0)
		scr_damage(3,num,false);
	if(enraged) {
		enraged = false;
					global.shooting = global.shooting/2;
					global.coolReduc = global.coolReduc/2;
	}
	global.invincibility = 2;
}
else
	scr_damage(10,num,true);