// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_load_options(){
	ini_open("Ball.sav")
	global.spacekey = ini_read_real("Save1","spacekey",vk_space);
	global.Rkey = ini_read_real("Save1","Rkey",ord("R"));
	global.Rbutton = ini_read_string("Save1","Rbutton","R");
	global.Qkey = ini_read_real("Save1","Qkey",ord("Q"));
	global.spacebutton = ini_read_string("Save1","spacebutton","Space");
	global.Qbutton = ini_read_string("Save1","Qbutton","Q");
	global.rightbutton = "RC";//ini_read_string("Save1","rightbutton","RC");
	global.mapbutton = ini_read_string("Save1","mapbutton","M");
	global.mapKey = ini_read_real("Save1","mapKey",ord("M"));
	global.backbutton = ini_read_string("Save1","backbutton","B");
	global.backKey = ini_read_real("Save1","backKey",ord("B"))
	global.shopbutton = ini_read_string("Save1","shopbutton","P");
	global.shopKey = ini_read_real("Save1","shopKey",ord("P"))
	global.binded2Right = 0;//ini_read_real("Save1","binded2Right",0);
	global.rightBinded = "right"//ini_read_string("Save1","rightBinded","right");
	global.musVolume = ini_read_real("Save1", "musicVolume", 50);
	global.vol = ini_read_real("Save1", "soundVolume", 50);
	global.shakeVol = ini_read_real("Save1", "screenShake", 1);
	ini_close()
}