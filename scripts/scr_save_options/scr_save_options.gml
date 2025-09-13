// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_save_options(){
	ini_open("Ball.sav")
	ini_write_string("Save1","rightBinded",global.rightBinded);
	ini_write_string("Save1","Qbutton",global.Qbutton);
	ini_write_real("Save1","Qkey",global.Qkey);
	ini_write_string("Save1","rightbutton",global.rightbutton);
	ini_write_real("Save1","binded2Right",global.binded2Right);
	ini_write_string("Save1","spacebutton",global.spacebutton);
	ini_write_real("Save1","spacekey",global.spacekey);
	ini_write_string("Save1","Rbutton",global.Rbutton);
	ini_write_real("Save1","Rkey",global.Rkey);
	ini_write_real("Save1","shopKey",global.shopKey);
	ini_write_string("Save1","shopbutton",global.shopbutton);
	ini_write_string("Save1","mapbutton",global.mapbutton);
	ini_write_real("Save1","mapKey",global.mapKey);
	ini_write_string("Save1","backbutton",global.backbutton);
	ini_write_real("Save1","backKey",global.backKey);
	ini_write_real("Save1", "musicVolume", global.musVolume);
	ini_write_real("Save1", "soundVolume", global.vol);
	ini_write_real("Save1", "screenShake", global.shakeVol);
	ini_close()
}