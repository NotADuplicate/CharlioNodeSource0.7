// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_movespeed(){
	if(enraged) {
		tempSpd *= 1.5;
		b = 1.5;
	}
	if(global.upgraded) {
		tempSpd *= 0.9;
		b = 0.9;
	}
	if(ghosting > 0) {
		ghosting--;
	}
	if(ninja > 0) { //charging ninja slash
		tempSpd *= .5;
		b = .5;
	}
	if(stunned > 0) { //body slammed
		tempSpd *= .35;
		b = .35;
	}
	if(frost > 0) {
		tempSpd *= .5;
		b = .5;
	}
	if(throwTime > 0) {
		tempSpd = 0;
		yspd = 0;
	}
	if(hookSlow > 0) {
		tempSpd *= .5;
		b = .5
		hookSlow--;
	}
	if(bodySlamSlow > 0) {
		tempSpd *= .5;
		b = .5
		bodySlamSlow--;
	}
	if(global.throwRange > 0) {
		tempSpd *= 0.5;
		b = 0.5;
	}
	
	if(global.boot = "Stress" && hp < maxhp*.8) {
		stress = 0.8 - (hp/maxhp)
		tempSpd *= 1+stress
		b = 1+stress
	}
	else if(global.boot = "Mobis" && global.ammo == global.maxAmmo) {
		tempSpd *= 1.5;
		b = 1.5;
	}
	else if(global.boot == "Bush" && bushDash > 0) {
		tempSpd *= 1.4;
		b = 1.4;
		bushDash--;
	}
	else if(global.boot == "Charge") {
		if(tempSpd == 0 && yspd == 0 && charge < 300) 
			charge+=3;
		else if(charge > 0){
			tempSpd *= 1 + (charge/300);
			b = 1 + (charge/300);
			charge--;
		}
	}
	else if(global.boot == "Knockback") {
		if(speed > 0 || pushed) {
			tempSpd *= 2;
			b = 2;
		}
	}
	else if(global.boot == "Blood" && bloodThirst > 0) {
		tempSpd *= 1.4;
		b = 1.4;
		bloodThirst--;
	}
}