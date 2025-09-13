function scr_bandit(argument0) {
	num = argument0;
	seed = random_get_seed();
	Rnum = ((num + seed)mod global.loop)
	var threshold = round(global.loop/3)
	if(Rnum < threshold) {
		global.bandit = true;
		//game_end()
	}
	else
		global.bandit = false;
	return(Rnum)


}
