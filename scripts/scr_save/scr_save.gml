function scr_save(key,value) {
	if(file_exists("Ball.sav"))
		file_delete("Ball.sav")
	
	ini_open("Ball.sav")
	ini_write_real("Save1",key,value)
	ini_close()
}
