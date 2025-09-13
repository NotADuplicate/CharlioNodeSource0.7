/// @description Insert description here
// You can write your code in this editor
if(keyboard_lastkey != 700) { //if you arent setting it to right click do this
	if(global.rightBinded = "right")
		global.rightBinded = "";
	global.binded2Right = keyboard_lastkey;
	global.rightbutton = scr_keycode(keyboard_lastkey)
}
else { //setting it to RC
	global.rightBinded = "right";
	global.rightbutton = "RC";
}