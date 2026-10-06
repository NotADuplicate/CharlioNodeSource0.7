if(purchasing > 0 && levels > 0) {
	purchasing = -1;
	scr_pick_level(loadout);
	if(global.testMode) {
		levels--;
	}
	if(hp < maxhp) { 
		hp += 3; 
	} else { 
		hp = maxhp;
	}
	enraged = false;
}