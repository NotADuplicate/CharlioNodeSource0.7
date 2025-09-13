// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_mafia_alignmet(role){
	if(role == "Jester" || role == "Survivor" || role == "Foodie") 
		return("Neutral")
	else if(role == "Mafia")
		return("Mafia")
	else
		return("Town");
}