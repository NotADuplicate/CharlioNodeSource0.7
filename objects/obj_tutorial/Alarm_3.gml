/// @description Skip tutorial, enter test mode

stage = 8;
		with(inst_utility) {
			visible = true;
		}
		//global.shopX = 1615
		global.leveled = 10;
		
		with(inst_passive) {
			x -= 4000;
		}
		
alarm[4] = 400;