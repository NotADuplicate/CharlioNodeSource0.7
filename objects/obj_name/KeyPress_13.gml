// Submit name
if(string_length(keyboard_string) > 0 && typing) {
	typing = false;
	global.name = keyboard_string;
	ini_open("Ball.sav")
	ini_write_string("Save1","Name",global.name)
	ini_close()
}