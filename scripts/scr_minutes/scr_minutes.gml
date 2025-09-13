function scr_minutes() {
	sec = argument[0]
	minute = string(floor(sec/60));
	sec = sec%60;
	if(sec < 10) {
		sec = "0" + string(sec)
	}
	return(string(minute) +":" + string(sec))


}
