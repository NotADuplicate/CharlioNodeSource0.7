///If not near players, destroy
dist = distance_to_object(instance_nearest(x,y,pirate_other));
if(distance_to_object(pirate_player) < dist)
	dist = distance_to_object(pirate_player);
if(dist > 500) {
	instance_change(obj_pod,true);
	with(pirate_game) {
		alarm[8] = 2;
	}
}