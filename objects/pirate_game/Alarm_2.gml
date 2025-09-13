///@description Countdown every second
//if(global.gen > 0) {
	global.countdown-= global.gen+1;
//}
if(global.countdown < 50 && global.countdown > 45) {
	if(instance_exists(pirate_player) == false) {
		ob = instance_create(0,0,pirate_player);
		ob.num = obj_client.index;
		ob.MTF = true;
	}
}
if(global.countdown < 100 && global.countdown > 95) {
	if(instance_exists(pirate_player) == false) {
		ob = instance_create(0,0,pirate_player);
		ob.num = obj_client.index;
		ob.MTF = true;
	}
}
if(global.countdown < 150 && global.countdown > 145) {
	if(instance_exists(pirate_player) == false) {
		ob = instance_create(0,0,pirate_player);
		ob.num = obj_client.index;
		ob.MTF = true;
	}
}
if(global.countdown > 0)
	alarm[2] = 30;