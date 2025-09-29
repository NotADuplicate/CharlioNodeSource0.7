/// @description Skip tutorial, enter test mode

stage = 8;
remindingText = true;
		with(inst_utility) {
			visible = true;
		}
		//global.shopX = 1615
		global.leveled = 3;
		
		with(inst_passive) {
			x -= 4000;
		}