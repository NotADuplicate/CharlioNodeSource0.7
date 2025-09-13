/// @description Insert description here
// You can write your code in this editor
image_xscale = other.image_xscale/0.125;
image_yscale = other.image_yscale/0.125;
if(other.alarm[4] < 1) {//wasnt placed, was natural
	with(other) {
		instance_change(obj_soonBush,true)
	}
}
else
	instance_destroy(other);