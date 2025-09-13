/// @description Get biggened
visible = true;
with(obj_gun) {
	if(upgraded && num == other.num) {
		other.image_xscale *= 2;
		other.image_yscale *= 2;
		other.dmg *= 1.5;
	}
}