/// @description Insert description here
// You can write your code in this editor
alarm[1] = 450;
if(instance_exists(pirate_player)) {
	x = pirate_player.x;
	y = pirate_player.y;
}
if(instance_exists(pirate_other)) {
	inst = pirate_player;
	n = 0;
	while(n < instance_number(pirate_other)) {
		inst = scr_nearst(x,y,pirate_other,n)
		if(inst.pirate == false && inst.x != 0) {
			n = 100;
		}
		else {
			inst = pirate_player;
		}
		n++;
	}
}
else
	instance_destroy();
	
if(inst == pirate_player) {
	instance_destroy();
}