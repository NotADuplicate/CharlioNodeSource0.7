// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_load_unlocks(){
	ini_open("Ball.sav")
	var i = 0;
	repeat(array_length(Abilities.list)) {
		Abilities.list[i].unlocked = ini_read_real("abilities",string(i),false);
		i++;
	}
	i = 0;
	repeat(array_length(Passives.list)) {
		show_debug_message("Passive set to locked")
		Passives.list[i].unlocked = ini_read_real("passives",string(i),false);
		i++;
	}
	i = 0;
	repeat(array_length(Abilities.gunObjs)) {
		Abilities.gunObjs[i].unlocked = ini_read_real("guns",string(i),false);
		i++;
	}
	ini_close();
}