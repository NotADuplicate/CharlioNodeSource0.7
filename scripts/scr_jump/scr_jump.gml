function scr_jump() {
	with(trump_player) {
		if(class = "Mexican") {
			if(position_meeting(x+(xspd*128),y+(yspd*128),obj_tile)) {
				if(scr_path(instance_position(x+(xspd*128),y+(yspd*128),obj_tile))) {
					x += xspd*128;
					y += yspd*128;
					scr_endTurn();
				}
			}
		}
	}


}
