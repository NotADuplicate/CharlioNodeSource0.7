if(sprite_index == beholder_charge_2) {
	attacking = 100;
	sprite_index = beholder_atk_2
} else if(sprite_index == beholder_charge_1) {
	sprite_index = beholder_beam_front;
	attacking = 193;
	beam = instance_create(x-5,y+5,obj_eyeBeam);
	beam.dir = 270;
}