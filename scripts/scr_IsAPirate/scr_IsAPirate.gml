function scr_IsAPirate(argument0) {
	seed = random_get_seed();
	numb = 1 + ((argument0+seed) mod global.loop);
	threshold = 1 + round(global.loop/3);
	if(numb < threshold)
		return(true);
	else
		return(false);


}
