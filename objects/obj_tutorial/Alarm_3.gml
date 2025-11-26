/// @description Skip tutorial, enter test mode
passiveBought = false;
stage = 8;
remindingText = true;
alarm[6] = 450;
textScale = 1
		with(inst_utility) {
			visible = true;
		}
		//global.shopX = 1615
		global.leveled = 3;
		
		with(inst_passive) {
			x -= 4000;
		}