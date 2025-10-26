/// @description Passives run out
if(jungle > 0) {//if you have jungle up, everything else stays
	jungle-= (delta_time/50000);
	if(global.dead)
		jungle = 0;
}
else if(garren > 0) {//if you have jungle up, everything else stays
	garren -= (delta_time/1000000);
	if(global.dead)
		garren = 0;
}
else {
	if(resistance > 0) {
		resistance-= (delta_time/50000);
		if(resistance < 1 || global.dead) {
			scr_lose_buff("Resistance", global.jungle);
		}
	}
	if(defense > 0) {
		defense-= (delta_time/50000);
		if(defense < 1 || global.dead) {
			scr_lose_buff("Defense", global.jungle);
		}
	}
	if(ammo > 0) {
		ammo-= (delta_time/50000);
		if(ammo < 1 || global.dead) {
			scr_lose_buff("Ammo", global.jungle);
		}
	}
	if(spd > 0) {
		spd-= (delta_time/50000);
		if(spd < 1 || global.dead){
			scr_lose_buff("Speed", global.jungle);
		}
	}
	if(pwr > 0) {
		pwr-= (delta_time/50000);
		if(pwr < 1 || global.dead){
			scr_lose_buff("Power", global.jungle);
		}
	}
	if(dmg > 0) {
		dmg-= (delta_time/50000);
		if(dmg < 1 || global.dead){
			scr_lose_buff("Damage", global.jungle);
		}
	}
}