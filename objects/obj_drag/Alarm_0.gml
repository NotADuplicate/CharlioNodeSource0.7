/// @description Get revived
if(!instance_exists(obj_tutorial)) {
	dead = false
	x = xpos;
	y = ypos;
	image_alpha = 1;
	hp = maxhp
	timer = deathTime;
	instance_create(0,0,spawn_marker)
}