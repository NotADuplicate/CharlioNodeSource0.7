/// @description Insert description here
// You can write your code in this editor
//keyboard_set_map(ord("Q"),0)
event_user(0);
/*if(global.rightBinded = "Q")
	global.rightBinded = "";
if(keyboard_lastkey != 700) 
	global.Qkey = keyboard_lastkey
else
	global.rightBinded = "Q"
global.Qbutton = scr_keycode(keyboard_lastkey)

ini_open("Ball.sav")
ini_write_string("Save1","Qbutton",global.Qbutton);
ini_write_real("Save1","Qkey",global.Qkey);
ini_write_string("Save1","rightBinded",global.rightBinded);
ini_close()