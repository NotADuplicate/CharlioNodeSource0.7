// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_clientStart(){
	if(file_exists("Ball.sav")) {
		ini_open("Ball.sav");
		global.name = ini_read_string("Save1","Name","Fella")
		var i = 0;
		var j = 0;
		show_debug_message("lOADOING lOADOUTS")
		while(i < 3) {
			while(j < 8) {
				loadoutSlot = ini_read_string("Save1", "Loadout" + string(i) + string(j),"");
				if(loadoutSlot != "") {
					if(j < 9)
						loadoutSlot = variable_instance_get(Abilities,loadoutSlot)
					if(loadoutSlot != undefined) {
						global.loadoutSet[i][j] = loadoutSlot
					}
					show_debug_message(loadoutSlot)
				}
				j++;
			}
			i++;
		}
	}
	else {
		global.name = get_string("What's your name?",choose("Nerd","Fool","Chief","Bro","Homie","King","Homeslice","Dude","Gamer"));
		while(string_length(global.name) > 12) {
		    global.name = get_string("Please select something 12 characters or less",choose("Nerd","Fool","Chief","Bro","Homie","King","Homeslice","Dude","Gamer"));
		}
		ini_open("Ball.sav")
		ini_write_string("Save1","Name",global.name)
	}
	ini_close();
}