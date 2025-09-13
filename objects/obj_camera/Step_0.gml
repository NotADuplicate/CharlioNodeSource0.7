///Go to player if alive
if(instance_exists(pirate_player)) {
	x = pirate_player.x;
	y = pirate_player.y
}
else if(instance_find(pirate_other,index) != noone && instance_find(pirate_other,index).x > 0) {
	ob = instance_find(pirate_other,index);
	x = ob.x;
	y = ob.y;
}
else
	index--;