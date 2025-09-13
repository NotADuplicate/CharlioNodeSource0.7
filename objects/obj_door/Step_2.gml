///Determine distance
if(locked) { //close if locked
	dist = 100;
}
else {
	if(instance_exists(pirate_player)) {
		dist = point_distance(x,y,pirate_player.x,pirate_player.y);
	}
	else
		dist = 100;
	if(instance_exists(pirate_other)) {
		ob = instance_nearest(x,y,pirate_other);
		if(point_distance(x,y,ob.x,ob.y) < dist) {
			dist = point_distance(x,y,ob.x,ob.y);
		}
	}
}
//Open and close
	if(dist < 90 && image_xscale > 0.25) {//open
		image_xscale -= .25;
		polygon = polygon_from_instance(self);
	}
	if(dist > 90 && image_xscale < 3) {//close
		if(locked)
			image_xscale += .5;
		else
			image_xscale += .25;
		polygon = polygon_from_instance(self);
	}