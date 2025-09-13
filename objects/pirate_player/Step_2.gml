//Die from countdown
if(global.countdown < 1) {
	if(pirate) {
		global.alive = false;
		global.loot = 0;
		instance_destroy();
	}
}




//Reload
if(reload > 0)
	reload--;
else if(dev > 3)
	dev--;
if(dev > 3)
	dev--;
if(hp < 1)
	instance_destroy();
else if(beast && hp < 80) {
	pirate_game.alarm[9] = 1;
}
	