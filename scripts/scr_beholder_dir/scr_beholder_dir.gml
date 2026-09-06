function scr_beholder_dir(dir){
	dir = dir mod 360;
	if(dir < 22.5) {
		sprite_index = beholder_beam_side;
		image_xscale = 3;
		beam.x = x+51;
		beam.y = y+24;
	} else if(dir < 67.5) {
		sprite_index = beholder_beam_upright;
		image_xscale = 3;
		beam.x = x+51;
		beam.y = y+18;
	} else if(dir < 112.5) {
		sprite_index = beholder_beam_back;
		image_xscale = 3;
		beam.x = x-9;
		beam.y = y-45;
	} else if(dir < 157.5) {
		sprite_index = beholder_beam_upright;
		image_xscale = -3;
		beam.x = x-51;
		beam.y = y+18;
	} else if(dir < 202.5) {
		sprite_index = beholder_beam_side;
		image_xscale = -3;
		beam.x = x-51;
		beam.y = y+24;
	} else if(dir < 247.5) {
		sprite_index = beholder_beam_downright;
		beam.x = x-42;
		beam.y = y+39;
		image_xscale = -3;
	} else if(dir < 292.5) {
		sprite_index = beholder_beam_front;
		image_xscale = 3;
		beam.x = x-6;
		beam.y = y+55;
	} else if(dir < 337.5) {
		sprite_index = beholder_beam_downright;
		beam.x = x+42;
		beam.y = y + 39;
		image_xscale = 3;
	}
}