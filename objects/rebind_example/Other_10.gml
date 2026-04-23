/// @description Actually bind the button
selected = false;

var key = keyboard_lastkey
variable_global_set(myKey,key);

var button = scr_keycode(keyboard_lastkey)

variable_global_set(myButton,button);