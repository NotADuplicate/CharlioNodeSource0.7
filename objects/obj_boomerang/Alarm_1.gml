/// @description Insert description here
// You can write your code in this editor
with(obj_gun) {
	if(upgraded && num == other.num) {
		other.image_xscale *= 2;
		other.image_yscale *= 2;
		other.dmg *= 1.5;
	}
}
visible = true;