/// @description Insert description here
// You can write your code in this editor
//keyboard_set_map(vk_space,0)
if(global.rightBinded = "space")
	global.rightBinded = "";
if(keyboard_lastkey != 700) 
	global.spacekey = keyboard_lastkey
else
	global.rightBinded = "space";
global.spacebutton = scr_keycode(keyboard_lastkey)