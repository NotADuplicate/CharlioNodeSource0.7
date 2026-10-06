// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_set_unlocks(){
	ini_open("Ball.sav")
	var i = 0;
	repeat(array_length(Abilities.list)) {
		ini_write_real("abilities",string(i),Abilities.list[i].unlocked);
		i++;
	}
	i = 0;
	repeat(array_length(Passives.list)) {
		ini_write_real("passives",string(i),Passives.list[i].unlocked);
		i++;
	}
	i = 0;
	repeat(array_length(Abilities.gunObjs)) {
		ini_write_real("guns",string(i),Abilities.gunObjs[i].unlocked);
		i++;
	}
	ini_close();
}