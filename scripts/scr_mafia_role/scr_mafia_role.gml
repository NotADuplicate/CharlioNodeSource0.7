// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_mafia_role(roleNum,playerNum){
	saveSeed = random_get_seed()
	random_set_seed(randomize())
	if(roleNum-1 < global.loop*(2/3)) { //get townie role
		global.role[playerNum] = choose("Doctor","Investigator","Lookout","Tracker")
	}
	else if(global.mafiaAmount + 1 < global.loop*.4) { //mafia
		global.role[playerNum] = "Mafia"
		global.mafiaAmount++;
	}
	else {
		global.role[playerNum] = "Jester";
	}
	random_set_seed(saveSeed)
}