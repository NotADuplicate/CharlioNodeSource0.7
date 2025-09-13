/// @description Insert description here
// You can write your code in this editor
if(instance_exists(pirate_player)) {
	x = pirate_player.x;
	y = pirate_player.y;
}
if(instance_exists(inst))
	image_angle = point_direction(x,y,inst.x,inst.y);
else
	instance_destroy();