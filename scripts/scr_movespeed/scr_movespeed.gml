// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_movespeed(){
	if(enraged) {
		xspd *= 1.5;
		yspd *= 1.5;
	}
	if(global.upgraded) {
		xspd *= 0.9;
		yspd *= 0.9;
	}
	if(ghosting > 0) {
		ghosting--;
	}
	if(ninja > 0) { //charging ninja slash
		xspd *= .5;
		yspd *= .5;
	}
	if(stunned > 0) { //body slammed
		xspd *= .35;
		yspd *= .35;
	}
	if(frost > 0) {
		xspd *= .5;
		yspd *= .5;
	}
	if(throwTime > 0) {
		xspd = 0;
		yspd = 0;
	}
	if(hookSlow > 0) {
		xspd *= .5;
		yspd *= .5
		hookSlow--;
	}
	if(bodySlamSlow > 0) {
		xspd *= .5;
		yspd *= .5
		bodySlamSlow--;
	}
	if(global.throwRange > 0) {
		xspd *= 0.5;
		yspd *= 0.5;
	}
	
	if(global.boot = "Stress" && hp < maxhp*.8) {
		stress = 0.8 - (hp/maxhp)
		xspd *= 1+stress
		yspd *= 1+stress
	}
	else if(global.boot = "Mobis" && global.ammo == global.maxAmmo) {
		xspd *= 1.5;
		yspd *= 1.5;
	}
	else if(global.boot == "Bush" && bushDash > 0) {
		xspd *= 1.4;
		yspd *= 1.4;
		bushDash--;
	}
	else if(global.boot == "Charge") {
		if(xspd == 0 && yspd == 0 && charge < 300) 
			charge+=3;
		else if(charge > 0){
			xspd *= 1 + (charge/300);
			yspd *= 1 + (charge/300);
			charge--;
		}
	}
	else if(global.boot == "Knockback") {
		if(speed > 0 || pushed) {
			xspd *= 2;
			yspd *= 2;
		}
	}
	else if(global.boot == "Blood" && bloodThirst > 0) {
		xspd *= 1.4;
		yspd *= 1.4;
		bloodThirst--;
	}
}