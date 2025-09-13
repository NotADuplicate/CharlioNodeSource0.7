// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_draw_action(num,action,target,order){
	user = global.players[num]
	switch(action) {
		case "Draw":
			user.drawn = true;
		break;
		case "Shoot":
			if(user.drawn) {
				user.drawn = false
				if(global.userActions[target,order] != "Dodge") {
					if(user.aiming) {
						global.players[target].hp--;
						global.turnDamage = order;
					}
					if(global.userActions[target,order] == "Shoot" && global.userActionTarget[target,order] = num) {
					}
					else {
						global.players[target].hp--;
						global.turnDamage = order;
					}
				}
			}
		break;
		case "Stare":
			if(order != 2) {
				if(global.userActions[target,order+1] == "Dodge" || global.userActions[target,order+1] == "Rush")
					global.userActions[target,order+1] = global.userActions[target,order+1] + " "
			}
		break;
		case "Aim":
			user.aiming = true;
		break;
		case "Rush":
			user.rushing++;
			if(user.rushing = 2) {
				//check if you get shot
				n = 1;
				shot = false
				while(n < global.loop+1) {
					if(global.userActionTarget[n,order] == num && global.userActions[n,order] == "Shoot") {
						shot = true;
					}
					n++;
				}
				if(shot == false) {
					global.players[target].hp--;
					global.turnDamage = order;
				}
			}
	}
}