/// @description Respawn timer and xscale
if(respawnTimer > 0 && instance_exists(obj_ending) == false) {
	respawnTimer -= (delta_time/1000000);
	if(respawnTimer < 0.5)
		respawnTimer = 0;
}

if(gunDir > 90 && gunDir < 270){
	walkDirection = -2*scale;
}
else
	walkDirection = 2*scale;
	
image_xscale = walkDirection